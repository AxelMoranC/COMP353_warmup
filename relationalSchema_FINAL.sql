-- Create Facilities Table
CREATE TABLE Facilities (
    FacilityName VARCHAR(255) PRIMARY KEY,
    Address VARCHAR(255),
    City VARCHAR(255),
    Province VARCHAR(255),
    PostalCode VARCHAR(10),
    FacilityPhoneNumber VARCHAR(15),
    WebAddress VARCHAR(255),
    FacilityType ENUM ('Hospital', 'CLSC', 'clinic', 'pharmacy', 'special installment'),
    Capacity INTEGER
);

DROP TABLE Facilities;

-- Create Residence Table
CREATE TABLE Residence (
	PRIMARY KEY(Address,City,province,PostalCode),
    HouseType ENUM ('apartment','condominium', 'semidetached house','house'),
    Address VARCHAR(50),
    City VARCHAR(50),
    Province VARCHAR(50),
    PostalCode VARCHAR(10),
	ResidencePhoneNumber VARCHAR(15),
    AmountBedrooms INTEGER
    );

DROP TABLE Residence;


-- Create Persons Table who live with the EMployee
CREATE TABLE Persons (
    PersonID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    DateOfBirth DATE,
    SocialSecurity VARCHAR(20) NOT NULL UNIQUE,
    MedicareCard VARCHAR(20) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(15),
    Citizenship VARCHAR(50),
    Email VARCHAR(255),
	Address VARCHAR(50),
    City VARCHAR(50),	
    Province VARCHAR(50),
    PostalCode VARCHAR(10),
    StartedDateAtAddress DATE NOT NULL,
	FOREIGN KEY(Address, City, Province, PostalCode) REFERENCES Residence(Address, City, Province, PostalCode)
);

DROP TABLE Persons;

-- Create Employees Table that work for vaccination stuff
CREATE TABLE Employees (
    MedicareCard VARCHAR(20) NOT NULL,
    FacilityName VARCHAR(255) NOT NULL,
    Job ENUM 
		('nurse', 'doctor', 'cashier', 'pharmacist', 'receptionist', 'administrative personnel', 'security personnel', 'regular employee'),
    StartDate DATE,
    EndDate DATE DEFAULT NULL,
    CHECK (Job IN ('nurse', 'doctor', 'cashier', 'pharmacist', 'receptionist', 'administrative personnel', 'security personnel', 'regular employee')),
    FOREIGN KEY (MedicareCard) REFERENCES Persons(MedicareCard),
    FOREIGN KEY (FacilityName) REFERENCES Facilities(FacilityName)
);

DROP TABLE Employees;

-- Create Vaccines Table
CREATE TABLE HasVaccines (
	PersonID INTEGER,
    DateOfVaccination DATE,
    DoseNumber INTEGER, 
    Location TEXT, #Example: Olympic Stadium Montréal.
    Type VARCHAR(50),		# Pfizer, Moderna, AstraZeneca, Johnson & Johnson,
    FOREIGN KEY (PersonID) REFERENCES  Persons(PersonID)
);

DROP TABLE HasVaccines;

-- Create Infections Table
CREATE TABLE HadInfections (
    PersonID INTEGER,
    DateOfInfection DATE,
    InfectionNumber INTEGER,
	InfectionType VARCHAR(50), #Example: COVID-19, SARS-Cov-2 Variant, or other types.
	CHECK (DateOfInfection >= CURRENT_DATE), #Checks if date is valid
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

DROP TABLE HadInfections;

#_____________________________________________________
# ALL RELATIONSHIPS

-- Persons LIVES_WITH Employees
-- So, people who are not employees
CREATE TABLE LivesWithEmployee (
	MedicareCard VARCHAR(20) NOT NULL,
    PersonID INTEGER,
    Relationship ENUM ('roommate', 'partner', 'parent', 'non-parent dependent', 'children' ),
    FOREIGN KEY (MedicareCard) REFERENCES Employees(MedicareCard),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

DROP TABLE LivesWithEmployee;


-- Schedule
CREATE TABLE Schedule (
	    MedicareCard VARCHAR(20) NOT NULL,
		ScheduleID INTEGER AUTO_INCREMENT PRIMARY KEY,
        FacilityName VARCHAR(255),
        Schedule_Date DATE,
        StartTime TIME,
        EndTime TIME,
		is_no_assignment BOOLEAN NOT NULL DEFAULT FALSE,
		UNIQUE KEY (MedicareCard, FacilityName, Schedule_date),
		FOREIGN KEY(MedicareCard) REFERENCES Employees(MedicareCard),
        FOREIGN KEY(FacilityName) REFERENCES Facilities(FacilityName)
);

DROP TABLE Schedule;

-- Email
CREATE TABLE EmailLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    email_date DATETIME NOT NULL,
    sender VARCHAR(255) NOT NULL,
    receiver VARCHAR(255) NOT NULL,
    subject_email VARCHAR(255) NOT NULL,
    body VARCHAR(100) NOT NULL,
    FOREIGN KEY (sender) REFERENCES Employees(FacilityName),
    FOREIGN KEY (receiver) REFERENCES Persons(Email),
	CHECK ( -- Check if the person's email is an employee from that facility
        EXISTS (
            SELECT 1
            FROM Employees e
            JOIN Persons p ON e.MedicareCard = p.MedicareCard
            WHERE p.Email = receiver AND e.FacilityName = sender
        )
    )
);

DROP TABLE EmailLog;

-- Table for primary residence UNSURE IF WE NEED THIS, BUT MIGHT AS WELL
-- CREATE TABLE PeopleCurrentLives(
-- 	PersonID INTEGER PRIMARY KEY,
-- 	Address VARCHAR(50),
--     City VARCHAR(50),
--     Province VARCHAR(50),
--     PostalCode VARCHAR(10),  
-- 	FOREIGN KEY(HouseType, Address, City, Province, PostalCode) REFERENCES Residence(HouseType, Address, City, Province, PostalCode)

-- );

-- Table for secondary residences
CREATE TABLE ResidenceType (
	PersonID INTEGER PRIMARY KEY,
    HouseType ENUM ('apartment','condominium', 'semidetached house','house'),
	Address VARCHAR(50),
    City VARCHAR(50),
    Province VARCHAR(50),
    PostalCode VARCHAR(10), 
    ResidenceType ENUM ('Primary', 'Secondary'),
    StartDateAtAddress DATE,
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID),
	FOREIGN KEY(HouseType, Address, City, Province, PostalCode) REFERENCES Residence(HouseType, Address, City, Province, PostalCode)
);

DROP TABLE ResidenceType;
