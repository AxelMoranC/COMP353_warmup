
-- Trigger used to ensure that a Person is connected to a good ResidenceID and not some random

DELIMITER $$
    CREATE TRIGGER before_insert_person
    BEFORE INSERT ON Persons
    FOR EACH ROW
    BEGIN
        DECLARE residence_count INT DEFAULT 0;
        
        SET residence_count = (SELECT COUNT(*) 
								FROM Residence WHERE ResidenceID = NEW.ResidenceID);
        
        IF residence_count = 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ResidenceID does not exist in Residence table';
        END IF;
    END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_insert_person;

-- trigger to ensure an Employee is connected to a good FacilityID and not some random shenanigans
DELIMITER $$
    CREATE TRIGGER before_insert_employee
    BEFORE INSERT ON Employees
    FOR EACH ROW
    BEGIN
        DECLARE facility_id INT DEFAULT 0;
        
        SET facility_id = (SELECT COUNT(*) 
                            FROM Facility WHERE FacilityID = NEW.FacilityID);
        
        IF (facility_id = 0 OR facility_id < 0 ) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ResidenceID does not exist in Residence table';
        END IF;
    END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_insert_employee;


-- Create a trigger to check the existence of MedicareCard in Employees table before inserting into Schedule table
DELIMITER $$
    CREATE TRIGGER before_insert_schedule
    BEFORE INSERT ON Schedule
    FOR EACH ROW
    BEGIN
        DECLARE employeeExists INT;

        -- Check if the MedicareCard exists in the Employees table
        SELECT COUNT(*) INTO employeeExists FROM Employees WHERE MedicareCard = NEW.MedicareCard;

        -- If the employee does not exist, prevent the insertion
        IF employeeExists = 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot add a schedule for a non-existing employee';
        END IF;
    END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_insert_schedule;

-- Trigger to ensure Persons Starting living date is not before
DELIMITER //
CREATE TRIGGER before_insert_person_StartedDateAtAddress
BEFORE INSERT ON Persons
FOR EACH ROW
BEGIN
    IF NEW.StartedDateAtAddress > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'StartedDateAtAddress cannot be in the future';
    END IF;
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS before_insert_person_StartedDateAtAddress;


-- Trigger to ensure that Start Time in Schedule is not bigger than End Date
DELIMITER //
CREATE TRIGGER before_insert_schedule_StartBiggerThanEnd
BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
    IF NEW.startTime > NEW.endTime THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Start time cannot be greater than end time';
    END IF;
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTs before_insert_schedule_StartBiggerThanEnd;



-- TRIGGER used to ensure the maximum allowed date (two weeks ago) and checks if the entered date of infection 
-- is not more than two weeks ago.

DELIMITER $$

CREATE TRIGGER prevent_old_infections

BEFORE INSERT ON HadInfections
FOR EACH ROW
BEGIN
    DECLARE today DATE;
    DECLARE max_allowed_date DATE;

    -- Get today's date
    SET today = CURDATE();

    -- Calculate the maximum allowed date (two weeks ago)
    SET max_allowed_date = DATE_SUB(today, INTERVAL 14 DAY);

    -- Check if the DateOfInfection is more than two weeks ago
    IF NEW.DateOfInfection < max_allowed_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot insert old infection records (more than two weeks ago)';
    END IF;
END$$

DELIMITER ;

