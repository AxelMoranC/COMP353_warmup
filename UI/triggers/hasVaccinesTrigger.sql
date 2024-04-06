-- Include the Trigger to ensure valid HasVaccines and makes sense

DELIMITER $$
    CREATE TRIGGER increment_dose_number
    BEFORE INSERT ON HasVaccines
    FOR EACH ROW
    BEGIN
        DECLARE max_dose INTEGER;
        SET max_dose = (
            SELECT MAX(DoseNumber) FROM HasVaccines WHERE PersonID = NEW.PersonID
        );
        IF max_dose IS NULL THEN
            SET NEW.DoseNumber = 1;
        ELSE
            SET NEW.DoseNumber = max_dose + 1;
        END IF;
    END$$
DELIMITER ;

DROP TRIGGER IF EXISTS increment_dose_number;

DELIMITER $$
    CREATE TRIGGER validate_date_of_vaccination
    BEFORE INSERT ON HasVaccines
    FOR EACH ROW
    BEGIN
        DECLARE previous_date DATE;
        SET previous_date = (
            SELECT MAX(DateOfVaccination) FROM HasVaccines WHERE PersonID = NEW.PersonID
        );
        IF previous_date IS NOT NULL AND NEW.DateOfVaccination <= previous_date THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Date of vaccination must be after the previous dose';
        END IF;
    END$$
DELIMITER ;

DROP TRIGGER IF EXISTS validate_date_of_vaccination;