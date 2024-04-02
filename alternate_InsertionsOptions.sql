 -- Insert data into Residence table
INSERT INTO Residence (HouseType, Address, City, Province, PostalCode, ResidencePhoneNumber, AmountBedrooms) VALUES
  ('apartment', '123 West', 'Montreal', 'Quebec', 'H4S 3L4', '514-333-4444', 8),
  ('house', '456 Maple', 'Laval', 'Quebec', 'G12 J37', '418-444-5555', 3),
  ('apartment', '1210 George', 'LaSalle', 'Quebec', 'H7N 1LN', '438-383-6785', 1),
  ('house', '457 West', 'Montreal', 'Quebec', 'G12 J38', '450-665-1819', 9),
  ('condominium', '458 Coconut', 'Montreal', 'H9S 335', 'A1B 2C3', '514-210-1865', 6),
  ('house', '007 Lemieux', 'Montreal', 'Quebec', 'J89 L7N', '514-419-4380', 1),
  ('semidetached house', '661 Croissant', 'Sherbrooke', 'Quebec', 'H12 J37', '438-113-4466', 2),
  ('house', '420 Wolly' , 'London', 'Ontario', 'B2C 3D4', '438-448-5957', 3),
  ('condominium', '785 Williams', 'Buffalo', 'New York', 'GI8 ZNI', '716-654-3210', 3),
  ('house', '978 Loyola', 'Seattle', 'Washington', 'H4S 3L5', '438-967-1285', 3),
  ('condominium', '745 Campusia', 'Lima', 'Lima', '78Z N89', '228-552-3218', 3),
  ('condominium', '228 Elm', 'Montreal', 'Quebec', 'H4S 1L2', '514-111-2222', 2),
  ('apartment', '567 Oak', 'Laval', 'Quebec', 'G45 J89', '450-333-4444', 3),
  ('house', '890 Pine', 'LaSalle', 'Quebec', 'H7N 2LN', '438-555-6666', 4),
  ('semidetached house', '234 Birch', 'Montreal', 'Quebec', 'G12 K78', '514-777-8888', 3),
  ('condominium', '321 Daisy', 'Montreal', 'Quebec', 'HHI 3JK', '716-987-6543', 2),
  ('apartment', '876 Sunflower', 'Ottawa', 'Ontario', 'G6T 7Y8', '206-123-4567', 1),
  ('house', '543 Tulip', 'Lima', 'Lima', '78Z N87', '511-456-7890', 4);
  
  -- Insert more data into Residence table
INSERT INTO Residence (HouseType, Address, City, Province, PostalCode, ResidencePhoneNumber, AmountBedrooms) VALUES
  ('house', '789 Elm St', 'Montreal', 'Quebec', 'H8S 2J4', '514-555-1234', 4),
  ('apartment', '456 Pine St', 'Toronto', 'Ontario', 'M2N 3A6', '514-777-2345', 2),
  ('condominium', '321 Oak St', 'Vancouver', 'British Columbia', 'V6B 2J4', '438-888-3456', 3),
  ('house', '987 Maple St', 'Calgary', 'Alberta', 'T2P 1E4', '450-999-5678', 5),
  ('apartment', '654 Cedar St', 'Ottawa', 'Ontario', 'K1P 5H1', '514-333-8765', 1);



-- Insert data into Facilities table
INSERT INTO Facilities (FacilityName, Address, City, Province, PostalCode, FacilityPhoneNumber, WebAddress, FacilityType, Capacity) VALUES
  ('Hospital Maisonneuve Rosemont', '785 Sherbrooke', 'Montreal', 'Quebec', 'H9S 7N8', '514-666-7894', 'www.maisonneuveRosemont.com', 'Hospital', 200),
  ('CLSC H', '466 Oak St', 'London', 'Ontario', 'B2C 3D4', '987-654-3210', 'www.clscb.com', 'CLSC', 75),
  ('Lakeshore', '123 Regis', 'St-Laurent', 'Quebec', 'H77 3N4', '514-456-7890', 'www.hospitaliaa.com', 'Hospital', 900),
  ('Justine', '2267 Nobel', 'LaSalle', 'Quebec', 'H9S 5S6', '514-324-8917', 'www.SaintJustine.com', 'clinic', 6), 
  ('UniDollar', '245 Catherine', 'Montreal', 'Quebec', 'H8Z N34', '438-865-1234', 'www.uniprix.com', 'Pharmacy', 50),
  ('General Hospital', '123 Main ', 'Montreal', 'Quebec', 'H9S 5R4', '514-123-4567', 'www.generalhospital.com', 'Hospital', 500),
  ('Faubourg Clinic', '789 Ouest', 'Laval', 'Quebec', 'H45 J89', '450-987-6543', 'www.faubourgclinic.com', 'CLSC', 125),
  ('Sunset Center', '538 Melo St', 'Buffalo', 'New York', 'G7N 2LN', '716-567-8901', 'www.sunsetcenter.com', 'special installment', 3),
  ('Green Pharmacy', '890 Birch ', 'Montreal', 'Quebec', 'H23 K78', '514-214-6678', 'www.greenpharmacy.com', 'Pharmacy', 10),
  ('Santiago Bernabeu', '901 Suarez ', 'Lima', 'Lima', 'H9S 3H5', '514-345-6789', 'www.santiagobernabeu.com', 'CLSC', 5);

-- Insert more data into Facilities table
INSERT INTO Facilities (FacilityName, Address, City, Province, PostalCode, FacilityPhoneNumber, WebAddress, FacilityType, Capacity) VALUES
  ('Healthy Living Clinic', '101 Main St', 'Vancouver', 'British Columbia', 'V6B 3N4', '604-123-4567', 'www.healthylivingclinic.com', 'Clinic', 150),
  ('Sunrise Pharmacy', '789 Sunset Blvd', 'Toronto', 'Ontario', 'M4C 5H7', '416-987-6543', 'www.sunrisepharmacy.com', 'Pharmacy', 50),
  ('Safe Haven Hospital', '456 Safe Haven Ave', 'Calgary', 'Alberta', 'T1X 0L3', '403-555-7890', 'www.safehavenhospital.com', 'Hospital', 500);

-- Insert data into Persons table
-- INSERT INTO Persons (PersonID, FirstName, LastName, DateOfBirth, SocialSecurity, MedicareCard, PhoneNumber, Citizenship, Email, ResidenceID) VALUES
--   (1,'John', 'Doe', '1990-05-15', '123456789', 'M987654321', '514-206-1720', 'Canadian', 'john.doe@gmail.com', 1),
--   (2,'Marquez', 'Valdes', '1985-08-20', '124567890', 'M876543210', '514-262-3333','Canadian', 'marquez.valdes@gmail.com', 2),
--   (3,'Robert', 'Camacho', '2000-03-01', '402417090', 'M888888888', '514-292-1611', 'Canadian', 'robert.camacho@mail.concordia.ca', 3),
--   (4,'Axel', 'James', '2001-04-28', '402567891', 'M888888880', '514-268-3456', 'Canadian', 'axel.james@yahoo.com', 4),
--   (5,'Gigi', 'Hudda', '1958-07-15', '412876987', 'M888888800', '438-986-1211', 'Canadian', 'gigi.hudda@gmail.com', 5),
--   (6,'Blind', 'Spot', '1963-06-20', '433456781', 'M123456780', '438-700-1513',  'French', 'blind.spot@gmail.com', 6),
--   (7,'Jonathan', 'Jababo', '1968-08-24', '245678910', 'M669876541', '418-089-3690',  'Canadian', 'jonathan.jababo@gmail.com', 7),
--   (8,'Joseph', 'Joestar', '1989-12-25', '876543219', 'M098762315', '514-262-3334','Canadian', 'joseph.joestar@hotmail.com', 8),
--   (9,'Juba', 'Smith', '1974-05-08', '111111111', 'M881234567', '450-671-1911',  'American', 'SmithAlways@outlook.com', 9),
--   (10,'Shanvin', 'Luo', '1999-01-01', '678456782', 'M098734561', '514-262-3335','American', 'CuO_1245@gmail.com', 10),
--   (11,'Roburnto', 'David', '1956-11-11', '314562345', 'M876543211', '514-262-3338', 'Peruvian', 'rob123@gmail.com', 11),
--   (12,'Timothy', 'Wang', '1999-01-21', '688954612', 'M1', '514-333-4444','Canadian', 'Timothy.Wang@gmail.com',  1),
--   (13,'Francois', 'Lacelle', '1978-10-10', '229031456', 'M2', '438-383-6785','Canadian', 'Francois_Lacelle@gmail.com', 3),
--   (14,'Anthony', 'Dumont', '1960-12-12', '196012121', 'M3', '450-665-1819', 'American', 'Anthony.Dumont@mail.concordia.com', 4),
--   (15,'Anna', 'Labella', '1984-05-12', '198405128', 'M4', '438-448-5957', 'Peruvian', 'Anna_Labella@hotmail.com', 8),
--   (16,'Eva', 'Mendez', '1982-09-30', '332211445', 'M5', '514-345-6789', 'Canadian', 'eva.mendez@gmail.com', 11),
--   (17,'Carlos', 'Rodriguez', '1995-06-12', '443322116', 'M112233445', '450-789-0123', 'Canadian', 'carlos.rodriguez@gmail.com',13),
--   (18,'Linda', 'Turner', '1970-03-25', '554433226', 'M224466880', '716-123-4567', 'American', 'linda.turner@gmail.com', 14),
--   (19,'Kevin', 'Baker', '1988-11-18', '665544337', 'M559911778', '514-789-0123', 'Canadian', 'kevin.baker@gmail.com', 15),
--   (20,'Sophie', 'Williams', '2000-05-02', '776655448', 'M6', '438-234-5678', 'Canadian', 'sophie.williams@gmail.com', 1),
--   (21,'Jack', 'Perry', '1984-07-18', '887766559', 'M7', '716-890-1234', 'American', 'jack.perry@gmail.com', 9),
--   (22,'Diana', 'Lopez', '1992-02-11', '998877660', 'M660022116', '819-123-4567', 'Canadian', 'diana.lopez@gmail.com', 22),
--   (23,'Alan', 'Scott', '1978-09-05', '009988771', 'M8', '514-234-5678', 'Canadian', 'alan.scott@gmail.com', 22),
--   (24,'Olivia', 'Clark', '1985-12-20', '110022334', 'M334455660', '716-345-6789', 'Canadian', 'olivia.clark@gmail.com', 20),
--   (25,'Daniel', 'Evans', '1996-04-06', '221133446', 'M9', '206-567-8901', 'Canadian', 'daniel.evans@gmail.com',10);

-- Insert data into Persons table
INSERT INTO Persons (PersonID, FirstName, LastName, DateOfBirth, SocialSecurity, MedicareCard, PhoneNumber, Citizenship, Email, Address, City, Province, PostalCode) VALUES
  (1,'John', 'Doe', '1990-05-15', '123456789', 'M987654321', '514-206-1720', 'Canadian', 'john.doe@gmail.com', '123 West', 'Montreal', 'Quebec', 'H4S 3L4'),
  (2,'Marquez', 'Valdes', '1985-08-20', '124567890', 'M876543210', '514-262-3333','Canadian', 'marquez.valdes@gmail.com', '456 Maple', 'Laval', 'Quebec', 'G12 J37'),
  (3,'Robert', 'Camacho', '2000-03-01', '402417090', 'M888888888', '514-292-1611', 'Canadian', 'robert.camacho@mail.concordia.ca', '1210 George', 'LaSalle', 'Quebec', 'H7N 1LN'),
  (4,'Axel', 'James', '2001-04-28', '402567891', 'M888888880', '514-268-3456', 'Canadian', 'axel.james@yahoo.com', '457 West', 'Montreal', 'Quebec', 'G12 J38'),
  (5,'Gigi', 'Hudda', '1958-07-15', '412876987', 'M888888800', '438-986-1211', 'Canadian', 'gigi.hudda@gmail.com', '458 Coconut', 'Montreal', 'H9S 335', 'A1B 2C3'),
  (6,'Blind', 'Spot', '1963-06-20', '433456781', 'M123456780', '438-700-1513',  'French', 'blind.spot@gmail.com', '007 Lemieux', 'Montreal', 'Quebec', 'J89 L7N'),
  (7,'Jonathan', 'Jababo', '1968-08-24', '245678910', 'M669876541', '418-089-3690',  'Canadian', 'jonathan.jababo@gmail.com', '661 Croissant', 'Sherbrooke', 'Quebec', 'H12 J37'),
  (8,'Joseph', 'Joestar', '1989-12-25', '876543219', 'M098762315', '514-262-3334','Canadian', 'joseph.joestar@hotmail.com', '420 Wolly' , 'London', 'Ontario', 'B2C 3D4'),
  (9,'Juba', 'Smith', '1974-05-08', '111111111', 'M881234567', '450-671-1911',  'American', 'SmithAlways@outlook.com', '785 Williams', 'Buffalo', 'New York', 'GI8 ZNI'),
  (10,'Shanvin', 'Luo', '1999-01-01', '678456782', 'M098734561', '514-262-3335','American', 'CuO_1245@gmail.com', '978 Loyola', 'Seattle', 'Washington', 'H4S 3L5'),
  (11,'Roburnto', 'David', '1956-11-11', '314562345', 'M876543211', '514-262-3338', 'Peruvian', 'rob123@gmail.com', '745 Campusia', 'Lima', 'Lima', '78Z N89'),
  (12,'Timothy', 'Wang', '1999-01-21', '688954612', 'M1', '514-333-4444','Canadian', 'Timothy.Wang@gmail.com',  '123 West', 'Montreal', 'Quebec', 'H4S 3L4'),
  (13,'Francois', 'Lacelle', '1978-10-10', '229031456', 'M2', '438-383-6785','Canadian', 'Francois_Lacelle@gmail.com', '1210 George', 'LaSalle', 'Quebec', 'H7N 1LN'),
  (14,'Anthony', 'Dumont', '1960-12-12', '196012121', 'M3', '450-665-1819', 'American', 'Anthony.Dumont@mail.concordia.com', '457 West', 'Montreal', 'Quebec', 'G12 J38'),
  (15,'Anna', 'Labella', '1984-05-12', '198405128', 'M4', '438-448-5957', 'Peruvian', 'Anna_Labella@hotmail.com', '420 Wolly' , 'London', 'Ontario', 'B2C 3D4'),
  (16,'Eva', 'Mendez', '1982-09-30', '332211445', 'M5', '514-345-6789', 'Canadian', 'eva.mendez@gmail.com', '745 Campusia', 'Lima', 'Lima', '78Z N89'),
  (17,'Carlos', 'Rodriguez', '1995-06-12', '443322116', 'M112233445', '450-789-0123', 'Canadian', 'carlos.rodriguez@gmail.com', '567 Oak', 'Laval', 'Quebec', 'G45 J89'),
  (18,'Linda', 'Turner', '1970-03-25', '554433226', 'M224466880', '716-123-4567', 'American', 'linda.turner@gmail.com', '890 Pine', 'LaSalle', 'Quebec', 'H7N 2LN'),
  (19,'Kevin', 'Baker', '1988-11-18', '665544337', 'M559911778', '514-789-0123', 'Canadian', 'kevin.baker@gmail.com', '234 Birch', 'Montreal', 'Quebec', 'G12 K78'),
  (20,'Sophie', 'Williams', '2000-05-02', '776655448', 'M6', '438-234-5678', 'Canadian', 'sophie.williams@gmail.com', '123 West', 'Montreal', 'Quebec', 'H4S 3L4'),
  (21,'Jack', 'Perry', '1984-07-18', '887766559', 'M7', '716-890-1234', 'American', 'jack.perry@gmail.com', '785 Williams', 'Buffalo', 'New York', 'GI8 ZNI'),
  (22,'Diana', 'Lopez', '1992-02-11', '998877660', 'M660022116', '819-123-4567', 'Canadian', 'diana.lopez@gmail.com', '543 Tulip', 'Lima', 'Lima', '78Z N87'),
  (23,'Alan', 'Scott', '1978-09-05', '009988771', 'M8', '519-234-5678', 'Canadian', 'alan.scott@gmail.com', '543 Tulip', 'Lima', 'Lima', '78Z N87'),
  (24,'Olivia', 'Clark', '1985-12-20', '110022334', 'M334455660', '716-345-6789', 'Canadian', 'olivia.clark@gmail.com',  '321 Daisy', 'Montreal', 'Quebec', 'HHI 3JK'),
  (25,'Daniel', 'Evans', '1996-04-06', '221133446', 'M9', '206-567-8901', 'Canadian', 'daniel.evans@gmail.com', '978 Loyola', 'Seattle', 'Washington', 'H4S 3L5');
  
  -- Insert more data into Persons table
INSERT INTO Persons (PersonID, FirstName, LastName, DateOfBirth, SocialSecurity, MedicareCard, PhoneNumber, Citizenship, Email, Address, City, Province, PostalCode, StartedDateAtAddress) VALUES
  (16, 'Linda', 'Smith', '1987-09-05', '654987321', 'M654321987', '514-555-1234', 'Canadian', 'linda.smith@example.com', '789 Elm St', 'Montreal', 'Quebec', 'H8S 2J4', '2010-05-20'),
  (17, 'Michael', 'Johnson', '1975-12-18', '987654321', 'M123456789', '514-777-2345', 'American', 'michael.johnson@example.com', '456 Pine St', 'Toronto', 'Ontario', 'M2N 3A6', '2015-08-12'),
  (18, 'Sophia', 'Garcia', '1992-03-27', '456123789', 'M987654321', '438-888-3456', 'Canadian', 'sophia.garcia@example.com', '321 Oak St', 'Vancouver', 'British Columbia', 'V6B 2J4', '2018-02-28'),
  (19, 'David', 'Martinez', '1980-07-10', '789456123', 'M321654987', '450-999-5678', 'Canadian', 'david.martinez@example.com', '987 Maple St', 'Calgary', 'Alberta', 'T2P 1E4', '2017-11-15'),
  (20, 'Jennifer', 'Brown', '1985-05-30', '321789456', 'M654987321', '514-333-8765', 'American', 'jennifer.brown@example.com', '654 Cedar St', 'Ottawa', 'Ontario', 'K1P 5H1', '2016-06-10');



-- Insert data into Employees table
INSERT INTO Employees (MedicareCard, FacilityName, Job, StartDate, EndDate) VALUES
  ('M987654321',  'CLSC H', 'nurse', '2022-01-01', NULL),
  ('M876543210',  'CLSC H', 'doctor', '2012-02-15', '2023-09-30'),
  ('M888888888',  'Hospital Maisonneuve Rosemont', 'cashier', '2020-03-13', NULL),
  ('M888888888', 'Santiago Bernabeu' , 'receptionist', '2016-01-01', '2020-02-08'),
  ('M888888880',  'UniDollar','pharmacist', '2016-11-30', NULL),
  ('M888888800',  'Lakeshore', 'doctor', '2015-08-21', '2023-09-30'),
  ('M123456780',  'Hospital Maisonneuve Rosemont', 'doctor', '1998-01-24', 2019-09-20),
  ('M669876541',  'Justine', 'nurse', '2024-08-17', NULL),
  ('M098762315',  'Hospital Maisonneuve Rosemont',  'administrative personnel', '2019-04-28', '2023-05-02'),
  ('M888888800',  'Hospital Maisonneuve Rosemont', 'doctor', '2024-01-01', NULL),
  ('M098734561',  'Lakeshore', 'nurse', '2016-07-15', '2022-08-25'),
  ('M876543211',  'UniDollar', 'pharmacist', '2022-02-15', '2024-02-18'),
  ('M098762315',  'General Hospital', 'nurse', '2024-01-15', NULL),
  ('M112233445',  'Justine', 'doctor', '2022-03-10', '2024-01-31'),
  ('M224466880',  'Sunset Center', 'receptionist', '2019-08-05', NULL),
  ('M123456780',  'Green Pharmacy', 'pharmacist', '2020-11-20', NULL),
  ('M334455660',  'Sunset Center', 'nurse', '2022-05-18', NULL),
  ('M881234567',  'Justine', 'doctor', '2018-09-10', NULL),
  ('M559911778',  'Green Pharmacy', 'cashier', '2004-02-28', '2014-02-08'),
  ('M660022116',  'Santiago Bernabeu', 'nurse', '2003-06-10', NULL),
  ('M334455660',  'Faubourg Clinic', 'receptionist', '1996-01-02', '2008-07-15'),
  ('M334455660',  'Sunset Center', 'regular employee', '2011-03-10', '2019-07-04');

-- Insert more data into Employees table
INSERT INTO Employees (PersonID, FacilityName, Job, StartDate, EndDate) VALUES
  (16, 'Healthy Living Clinic', 'receptionist', '2023-01-15', NULL),
  (17, 'Sunrise Pharmacy', 'cashier', '2022-12-01', NULL),
  (18, 'Safe Haven Hospital', 'nurse', '2020-08-10', NULL),
  (19, 'Safe Haven Hospital', 'doctor', '2019-05-20', '2023-12-31'),
  (20, 'Healthy Living Clinic', 'pharmacist', '2021-06-05', NULL);



-- Insert data into Vaccines table
INSERT INTO HasVaccines (PersonID, DateOfVaccination, DoseNumber, Location, Type)
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
  (10,'2020-03-13', 2, 'Lakeshore', 'Johnson & Johnson'),
  (12,'2021-02-10', 1, 'UniDollar', 'Pfizer'),
  (12,'2022-12-25', 2, 'UniDollar', 'Moderna'),
  (12,'2023-09-20', 3, 'Justine', 'Moderna'),
  (12,'2024-02-17', 4, 'Justine', 'Pfizer'),
  (14,'2021-09-12', 1, 'Justine', 'Moderna'),
  (14,'2023-09-05', 2, 'Lakeshore', 'Moderna'),
  (16,'2021-06-15', 1, 'Lakeshore', 'Johnson & Johnson'),
  (17, '2020-08-20', 1, 'UniDollar', 'Pfizer'),
  (18,'2021-11-15', 1, 'Hospital Maisonneuve Rosemont', 'Moderna'),
  (19,'2021-03-15', 2, 'UniDollar', 'Pfizer'),
  (21,'2020-08-30', 1, 'CLSC H', 'Moderna'),
  (21,'2022-11-10', 2, 'Lakeshore', 'Johnson & Johnson'),
  (21,'2024-01-01', 3, 'CLSC H', 'Pfizer'),
  (24,'2023-03-10', 1, 'Hospital Maisonneuve Rosemont', 'Pfizer'),
  (25,'2020-12-01', 1, 'Lakeshore', 'Johnson & Johnson'),
  (25,'2023-04-01', 2, 'Lakeshore', 'Moderna');
  
  -- Insert more data into Vaccines table
INSERT INTO HasVaccines (PersonID, DateOfVaccination, DoseNumber, Location, Type) VALUES
  (16, '2023-02-28', 1, 'Healthy Living Clinic', 'Pfizer'),
  (17, '2022-12-10', 1, 'Sunrise Pharmacy', 'Moderna'),
  (18, '2020-08-15', 1, 'Safe Haven Hospital', 'Johnson & Johnson'),
  (19, '2019-05-30', 1, 'Safe Haven Hospital', 'Pfizer'),
  (20, '2021-06-20', 1, 'Healthy Living Clinic', 'Moderna');


  
-- Insert data into Infections table
INSERT INTO HadInfections (PersonID, DateOfInfection, InfectionNumber, InfectionType) VALUES
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
  (6, '2021-09-23', 1, 'COVID-19'),
  (16, '2023-03-01', 1, 'COVID-19'),
  (17, '2022-06-01', 1, 'SARS-Cov-2 Variant'),
  (16, '2023-01-19', 2, 'COVID-19'),
  (17, '2023-03-01', 2, 'SARS-Cov-2 Variant'),
  (18, '2021-02-10', 1, 'COVID-19'),
  (18, '2022-06-01', 2, 'SARS-Cov-2 Variant'),
  (18, '2023-04-21', 3, 'COVID-19'),
  (20, '2023-05-16', 1, 'SARS-Cov-2 Variant'),
  (21, '2022-10-28', 1, 'COVID-19'),
  (23, '2023-08-15', 1, 'COVID-19'),
  (23, '2023-12-01', 2, 'COVID-19'),
  (24, '2024-04-15', 1, 'COVID-19'),
  (25, '2020-10-05', 1, 'COVID-19');

-- Insert more data into Infections table
INSERT INTO HadInfections (PersonID, DateOfInfection, InfectionNumber, InfectionType) VALUES
  (16, '2023-03-15', 1, 'COVID-19'),
  (17, '2022-11-01', 1, 'SARS-Cov-2 Variant'),
  (18, '2021-07-20', 1, 'COVID-19'),
  (19, '2020-12-10', 1, 'COVID-19'),
  (20, '2021-08-05', 1, 'COVID-19');




 -- Insert data for people that lives with some employees
INSERT INTO LivesWithEmployee (MedicareCard, PersonID, Relationship) VALUES
	('M987654321',12 , 'Partner'),
    ('M987654321',20 , 'Dependent'),    
    ('M888888888',13 , 'Dependent'),
    ('M888888880',14 , 'Parent'),
	('M098762315',15 , 'Roommate'),
	('M876543211',16 , 'Partner'),
    ('M881234567',21 , 'Roommate'),
	('M660022116',23 , 'Partner'),
    ('M098734561',25 , 'Rommate');

-- Insert more data into LivesWithEmployee table
INSERT INTO LivesWithEmployee (MedicareCard, PersonID, Relationship) VALUES
  ('M654321987', 16, 'roommate'),
  ('M123456789', 17, 'partner'),
  ('M987654321', 18, 'parent'),
  ('M321654987', 19, 'partner'),
  ('M654987321', 20, 'dependent');

  


-- Insert more data into Schedule table
INSERT INTO Schedule (MedicareCard, FacilityName, Schedule_Date, StartTime, EndTime, is_no_assignment) VALUES
  ('M654321987', 'Healthy Living Clinic', '2024-04-01', '08:00:00', '12:00:00', 0),
  ('M123456789', 'Sunrise Pharmacy', '2024-04-02', '09:00:00', '13:00:00', 0),
  ('M987654321', 'Safe Haven Hospital', '2024-04-03', '10:00:00', '14:00:00', 0),
  ('M321654987', 'Safe Haven Hospital', '2024-04-04', '11:00:00', '15:00:00', 0),
  ('M654987321', 'Healthy Living Clinic', '2024-04-05', '12:00:00', '16:00:00', 0);


-- Insert more data into EmailLog table
INSERT INTO EmailLog (email_date, sender, receiver, subject_email, body) VALUES
  ('2024-03-31 08:00:00', 'Healthy Living Clinic', 'linda.smith@example.com', 'Appointment Reminder', 'Your appointment at Healthy Living Clinic is scheduled for tomorrow at 9:00 AM.'),
  ('2024-04-01 10:00:00', 'Sunrise Pharmacy', 'michael.johnson@example.com', 'Prescription Ready', 'Dear Michael, your prescription is now ready for pickup at Sunrise Pharmacy.'),
  ('2024-04-02 12:00:00', 'Safe Haven Hospital', 'sophia.garcia@example.com', 'Follow-up Appointment', 'Dear Sophia, this is a reminder for your follow-up appointment at Safe Haven Hospital on April 3rd.'),
  ('2024-04-03 14:00:00', 'Safe Haven Hospital', 'david.martinez@example.com', 'Urgent: Test Results', 'David, your test results are ready for review. Please contact us at Safe Haven Hospital.'),
  ('2024-04-04 16:00:00', 'Healthy Living Clinic', 'jennifer.brown@example.com', 'Wellness Workshop', 'Jennifer, join us for our wellness workshop at Healthy Living Clinic on April 5th.');


-- Insert data into ResidenceType table for secondary residences
INSERT INTO ResidenceType (PersonID, HouseType, Address, City, Province, PostalCode, ResidenceType, StartDateAtAddress) VALUES
  (16, 'apartment', '789 Elm St', 'Montreal', 'Quebec', 'H8S 2J4', 'Secondary', '2010-05-20'),
  (17, 'house', '456 Pine St', 'Toronto', 'Ontario', 'M2N 3A6', 'Secondary', '2015-08-12'),
  (19, 'house', '987 Maple St', 'Calgary', 'Alberta', 'T2P 1E4', 'Secondary', '2017-11-15');