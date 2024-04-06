
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