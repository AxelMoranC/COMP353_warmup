-- Create Facilities Table
CREATE TABLE Facilities (
	FacilityID INT AUTO_INCREMENT PRIMARY KEY,
    FacilityName VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    City VARCHAR(255),
    Province VARCHAR(255),
    PostalCode VARCHAR(10),
    FacilityPhoneNumber VARCHAR(15),
    WebAddress VARCHAR(255),
    FacilityType ENUM ('Hospital', 'CLSC', 'clinic', 'pharmacy', 'special installment'),
    Capacity INTEGER
);



-- Create Residence Table
CREATE TABLE Residence (
	ResidenceID INT AUTO_INCREMENT PRIMARY KEY,
    HouseType ENUM ('apartment','condominium', 'semidetached house','house'),
    Address VARCHAR(50),
    City VARCHAR(50),
    Province VARCHAR(50),
    PostalCode VARCHAR(10),
	ResidencePhoneNumber VARCHAR(15),
    AmountBedrooms INTEGER
    );




-- Create Persons Table who live with the EMployee
CREATE TABLE Persons (
    PersonID INT AUTO_INCREMENT PRIMARY KEY,
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
    FOREIGN KEY (FacilityID) REFERENCES Facilities(FacilityID)
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
        FacilityID INT,
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
