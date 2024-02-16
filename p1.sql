-- Create Persons Table who live with the EMployee
CREATE TABLE Persons (
    PersonID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    DateOfBirth DATE,
    SocialSecurity VARCHAR(20) UNIQUE,
    MedicareCard VARCHAR(20) UNIQUE,
    PhoneNumber VARCHAR(15),
    ResidenceID INTEGER,
    #Address VARCHAR(255),
    #City VARCHAR(255),	
    #Province VARCHAR(255),
    #PostalCode VARCHAR(10),
    Citizenship VARCHAR(50),
    Email VARCHAR(255),
    FOREIGN KEY(ResidenceID) REFERENCES Residence(ResidenceID)
);

DROP TABLE Persons;


-- Create Facilities Table
CREATE TABLE Facilities (
    FacilityID INTEGER PRIMARY KEY,
    FacilityName TEXT,
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
    ResidenceID INTEGER PRIMARY KEY,
    HouseType ENUM ('apartment','condominium', 'semidetached house','house'),
    Address VARCHAR(255),
    City VARCHAR(255),
    Province VARCHAR(255),
    PostalCode VARCHAR(10),
	ResidencePhoneNumber VARCHAR(15),
    AmountBedrooms INTEGER
);

DROP TABLE Residence;


-- Create Employees Table that work for vaccination stuff
CREATE TABLE Employees (
    EmployeeID INTEGER PRIMARY KEY,
    PersonID INTEGER,
    FacilityID INTEGER,
    ResidenceID INTEGER,
    Job ENUM 
		('nurse', 'doctor', 'cashier', 'pharmacist', 'receptionist', 'administrative personnel', 'security personnel', 'regular employee'),
    StartDate DATE,
    EndDate DATE DEFAULT NULL,
   # CHECK (Job IN ('nurse', 'doctor', 'cashier', 'pharmacist', 'receptionist', 'administrative personnel', 'security personnel', 'regular employee')),
   # CHECK ((PersonID IS NOT NULL AND FacilityID IS NOT NULL) OR (PersonID IS NULL AND FacilityID IS NULL)),
    FOREIGN KEY (ResidenceID) REFERENCES Residence(ResidenceID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID),
    FOREIGN KEY (FacilityID) REFERENCES Facilities(FacilityID)
);

DROP TABLE Employees;

-- Create Vaccines Table
CREATE TABLE Vaccines (
	PersonID INTEGER,
    VaccineID INTEGER, 
    DateOfVaccination DATE,
    DoseNumber INTEGER, 
    Location TEXT, #Example: Olympic Stadium Montréal.
    Type VARCHAR(50),		# Pfizer, Moderna, AstraZeneca, Johnson & Johnson,
    FOREIGN KEY (PersonID) REFERENCES  Persons(PersonID)
    #FOREIGN KEY (VaccineID) REFERENCES Persons(PersonID)
);

DROP TABLE Vaccines;

-- Create Infections Table
CREATE TABLE Infections (
    PersonID INTEGER,
    DateOfInfection DATE,
    InfectionNumber INTEGER,
	InfectionType VARCHAR(50), #Example: COVID-19, SARS-Cov-2 Variant, or other types.
	CHECK (DateOfInfection <= CURRENT_DATE), #Checks if date is valid
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

DROP TABLE Infections;

#_____________________________________________________
# ALL RELATIONSHIPS

CREATE TABLE WorksAtFacility (
    EmployeeID INTEGER,
    FacilityID INTEGER,
    PRIMARY KEY (EmployeeID, FacilityID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (FacilityID) REFERENCES Facilities(FacilityID)
);

-- Persons LIVES_WITH Employees
CREATE TABLE LivesWithEmployee (
	PRIMARY KEY (EmployeeID, PersonID),
	EmployeeID INTEGER,
    PersonID INTEGER,
    Relationship TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

DROP TABLE LivesWithEmployee;

-- Persons HAS_VACCINES
CREATE TABLE HasVaccines (
    PersonID INTEGER,
    VaccineID INTEGER,
    PRIMARY KEY (PersonID, VaccineID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID),
    FOREIGN KEY (VaccineID) REFERENCES Vaccines(VaccineID)
);

-- Persons HAS_INFECTIONS
CREATE TABLE HasInfections (
    PersonID INTEGER,
    InfectionID INTEGER,
    PRIMARY KEY (PersonID, InfectionID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID),
    FOREIGN KEY (InfectionID) REFERENCES Infections(InfectionID)
);