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
        
        IF NEW.StartedDateAtAddress > CURDATE() THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'the starting date is higher...';
		END IF;
        
		IF NEW.DateOfBirth > CURDATE() THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'the starting date is higher...';
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
                            FROM Facilities WHERE FacilityID = NEW.FacilityID);
                            
        IF ((NEW.StartDate > CURDATE() AND NEW.EndDate IS NULL) OR(NEW.StartDate > CURDATE())) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid date of employee.....';
		END IF;
        
        IF (NEW.EndDate IS NOT NULL) THEN
			IF NEW.StartDate > NEW.EndDate THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid date of employee.....';
			END IF;
            
		END IF;
        
        IF (facility_id = 0 OR facility_id < 0 ) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'FacilityID does not exist in Facility table';
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



-- HadInfections
DELIMITER $$

CREATE TRIGGER prevent_old_infections

BEFORE INSERT ON HadInfections
FOR EACH ROW
BEGIN
    DECLARE today DATE;
    DECLARE max_allowed_date DATE;
    DECLARE max_infection_date DATE;
	DECLARE numOfInfections INT DEFAULT 0;
    
    -- Get today's date
    SET today = CURDATE();
	-- Get the maximum infection number for the person
    SET numOfInfections = (SELECT MAX(InfectionNumber) FROM HadInfections WHERE PersonID = NEW.PersonID);
	    -- Get the maximum vaccination date for the person
    SET max_infection_date = 
					(SELECT MAX(DateOfInfection) 
						FROM HasVaccines WHERE PersonID = NEW.PersonID AND InfectionNumber = numOfInfections);
    -- Calculate the maximum allowed date (two weeks ago)
    SET max_allowed_date = DATE_SUB(today, INTERVAL 14 DAY);


	IF NEW.DateOfInfection = CURDATE() THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot get infected twice in the same day!!!';
	END IF;
    
    -- Ensure that the new infection number is greater than the maximum infection number
    IF NEW.InfectionNumber <= numOfInfections THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Infection number must be greater than the maximum infection number for the person';
    END IF;

    -- Ensure that the new infection number is strictly an increment (+1)
    IF NEW.InfectionNumber != numOfInfections + 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Infection number must be strictly an increment (+1)';
    END IF;
    
    -- Check if the DateOfInfection is more than two weeks ago
    IF NEW.DateOfInfection < max_allowed_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot insert old infection records (more than two weeks ago)';
    END IF;
    
        -- Ensure that the new DateOfVaccination is not lower than the maximum vaccination date for the same DoseNumber
    IF NEW.DateOfInfection < max_infection_date THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Date of Infection cannot be earlier than the maximum infection date for the same infection number';
    END IF;
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS prevent_old_infections;

  
-- HasVaccines
DELIMITER $$

CREATE TRIGGER prevent_invalid_vaccinations
BEFORE INSERT ON HasVaccines
FOR EACH ROW
BEGIN
    DECLARE max_dose_number INT;
    DECLARE max_vaccination_date DATE;
    
    -- Get the maximum dose number for the person
    SET max_dose_number = (SELECT MAX(DoseNumber) FROM HasVaccines WHERE PersonID = NEW.PersonID);

    -- Ensure that the new dose number is greater than the maximum dose number
    IF NEW.DoseNumber <= max_dose_number THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dose number must be greater than the maximum dose number for the person';
    END IF;
   -- Ensure that the new infection number is strictly an increment (+1)
    IF NEW.DoseNumber != max_dose_number + 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dose number must be strictly an increment (+1)';
    END IF;
    
    -- Get the maximum vaccination date for the person
    SET max_vaccination_date = (SELECT MAX(DateOfVaccination) 
								FROM HasVaccines WHERE PersonID = NEW.PersonID AND DoseNumber = max_dose_number);

    
    -- Ensure that the new DateOfVaccination is not lower than the maximum vaccination date for the same DoseNumber
    IF NEW.DateOfVaccination < max_vaccination_date THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Date of vaccination cannot be earlier than the maximum vaccination date for the same dose number';
    END IF;
    
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS prevent_invalid_vaccinations;

