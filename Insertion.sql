-- Insert data into Persons table
INSERT INTO Persons (FirstName, LastName, DateOfBirth, SocialSecurity, MedicareCard, PhoneNumber, Address, City, Province, PostalCode, Citizenship, Email)
VALUES
  (1,'John', 'Doe', '1990-05-15', '123-45-6789', 'M987654321', '555-111-2222', '789 Oak St', 'CityA', 'ProvinceA', 'A1B 2C3', 'Canada', 'john.doe@email.com'),
  (2,'Jane', 'Smith', '1985-08-20', '456-78-9012', 'M876543210', '555-222-3333', '456 Maple St', 'CityB', 'ProvinceB', 'B2C 3D4', 'Canada', 'jane.smith@email.com'),
  (3,'Robert', 'Chen', '1980-01-15', '4024-17-0789', 'M88888888', '555-111-2222', '789 Oak St', 'CityC', 'ProvinceC', 'C3D 4E5', 'Canada', 'robert.chen@mail.concordia.ca');

-- Insert data into Facilities table
INSERT INTO Facilities (FacilityID, FacilityName, Address, City, Province, PostalCode, PhoneNumber, WebAddress, FacilityType, Capacity) VALUES
  (1, 'Hospital A', '123 Main St', 'CityA', 'ProvinceA', 'A1B 2C3', '123-456-7890', 'www.hospitala.com', 'Hospital', 200),
  (2, 'CLSC B', '456 Oak St', 'CityB', 'ProvinceB', 'B2C 3D4', '987-654-3210', 'www.clscb.com', 'CLSC', 100),
  (3, 'Lakeshore', '123 Main St', 'CityA', 'ProvinceA', 'A1B 2C3', '123-456-7890', 'www.hospitala.com', 'Hospital', 200);
-- Insert data into Residence table
INSERT INTO Residence (ResidenceID, HouseType, Address, City, Province, PostalCode, PhoneNumber, AmountBedrooms)
VALUES
  (1,'apartment', '789 Computer St', 'CityA', 'ProvinceA', 'A1B 2C3', '555-333-4444', 8),
  (2,'house', '101 George Williams St', 'CityB', 'ProvinceB', 'B2C 3D4', '555-444-5555', 3),
  (3,'condominium', '456 Concordia St', 'CityB', 'ProvinceB', 'B2C 3D4', '987-654-3210', 3);

-- Insert data into Employees table
INSERT INTO Employees (EmployeeID, PersonID, FacilityID, Job, StartDate, EndDate)
VALUES
  (1, 1, 'nurse', '2022-01-01', NULL),
  (2, 1, 'doctor', '2022-02-15', '2023-09-30'),
  (3, 2, 1, 'doctor', '2022-01-01', NULL);

-- Insert data into Vaccines table
INSERT INTO Vaccines (VaccineID, DateOfVaccination, DoseOfVaccination, Location, Type)
VALUES
  (1,'2022-03-01', 1, 'Hospital A', 'Pfizer'),
  (2,'2022-03-15', 3, 'Hospital A', 'Moderna'),
  (3,'2020-03-13', 2, 'Lakeshore', 'Johnson & Johnson');

-- Insert data into Infections table
INSERT INTO Infections (InfectionID, PersonID, InfectionType, DateOfInfection) VALUES
  (1, 1, 'COVID-19', '2022-04-01'),
  (2, 2, 'SARS-Cov-2 Variant', '2022-05-01'),
  (1, 3, 1, 'COVID-19', '2022-02-15');
