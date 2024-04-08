SHOW TRIGGERS;
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
						FROM HadInfections WHERE PersonID = NEW.PersonID AND InfectionNumber = numOfInfections);
    -- Calculate the maximum allowed date (two weeks ago)
    SET max_allowed_date = DATE_SUB(today, INTERVAL 14 DAY);


	IF NEW.DateOfInfection = CURDATE() AND max_infection_date = NEW.DateOfInfection THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot get infected twice in the same day!!!';
	END IF;
    
    -- Ensure that the new infection number is greater than the maximum infection number
    IF numOfInfections IS NOT NULL AND NEW.InfectionNumber <= numOfInfections THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Infection number must be greater than the maximum infection number for the person';
    END IF;

    -- Ensure that the new infection number is strictly an increment (+1)
    IF numOfInfections IS NOT NULL AND NEW.InfectionNumber != numOfInfections + 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Infection number must be strictly an increment (+1)';
    END IF;
    
    -- Check if the DateOfInfection is more than two weeks ago
    IF NEW.DateOfInfection < max_allowed_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot insert old infection records (more than two weeks ago)';
    END IF;
    
        -- Ensure that the new DateOfVaccination is not lower than the maximum vaccination date for the same DoseNumber
    IF max_infection_date IS NOT NULL AND NEW.DateOfInfection <= max_infection_date THEN
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
    IF max_dose_number IS NOT NULL AND NEW.DoseNumber <= max_dose_number THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dose number must be greater than the maximum dose number for the person';
    END IF;
   -- Ensure that the new infection number is strictly an increment (+1)
    IF max_dose_number IS NOT NULL AND NEW.DoseNumber != max_dose_number + 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dose number must be strictly an increment (+1)';
    END IF;
    
    -- Get the maximum vaccination date for the person
    SET max_vaccination_date = (SELECT MAX(DateOfVaccination) 
								FROM HasVaccines WHERE PersonID = NEW.PersonID AND DoseNumber = max_dose_number);

    
    -- Ensure that the new DateOfVaccination is not lower than the maximum vaccination date for the same DoseNumber
    IF max_vaccination_date  IS NOT NULL AND NEW.DateOfVaccination < max_vaccination_date THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Date of vaccination cannot be earlier than the maximum vaccination date for the same dose number';
    END IF;
    
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS prevent_invalid_vaccinations;