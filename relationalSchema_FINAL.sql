-- Create Residence Table
CREATE TABLE Residence (
	PRIMARY KEY(ResidenceID, PostalCode),
	ResidenceID INT AUTO_INCREMENT,
    HouseType ENUM ('apartment','condominium', 'semidetached house','house'),
    Address VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Province VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(10) NOT NULL UNIQUE,
	ResidencePhoneNumber VARCHAR(15),
    AmountBedrooms INTEGER
    );



-- Create Persons Table who live with the EMployee
CREATE TABLE Persons (
	PRIMARY KEY(PersonID,SocialSecurity,MedicareCard),
    PersonID INT AUTO_INCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
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
    ResidenceID INT,
    StartedDateAtAddress DATE NOT NULL,
	FOREIGN KEY(ResidenceID) REFERENCES Residence(ResidenceID)
);



-- Create Employees Table that work for vaccination stuff
CREATE TABLE Employees (
    MedicareCard VARCHAR(20) NOT NULL,
    FacilityID INT,
    Job ENUM 
		('nurse', 'doctor', 'cashier', 'pharmacist', 'receptionist', 'administrative personnel', 'security personnel', 'regular employee'),
    StartDate DATE,
    EndDate DATE DEFAULT NULL,
    FOREIGN KEY (MedicareCard) REFERENCES Persons(MedicareCard),
    FOREIGN KEY (FacilityID) REFERENCES Facilities(FacilityID),
    CONSTRAINT no_overlapping_dates CHECK (EndDate IS NULL OR StartDate < EndDate)
);



-- Create Vaccines Table
CREATE TABLE HasVaccines (
	PersonID INTEGER,
    DateOfVaccination DATE,
    DoseNumber INTEGER, 
    Location TEXT, #Example: Olympic Stadium Montréal.
    Type VARCHAR(50),		# Pfizer, Moderna, AstraZeneca, Johnson & Johnson,
    FOREIGN KEY (PersonID) REFERENCES  Persons(PersonID)
);



-- Create Infections Table
CREATE TABLE HadInfections (
    PersonID INTEGER,
    DateOfInfection DATE,
    InfectionNumber INTEGER,
	InfectionType VARCHAR(50), 
	#CHECK (DateOfInfection >= CURRENT_DATE), 
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);



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




-- Schedule
CREATE TABLE Schedule (
	    MedicareCard VARCHAR(20) NOT NULL,
		ScheduleID INTEGER AUTO_INCREMENT PRIMARY KEY,
        FacilityID INT NOT NULL,
        Schedule_Date DATE,
        StartTime TIME,
        EndTime TIME,
		is_no_assignment BOOLEAN NOT NULL DEFAULT FALSE,
		UNIQUE KEY (MedicareCard, FacilityID, Schedule_date),
		FOREIGN KEY(MedicareCard) REFERENCES Employees(MedicareCard),
        FOREIGN KEY(FacilityID) REFERENCES Facilities(FacilityID)
);



-- Email
CREATE TABLE EmailLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    email_date DATETIME NOT NULL,
    sender INT NOT NULL,
    receiver INT NOT NULL,
    subject_email VARCHAR(255) NOT NULL,
    body VARCHAR(100) NOT NULL,
    FOREIGN KEY (sender) REFERENCES Facilities(FacilityID),
    FOREIGN KEY (receiver) REFERENCES Persons(PersonID)
);


-- Table for secondary residences
CREATE TABLE SecondaryResidence (
	PersonID INTEGER,
    ResidenceID INT,
    ResidenceType ENUM ('Primary', 'Secondary'),
    StartDateAtAddress DATE,
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID),
	FOREIGN KEY(ResidenceID) REFERENCES Residence(ResidenceID)
);