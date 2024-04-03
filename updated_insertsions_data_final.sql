-- add sample data
ALTER TABLE Persons 
DROP COLUMN Address,
DROP COLUMN City, 
DROP COLUMN Province, 
DROP COLUMN PostalCode;
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
  

-- Insert data into Residence table
INSERT INTO Residence (HouseType, Address, City, Province, PostalCode, ResidencePhoneNumber, AmountBedrooms) VALUES
  ('apartment', '123 West', 'Montreal', 'Quebec', 'H4S 3L4', '514-333-4444', 8), -- 1
  ('house', '456 Maple', 'Laval', 'Quebec', 'G12 J37', '418-444-5555', 3), -- 2
  ('apartment', '1210 George', 'LaSalle', 'Quebec', 'H7N 1LN', '438-383-6785', 1), -- 3
  ('house', '457 West', 'Montreal', 'Quebec', 'G12 J38', '450-665-1819', 9), -- 4
  ('condominium', '458 Coconut', 'Montreal', 'H9S 335', 'A1B 2C3', '514-210-1865', 6), -- 5
  ('house', '007 Lemieux', 'Montreal', 'Quebec', 'J89 L7N', '514-419-4380', 1), -- 6
  ('semidetached house', '661 Croissant', 'Sherbrooke', 'Quebec', 'H12 J37', '438-113-4466', 2), -- 7
  ('house', '420 Wolly' , 'London', 'Ontario', 'B2C 3D4', '438-448-5957', 3), -- 8
  ('condominium', '785 Williams', 'Buffalo', 'New York', 'GI8 ZNI', '716-654-3210', 3), -- 9
  ('house', '978 Loyola', 'Seattle', 'Washington', 'H4S 3L5', '438-967-1285', 3), -- 10
  ('condominium', '745 Campusia', 'Lima', 'Lima', '78Z N89', '228-552-3218', 3), -- 11
  ('condominium', '228 Elm', 'Montreal', 'Quebec', 'H4S 1L2', '514-111-2222', 2), -- 12
  ('apartment', '567 Oak', 'Laval', 'Quebec', 'G45 J89', '450-333-4444', 3), -- 13
  ('house', '890 Pine', 'LaSalle', 'Quebec', 'H7N 2LN', '438-555-6666', 4), -- 14
  ('semidetached house', '234 Birch', 'Montreal', 'Quebec', 'G12 K78', '514-777-8888', 3), -- 15
  ('condominium', '321 Daisy', 'Montreal', 'Quebec', 'HHI 3JK', '716-987-6543', 2), -- 16
  ('apartment', '876 Sunflower', 'Ottawa', 'Ontario', 'G6T 7Y8', '206-123-4567', 1), -- 17
  ('house', '543 Tulip', 'Lima', 'Lima', '78Z N87', '511-456-7890', 4); -- 18
  
  -- Insert more data into Residence table
INSERT INTO Residence (HouseType, Address, City, Province, PostalCode, ResidencePhoneNumber, AmountBedrooms) VALUES
  ('house', '789 Elm St', 'Montreal', 'Quebec', 'H8S 2J4', '514-555-1234', 4), -- 19
  ('apartment', '456 Pine St', 'Toronto', 'Ontario', 'M2N 3A6', '514-777-2345', 2), -- 20
  ('condominium', '321 Oak St', 'Vancouver', 'British Columbia', 'V6B 2J4', '438-888-3456', 3), -- 21
  ('house', '987 Maple St', 'Calgary', 'Alberta', 'T2P 1E4', '450-999-5678', 5), -- 22
  ('apartment', '654 Cedar St', 'Ottawa', 'Ontario', 'K1P 5H1', '514-333-8765', 1); -- 23
  
-- insert data into Persons table  
INSERT INTO Persons 
    (FirstName, LastName, DateOfBirth, SocialSecurity, MedicareCard, PhoneNumber, Citizenship, Email, ResidenceID, StartedDateAtAddress) 
VALUES
    ('John', 'Doe', '1990-05-15', '123456789', 'M987654321', '514-206-1720', 'Canadian', 'john.doe@gmail.com',1, '2015-01-01'),
    ('Marquez', 'Valdes', '1985-08-20', '124567890', 'M876543210', '514-262-3333', 'Canadian', 'marquez.valdes@gmail.com', 2, '2015-01-01'),
    ('Robert', 'Camacho', '2000-03-01', '402417090', 'M888888888', '514-292-1611', 'Canadian', 'robert.camacho@mail.concordia.ca', 3, '2015-01-01'),
    ('Axel', 'James', '2001-04-28', '402567891', 'M888888880', '514-268-3456', 'Canadian', 'axel.james@yahoo.com', 4, '2015-01-01'),
    ('Gigi', 'Hudda', '1958-07-15', '412876987', 'M888888800', '438-986-1211', 'Canadian', 'gigi.hudda@gmail.com', 5, '2015-01-01'),
    ('Blind', 'Spot', '1963-06-20', '433456781', 'M123456780', '438-700-1513', 'French', 'blind.spot@gmail.com', 6, '2015-01-01'),
    ('Jonathan', 'Jababo', '1968-08-24', '245678910', 'M669876541', '418-089-3690', 'Canadian', 'jonathan.jababo@gmail.com',7, '2015-01-01'),
    ('Joseph', 'Joestar', '1989-12-25', '876543219', 'M098762315', '514-262-3334', 'Canadian', 'joseph.joestar@hotmail.com',  8, '2015-01-01'),
    ('Juba', 'Smith', '1974-05-08', '111111111', 'M881234567', '450-671-1911', 'American', 'SmithAlways@outlook.com', 9, '2015-01-01'),
    ('Shanvin', 'Luo', '1999-01-01', '678456782', 'M098734561', '514-262-3335', 'American', 'CuO_1245@gmail.com', 10, '2015-01-01'),
    ('Roburnto', 'David', '1956-11-11', '314562345', 'M876543211', '514-262-3338', 'Peruvian', 'rob123@gmail.com', 11, '2015-01-01'),
    ('Timothy', 'Wang', '1999-01-21', '688954612', 'M1', '514-333-4444', 'Canadian', 'Timothy.Wang@gmail.com', 1, '2015-01-01'),
    ('Francois', 'Lacelle', '1978-10-10', '229031456', 'M2', '438-383-6785', 'Canadian', 'Francois_Lacelle@gmail.com', 3, '2015-01-01'),
    ('Anthony', 'Dumont', '1960-12-12', '196012121', 'M3', '450-665-1819', 'American', 'Anthony.Dumont@mail.concordia.com', 4, '2015-01-01'),
    ('Anna', 'Labella', '1984-05-12', '198405128', 'M4', '438-448-5957', 'Peruvian', 'Anna_Labella@hotmail.com', 8, '2015-01-01'),
    ('Eva', 'Mendez', '1982-09-30', '332211445', 'M5', '514-345-6789', 'Canadian', 'eva.mendez@gmail.com',11, '2015-01-01'),
    ('Carlos', 'Rodriguez', '1995-06-12', '443322116', 'M112233445', '450-789-0123', 'Canadian', 'carlos.rodriguez@gmail.com',  13, '2015-01-01'),
    ('Linda', 'Turner', '1970-03-25', '554433226', 'M224466880', '716-123-4567', 'American', 'linda.turner@gmail.com', 14, '2015-01-01'),
    ('Kevin', 'Baker', '1988-11-18', '665544337', 'M559911778', '514-789-0123', 'Canadian', 'kevin.baker@gmail.com', 15, '2015-01-01'),
    ('Sophie', 'Williams', '2000-05-02', '776655448', 'M6', '438-234-5678', 'Canadian', 'sophie.williams@gmail.com', 1, '2015-01-01'),
    ('Jack', 'Perry', '1984-07-18', '887766559', 'M7', '716-890-1234', 'American', 'jack.perry@gmail.com', 9, '2015-01-01'),
    ('Diana', 'Lopez', '1992-02-11', '998877660', 'M660022116', '819-123-4567', 'Canadian', 'diana.lopez@gmail.com', 18, '2015-01-01'),
    ('Alan', 'Scott', '1978-09-05', '009988771', 'M8', '519-234-5678', 'Canadian', 'alan.scott@gmail.com', 18, '2015-01-01'),
    ('Olivia', 'Clark', '1985-12-20', '110022334', 'M334455660', '716-345-6789', 'Canadian', 'olivia.clark@gmail.com', 16, '2015-01-01'),
    ('Daniel', 'Evans', '1996-04-06', '221133446', 'M9', '206-567-8901', 'Canadian', 'daniel.evans@gmail.com',10, '2015-01-01');

-- insert data intro employees table
INSERT INTO Employees (MedicareCard, FacilityID, Job, StartDate, EndDate) VALUES
  ('M987654321', 2, 'nurse', '2022-01-01', NULL),
  ('M876543210', 2, 'doctor', '2012-02-15', '2023-09-30'),
  ('M888888888', 1, 'cashier', '2020-03-13', NULL),
  ('M888888888', 10, 'receptionist', '2016-01-01', '2020-02-08'),
  ('M888888880', 5, 'pharmacist', '2016-11-30', NULL),
  ('M888888800', 3, 'doctor', '2015-08-21', '2023-09-30'),
  ('M123456780', 1, 'doctor', '1998-01-24', '2019-09-20'),
  ('M669876541', 4, 'nurse', '2024-08-17', NULL),
  ('M098762315', 1, 'administrative personnel', '2019-04-28', '2023-05-02'),
  ('M888888800', 1, 'doctor', '2024-01-01', NULL),
  ('M098734561', 3, 'nurse', '2016-07-15', '2022-08-25'),
  ('M876543211', 5, 'pharmacist', '2022-02-15', '2024-02-18'),
  ('M098762315', 6, 'nurse', '2024-01-15', NULL),
  ('M112233445', 4, 'doctor', '2022-03-10', '2024-01-31'),
  ('M224466880', 8, 'receptionist', '2019-08-05', NULL),
  ('M123456780', 9, 'pharmacist', '2020-11-20', NULL),
  ('M334455660', 8, 'nurse', '2022-05-18', NULL),
  ('M881234567', 4, 'doctor', '2018-09-10', NULL),
  ('M559911778', 9, 'cashier', '2004-02-28', '2014-02-08'),
  ('M660022116', 10, 'nurse', '2003-06-10', NULL),
  ('M334455660', 7, 'receptionist', '1996-01-02', '2008-07-15'),
  ('M334455660', 8, 'regular employee', '2011-03-10', '2019-07-04');


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

SELECT * FROM HadInfections;
  -- Insert more data into Infections table
INSERT INTO HadInfections (PersonID, DateOfInfection, InfectionNumber, InfectionType) VALUES
  (16, '2023-03-15', 1, 'COVID-19'),
  (17, '2022-11-01', 1, 'SARS-Cov-2 Variant'),
  (18, '2021-07-20', 1, 'COVID-19'),
  (19, '2020-12-10', 1, 'COVID-19'),
  (20, '2021-08-05', 1, 'COVID-19'),
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
INSERT INTO LivesWithEmployee (MedicareCard, PersonID, Relationship) VALUES
	('M987654321',12 , 'Partner'),
    ('M987654321',20 , 'non-parent dependent'),    
    ('M888888888',13 , 'non-parent dependent'),
    ('M888888880',14 , 'Parent'),
	('M098762315',15 , 'Roommate'),
	('M876543211',16 , 'Partner'),
    ('M881234567',21 , 'Roommate'),
	('M660022116',23 , 'Partner'),
    ('M098734561',25 , 'Roommate');
  

-- insert data into schedule table
INSERT INTO Schedule (MedicareCard, FacilityID, Schedule_Date, StartTime, EndTime, is_no_assignment) VALUES
  ('M876543210', 11, '2024-04-01', '08:00:00', '12:00:00', 0),
  ('M112233445', 12, '2024-04-02', '09:00:00', '13:00:00', 0),
  ('M987654321', 13, '2024-04-03', '10:00:00', '14:00:00', 0),
  ('M334455660', 13, '2024-04-04', '11:00:00', '15:00:00', 0),
  ('M123456780', 11, '2024-04-05', '12:00:00', '16:00:00', 0);

-- insert data into EmailLog table
INSERT INTO EmailLog (email_date, sender, receiver, subject_email, body) VALUES
  ('2024-03-31 08:00:00', 11, 16, 'Appointment Reminder', 'Your appointment at Healthy Living Clinic is scheduled for tomorrow at 9:00 AM.'),
  ('2024-04-01 10:00:00', 12, 17, 'Prescription Ready', 'Dear Michael, your prescription is now ready for pickup at Sunrise Pharmacy.'),
  ('2024-04-02 12:00:00', 13, 18, 'Follow-up Appointment', 'Dear Sophia, this is a reminder for your follow-up appointment at Safe Haven Hospital on April 3rd.'),
  ('2024-04-03 14:00:00', 13, 19, 'Urgent: Test Results', 'David, your test results are ready for review. Please contact us at Safe Haven Hospital.'),
  ('2024-04-04 16:00:00', 11, 20, 'Wellness Workshop', 'Jennifer, join us for our wellness workshop at Healthy Living Clinic on April 5th.');

-- insert data into SecondaryResidence Table:
INSERT INTO SecondaryResidence (PersonID, ResidenceID, ResidenceType, StartDateAtAddress) VALUES
  (16, 23, 'Secondary', '2010-05-20'),
  (17, 22, 'Secondary', '2015-08-12'),
  (19, 21, 'Secondary', '2017-11-15');
