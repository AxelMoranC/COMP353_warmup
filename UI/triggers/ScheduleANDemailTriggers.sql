DELIMITER $$

CREATE TRIGGER before_schedule_insert_update
BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
    DECLARE employee_vaccinated BOOLEAN;
    DECLARE vaccine_received_date DATE;

    -- Check if the employee is vaccinated
    SELECT EXISTS (
        SELECT 1
        FROM HasVaccines H
        JOIN Persons P ON P.PersonID = H.PersonID
        JOIN Employees E ON E.MedicareCard = P.MedicareCard
        WHERE MedicareCard = NEW.MedicareCard
    ) INTO employee_vaccinated;

    IF employee_vaccinated THEN
        -- Retrieve the date of the latest COVID-19 vaccine received by the employee
        SELECT MAX(DateOfVaccination)
        INTO vaccine_received_date
        FROM HasVaccines H
		JOIN Persons P ON P.PersonID = H.PersonID
        JOIN Employees E ON E.MedicareCard = P.MedicareCard
        WHERE MedicareCard = NEW.MedicareCard;

        -- Check if the latest vaccine was received within the past six months
        IF vaccine_received_date <= DATE_SUB(NEW.Schedule_Date, INTERVAL 6 MONTH) THEN
            -- Prevent the schedule insertion/update
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Employee is not vaccinated with a COVID-19 vaccine in the past six months.';
        END IF;
    ELSE
        -- Prevent the schedule insertion/update
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employee is not vaccinated with a COVID-19 vaccine.';
    END IF;
END$$

DELIMITER ;


DROP TRIGGER IF EXISTS before_schedule_insert_update;



-- TRIGGER FOR THIS CONDITION:
--  If an employee 
-- is scheduled for two different periods on the same day either at the same facility or at different 
-- facilities, then at least two hours should be the duration between the first schedule and the second 
-- one. The history of the schedules is maintained by the system. A schedule of four weeks ahead of 
-- time is supported by the system
DELIMITER $$
CREATE TRIGGER support_four_weeks_ahead
BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
    DECLARE max_allowed_date DATE;

    -- Calculate the maximum allowed date (four weeks ahead of the current date)
    SET max_allowed_date = DATE_ADD(CURDATE(), INTERVAL 4 WEEK);

    -- Check if the scheduled date is within the allowed range
    IF NEW.Schedule_Date > max_allowed_date THEN
        -- Prevent the insertion of the new schedule
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Scheduling four weeks ahead of time is not supported.';
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS support_four_weeks_ahead


--Ensure 2 hour gap
DELIMITER $$
CREATE TRIGGER two_hour_gap_between_work
BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
    DECLARE existing_schedule_amount INT;
    DECLARE previous_end_time TIME;

    -- Count the number of existing schedules for the same employee on the same day
    SELECT COUNT(*)
    INTO existing_schedule_amount
    FROM Schedule
    WHERE MedicareCard = NEW.MedicareCard
    AND Schedule_Date = NEW.Schedule_Date
    AND FacilityID = NEW.FacilityID
    AND (EndTime > NEW.StartTime);

    IF existing_schedule_count > 0 THEN
        -- Get the end time of the latest schedule for the same employee on the same day
        SELECT EndTime
        INTO previous_end_time
        FROM Schedule
        WHERE MedicareCard = NEW.MedicareCard
        AND Schedule_Date = NEW.Schedule_Date
        AND FacilityID = NEW.FacilityID
        ORDER BY EndTime DESC
        LIMIT 1;

        -- Check if the gap between the previous schedule and the new one is less than two hours
        IF TIMEDIFF(NEW.StartTime, previous_end_time) < '02:00:00' THEN
            -- Prevent the insertion of the new schedule
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'At least two hours gap is required between consecutive schedules on the same day.';
        END IF;
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS two_hour_gap_between_work;