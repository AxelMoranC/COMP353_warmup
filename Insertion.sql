-- Insert data into Persons table
INSERT INTO Persons (PersonID, FirstName, LastName, DateOfBirth, SocialSecurity, MedicareCard, PhoneNumber, Citizenship, Email) VALUES
  (1,'John', 'Doe', '1990-05-15', '123456789', 'M987654321', '514-206-1720', 'Canadian', 'john.doe@gmail.com'),
  (2,'Marquez', 'Valdes', '1985-08-20', '124567890', 'M876543210', '514-262-3333','Canadian', 'marquez.valdes@gmail.com'),
  (3,'Robert', 'Camacho', '2000-03-01', '402417090', 'M888888888', '514-292-1611', 'Canadian', 'robert.camacho@mail.concordia.ca'),
  (4,'Axel', 'James', '2001-04-28', '402567891', 'M888888880', '514-268-3456', 'Canadian', 'axel.james@yahoo.com'),
  (5,'Gigi', 'Hudda', '1958-07-15', '412876987', 'M888888800', '438-986-1211', 'Canadian', 'gigi.hudda@gmail.com'),
  (6,'Blind', 'Spot', '1963-06-20', '433456781', 'M123456780', '438-700-1513',  'French', 'blind.spot@gmail.com'),
  (7,'Jonathan', 'Jababo', '1968-08-24', '245678910', 'M669876541', '418-089-3690',  'Canadian', 'jonathan.jababo@gmail.com'),
  (8,'Joseph', 'Joestar', '1989-12-25', '876543219', 'M09876231', '514-262-3334','Canadian', 'joseph.joestar@hotmail.com'),
  (9,'Juba', 'Smith', '1974-05-08', '111111111', 'M881234567', '450-671-1911',  'American', 'SmithAlways@outlook.com'),
  (10,'Shanvin', 'Luo', '1999-01-01', '678456782', 'M098734561', '514-262-3335','American', 'CuO_1245@gmail.com'),
  (11,'Roburnto', 'David', '1956-11-11', '314562345', 'M876543211', '514-262-3338', 'Peruvian', 'rob123@gmail.com'),
  (12,'Timothy', 'Wang', '1999-01-21', '688954612', 'M1 ', '514-333-4444','Canadian', 'Timothy.Wang@gmail.com'),
  (13,'Francois', 'Lacelle', '1978-10-10', '229031456', 'M2 ', '438-383-6785','Canadian', 'Francois_Lacelle@gmail.com'),
  (14,'Anthony', 'Dumont', '1960-12-12', '196012121', 'M3 ', '450-665-1819', 'American', 'Anthony.Dumont@mail.concordia.com'),
  (15,'Anna', 'Labella', '1984-05-12', '198405128', 'M4 ', '438-448-5957', 'Peruvian', 'Anna_Labella@hotmail.com');

 -- Insert data into Residence table
INSERT INTO Residence (ResidenceID, HouseType, Address, City, Province, PostalCode, ResidencePhoneNumber, AmountBedrooms) VALUES
  (1,'apartment', '123 West', 'Montreal', 'Quebec', 'H4S 3L4', '514-333-4444', 8),
  (2,'house', '456 Maple', 'Laval', 'Quebec', 'G12 J37', '418-444-5555', 3),
  (3,'apartment', '1210 George', 'LaSalle', 'Quebec', 'H7N 1LN', '438-383-6785', 1),
  (4,'house', '457 West', 'Montreal', 'Quebec', 'G12 J38', '450-665-1819', 9),
  (5,'condominium', '458 Coconut', 'Montreal', 'H9S 335', 'A1B 2C3', '514-210-1865', 6),
  (6,'house', '007 Lemieux', 'Montreal', 'Quebec', 'J89 L7N', '514-419-4380', 1),
  (7,'semidetached house', '661 Croissant', 'Sherbrooke', 'Quebec', 'H12 J37', '438-113-4466', 2),
  (8,'house', '420 Wolly' , 'London', 'Ontario', 'B2C 3D4', '438-448-5957', 3),
  (9,'condominium', '785 Williams', 'Buffalo', 'New York', 'GI8 ZNI', '418-654-3210', 3),
  (10,'house', '978 Loyola', 'Seattle', 'Washington', 'H4S 3L5', '438-967-1285', 3),
  (11,'condominium', '745 Campusia', 'Lima', 'Lima', '78Z N89', '228-552-3218', 3);
  
-- Insert data into Facilities table
INSERT INTO Facilities (FacilityID, FacilityName, Address, City, Province, PostalCode, FacilityPhoneNumber, WebAddress, FacilityType, Capacity) VALUES
  (1, 'Hospital Maisonneuve Rosemont', '785 Sherbrooke', 'Montreal', 'Quebec', 'H9S 7N8', '514-666-7894', 'www.maisonneuveRosemont.com', 'Hospital', 2000),
  (2, 'CLSC H', '466 Oak St', 'London', 'Ontario', 'B2C 3D4', '987-654-3210', 'www.clscb.com', 'CLSC', 750),
  (3, 'Lakeshore', '123 Regis', 'St-Laurent', 'Quebec', 'H77 3N4', '514-456-7890', 'www.hospitaliaa.com', 'Hospital', 900),
  (4, 'Justine', '2267 Nobel', 'LaSalle', 'Quebec', 'H9S 5S6', '514-324-8917', 'www.SaintJustine.com', 'Hospital', 600), 
  (5, 'UniDollar', '245 Catherine', 'Montreal', 'Quebec', 'H8Z N34', '438-865-1234', 'www.uniprix.com', 'Pharmacy', 50); 
  
  
-- Insert data into Employees table
INSERT INTO Employees (EmployeeID, PersonID, FacilityID, ResidenceID, Job, StartDate, EndDate) VALUES
  (40061543, 1, 2, 1,'nurse', '2022-01-01', NULL),
  (40000000, 2, 2, 2,'doctor', '2012-02-15', '2023-09-30'),
  (40111111, 3, 1, 3,'cashier', '2020-03-13', NULL),
  (40000020, 4, 5, 4,'pharmacist', '2016-11-30', NULL),
  (40000036, 5, 3, 5,'doctor', '2022-08-21', '2023-09-30'),
  (40000147, 6, 1, 6,'doctor', '1998-01-24', NULL),
  (40000058, 7, 4, 7,'nurse', '2024-08-17', NULL),
  (40241588, 8, 1, 8, 'administrative personnel', '2019-04-28', '2023-05-02'),
  (40000082, 9, 1, 9,'cashier', '2023-01-01', NULL),
  (40251234, 10, 3, 10,'nurse', '2016-07-15', '2022-08-25'),
  (40000066, 11, 5, 11,'pharmacist', '2022-02-15', '2024-02-18');


-- Insert data into Vaccines table
INSERT INTO Vaccines (PersonID, DateOfVaccination, DoseNumber, Location, Type)
VALUES
  (1,'2022-03-01', 1, 'UniDollar', 'Pfizer'),
  (2,'2022-03-15', 1, 'UniDollar', 'Moderna'),
  (3,'2020-03-13', 1, 'Lakeshore', 'Johnson & Johnson'),
  (4, '2020-05-18', 1, 'UniDollar', 'Pfizer'),
  (4,'2020-11-15', 2, 'UniDollar', 'Pfizer'),
  (4,'2021-05-18', 3, 'UniDollar', 'Pfizer'),
  (5,'2021-11-15', 1, 'Hospital Maisonneuve Rosemont', 'Moderna'),
  (6,'2021-08-23', 1, 'CLSC H', 'Moderna'),
  (8,'2020-09-30', 1, 'Lakeshore', 'Johnson & Johnson'),
  (9,'2023-10-01', 1, 'CLSC H', 'Pfizer'),
  (10,'2020-12-07', 1, 'Justine', 'Moderna'),
  (11,'2021-04-14', 1, 'Lakeshore', 'Moderna'),
  (12,'2022-03-01', 1, 'Hospital Maisonneuve Rosemont', 'Pfizer'),
  (13,'2022-05-06', 1, 'Justine', 'Moderna'),
  (4,'2021-11-15', 4, 'UniDollar', 'Pfizer'),
  (15,'2022-03-15', 1, 'Hospital Maisonneuve Rosemont', 'Moderna'),
  (10,'2020-03-13', 2, 'Lakeshore', 'Johnson & Johnson');

-- Insert data into Infections table
INSERT INTO Infections (PersonID, DateOfInfection, InfectionNumber, InfectionType) VALUES
  (1, '2022-04-01', 1, 'COVID-19'),
  (2, '2021-05-01', 1, 'SARS-Cov-2 Variant'),
  (1, '2022-12-19', 2, 'COVID-19'),
  (2, '2022-05-01', 2, 'SARS-Cov-2 Variant'),
  (1, '2024-01-15', 3, 'COVID-19'),
  (3, '2022-05-01', 1, 'SARS-Cov-2 Variant'),
  (4, '2022-04-11', 1, 'COVID-19'),
  (5, '2020-03-16', 1, 'SARS-Cov-2 Variant'),
  (6, '2021-07-28', 1, 'COVID-19'),
  (7, '2024-02-14', 1, 'SARS-Cov-2 Variant'),
  (8, '2022-02-15', 1, 'COVID-19'),
  (8, '2023-02-15', 2, 'COVID-19'),
  (15, '2023-11-15', 1, 'COVID-19'),
  (15, '2024-02-15', 2, 'COVID-19'),
  (6, '2021-09-23', 1, 'COVID-19');


 -- Insert data for people that lives with some employees
INSERT INTO LivesWithEmployee (EmployeeID, PersonID) VALUES
	(40061543,12),
    (40111111,13),
    (40000020,14),
    (40241588,15);