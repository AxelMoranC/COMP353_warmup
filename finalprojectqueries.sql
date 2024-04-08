-- #8
SELECT 
    f.FacilityName,
    f.Address,
    f.City,
    f.Province,
    f.PostalCode,
    f.FacilityPhoneNumber AS PhoneNumber,
    f.WebAddress,
    f.FacilityType AS Type,
    f.Capacity,
    COUNT(e.MedicareCard) AS NumberOfEmployees,
    SUM(CASE WHEN e.Job = 'doctor' THEN 1 ELSE 0 END) AS NumberOfDoctors,
    SUM(CASE WHEN e.Job = 'nurse' THEN 1 ELSE 0 END) AS NumberOfNurses
FROM 
    Facilities f
LEFT JOIN 
    Employees e ON f.FacilityID = e.FacilityID
GROUP BY 
    f.FacilityID
ORDER BY 
    f.Province ASC, 
    f.City ASC, 
    f.FacilityType ASC, 
    NumberOfDoctors ASC;


-- #9

SELECT 
    p.FirstName,
    p.LastName,
    e.StartDate,
    p.DateOfBirth,
    e.MedicareCard,
    p.PhoneNumber,
    r.Address AS PrimaryAddress,
    r.City,
    r.Province,
    r.PostalCode,
    p.Citizenship,
    p.Email,
    COUNT(sr.ResidenceID) AS NumberOfSecondaryResidences
FROM 
    Employees e
JOIN 
    Persons p ON e.MedicareCard = p.MedicareCard
JOIN 
    Residence r ON p.ResidenceID = r.ResidenceID
LEFT JOIN 
    SecondaryResidence sr ON p.PersonID = sr.PersonID
WHERE 
    e.FacilityID = 1
    AND (e.EndDate IS NULL OR e.EndDate > CURRENT_DATE)
GROUP BY 
    p.PersonID
HAVING 
    COUNT(sr.ResidenceID) > 0
ORDER BY 
    e.StartDate DESC, 
    p.FirstName ASC, 
    p.LastName ASC;

-- more data to satisfy this query:
-- Insert sample data into Residence table for the secondary residences
INSERT INTO Persons 
    (FirstName, LastName, DateOfBirth, SocialSecurity, MedicareCard, PhoneNumber, Citizenship, Email, ResidenceID, StartedDateAtAddress) 
VALUES
    ('Lebron', 'James', '1990-06-15', '90901', 'ME1', '514-3106-1720', 'Canadian', 'lebron@gmail.com',25, '2016-01-01'),
    ('Kyrie', 'Irving', '1985-07-20', '90902', 'ME2', '514-542-3333', 'Canadian', 'kyrie@gmail.com', 26, '2016-01-01'),
    ('Luka', 'Doncic', '2001-03-01', '90903', 'ME3', '514-282-1611', 'Canadian', 'luka@mail.concordia.ca', 27, '2016-01-01'),
    ('Flight', 'Curry', '2001-07-28', '90904', 'ME4', '514-348-3456', 'Canadian', 'flight@yahoo.com', 28, '2016-01-01'),
    ('Steph', 'Wardell', '1978-09-16', '90905', 'ME5', '438-186-1211', 'Canadian', 'stephwardell@gmail.com', 29, '2016-01-01'),
    ('James', 'Harden', '1983-06-20', '90906', 'ME6', '438-710-1513', 'French', 'harednn13@gmail.com', 29, '2016-01-01');

INSERT INTO Residence (HouseType, Address, City, Province, PostalCode, ResidencePhoneNumber, AmountBedrooms) VALUES
('condominium', '321 lebron St', 'Vancouver', 'British Columbia', 'V8B 2J4', '438-888-3456', 3),
('house', '987 kyrie St', 'Calgary', 'Alberta', 'T8P 1E4', '450-999-5678', 5),
('apartment', '654 luka St', 'Ottawa', 'Ontario', 'K8P 5H1', '514-333-8765', 1),
('semidetached house', '234 Wardell', 'Montreal', 'Quebec', 'G82 K78', '514-777-8888', 3),
('condominium', '321 Harden ST', 'Montreal', 'Quebec', 'H8I 3JK', '716-987-6543', 2);
select * from Persons;

-- Assuming PersonID 1 to 5 are linked to some Employees, and we're setting up secondary residences for them
INSERT INTO SecondaryResidence (PersonID, ResidenceID, ResidenceType, StartDateAtAddress) VALUES
(26, 25, 'Secondary', '2019-01-01'),
(27, 26, 'Secondary', '2019-02-01'),
(28, 27, 'Secondary', '2019-03-01'),
(29, 28, 'Secondary', '2019-04-01'),
(30, 29, 'Secondary', '2019-05-01');

-- Update or insert Employees to ensure they are currently working at FacilityID = 1 and have a valid MedicareCard from Persons table
INSERT INTO Employees (MedicareCard, FacilityID, Job, StartDate) VALUES
('ME1', 1, 'nurse', '2020-01-01'),
('ME2', 1, 'doctor', '2020-01-02'),
('ME3', 1, 'cashier', '2020-01-03'),
('ME4', 1, 'pharmacist', '2020-01-04'),
('ME5', 1, 'receptionist', '2020-01-05');

select * from Residence;

-- query #10
SELECT 
    f.FacilityName,
    DAYOFYEAR(s.Schedule_Date) AS DayOfYear,
    s.StartTime,
    s.EndTime
FROM 
    Schedule s
JOIN 
    Facilities f ON s.FacilityID = f.FacilityID
JOIN 
    Employees e ON s.MedicareCard = e.MedicareCard
WHERE 
    e.MedicareCard = 'M876543210'  -- Replace :MedicareCard with the employee's Medicare card number
    AND s.Schedule_Date BETWEEN '2024-01-01' AND '2024-12-31'  -- Replace :StartDate and :EndDate with the specific period
ORDER BY 
    f.FacilityName ASC, 
    DayOfYear ASC, 
    s.StartTime ASC;


-- query #11

SELECT 
    p.FirstName,
    p.LastName,
    CASE WHEN sr.ResidenceID IS NULL THEN 'Primary' ELSE 'Secondary' END AS ResidenceType,
    lwe.Relationship,
    'nurse' AS Occupation  -- You'll need to adjust this part based on your schema or omit
FROM 
    Persons p
JOIN 
    LivesWithEmployee lwe ON p.PersonID = lwe.PersonID
LEFT JOIN 
    SecondaryResidence sr ON p.ResidenceID = sr.ResidenceID AND sr.PersonID = lwe.PersonID
JOIN 
    Employees e ON lwe.MedicareCard = e.MedicareCard
WHERE 
    e.MedicareCard = 'M987654321' -- Replace :MedicareCard with the employee's Medicare card number
ORDER BY 
    ResidenceType, 
    p.FirstName, 
    p.LastName;

-- query 12
SELECT 
    p.FirstName,
    p.LastName,
    hi.DateOfInfection,
    f.FacilityName,
    COALESCE(sr.CountSecondaryResidences, 0) AS NumberOfSecondaryResidences
FROM 
    Employees e
JOIN 
    Persons p ON e.MedicareCard = p.MedicareCard
JOIN 
    HadInfections hi ON p.PersonID = hi.PersonID
JOIN 
    Facilities f ON e.FacilityID = f.FacilityID
LEFT JOIN (
    SELECT 
        PersonID, 
        COUNT(*) AS CountSecondaryResidences 
    FROM 
        SecondaryResidence 
    GROUP BY 
        PersonID
) sr ON p.PersonID = sr.PersonID
WHERE 
    e.Job = 'doctor'
    AND hi.InfectionType = 'COVID-19'
    AND hi.DateOfInfection > CURDATE() - INTERVAL 2 WEEK
ORDER BY 
    f.FacilityName ASC, 
    NumberOfSecondaryResidences ASC;

-- add sample data to test out query
INSERT INTO Persons (FirstName, LastName, DateOfBirth, SocialSecurity, MedicareCard, PhoneNumber, Citizenship, Email, ResidenceID, StartedDateAtAddress) VALUES
('drmundo', 'Doe', '1965-01-01', 'SSN20201', 'MD1', '555-1234', 'Canadian', 'mundo.doe@example.com', 1, '2020-01-01'),
('drluka', 'Doo', '1985-01-01', 'SSN20202', 'MD2', '555-1234', 'Canadian', 'drluka@example.com', 2, '2020-01-01'),
('drsteph', 'Dee', '1945-01-01', 'SSN20203', 'MD3', '555-1234', 'Canadian', 'drsteph@example.com', 3, '2020-01-01'),
('drjames', 'Dae', '1978-01-01', 'SSN20204', 'MD4', '555-1234', 'Canadian', 'drjames@example.com', 4, '2020-01-01'),
('drlebron', 'Smith', '1981-02-02', 'SSN20205', 'MD5', '555-5678', 'Canadian', 'drlebron@example.com', 5, '2020-02-01');
select * from Persons;
INSERT INTO Employees (MedicareCard, FacilityID, Job, StartDate, EndDate) VALUES
('MD1', 1, 'doctor', '2019-01-01', NULL),
('MD2', 1, 'doctor', '2019-01-01', NULL),
('MD3', 1, 'doctor', '2019-01-01', NULL),
('MD4', 2, 'doctor', '2019-01-01', NULL),
('MD5', 2, 'doctor', '2019-01-01', NULL);

INSERT INTO HadInfections (PersonID, DateOfInfection, InfectionNumber, InfectionType) VALUES
(32, CURDATE() - INTERVAL 1 WEEK, 1, 'COVID-19'),
(33, CURDATE() - INTERVAL 1 WEEK, 1, 'COVID-19'),
(34, CURDATE() - INTERVAL 1 WEEK, 1, 'COVID-19'),
(35, CURDATE() - INTERVAL 1 WEEK, 1, 'COVID-19'),
(36, CURDATE() - INTERVAL 10 DAY, 1, 'COVID-19');

-- Assume ResidenceID 3 and 4 are valid IDs from your Residence table. Adjust if necessary.
INSERT INTO SecondaryResidence (PersonID, ResidenceID, ResidenceType, StartDateAtAddress) VALUES
(32, 3, 'Secondary', '2019-01-01'),
(33, 3, 'Secondary', '2019-01-01'),
(34, 3, 'Secondary', '2019-01-01'),
(35, 4, 'Secondary', '2019-01-01'),
(36, 4, 'Secondary', '2019-02-01');


-- query #13
SELECT 
    el.email_date,
    el.subject_email,
    el.body,
    f.FacilityName
FROM 
    EmailLog el
JOIN 
    Facilities f ON el.sender = f.FacilityID
WHERE 
    f.FacilityID = '1'
    AND el.email_date BETWEEN '2024-01-01' AND '2024-12-01'
    AND (el.subject_email LIKE '%cancellation%' OR el.body LIKE '%cancellation%')
ORDER BY 
    el.email_date DESC;

select * from EmailLog;
-- sample data added to test out query
-- this can be added to see the results
INSERT INTO EmailLog (email_date, sender, receiver, subject_email, body) VALUES
('2024-03-25 10:00:00', 1, 1, 'Appointment Cancellation', 'Your appointment for 2024-03-30 has been canceled.'),
('2024-03-26 11:00:00', 1, 2, 'Assignment Cancellation Notice', 'Notice of cancellation for your assignment on 2024-03-31.'),
('2024-03-27 09:00:00', 1, 3, 'Urgent Cancellation', 'Due to unforeseen circumstances, your assignment on 2024-04-01 is now canceled.'),
('2024-03-28 08:30:00', 1, 4, 'Cancellation', 'Your scheduled assignment for 2024-04-02 has been canceled.'),
('2024-03-29 14:00:00', 1, 5, 'Assignment Cancellation', 'We regret to inform you that your assignment on 2024-04-03 is canceled.');

select * from SecondaryResidence;

-- query #14

SELECT 
    p.FirstName,
    p.LastName,
    e.Job AS Role,
    COUNT(DISTINCT sr.ResidenceID) AS NumberOfSecondaryResidences
FROM 
    Employees e
INNER JOIN 
    Persons p ON e.MedicareCard = p.MedicareCard
INNER JOIN 
    Schedule s ON e.MedicareCard = s.MedicareCard AND s.Schedule_Date BETWEEN DATE_SUB(CURDATE(), INTERVAL 4 WEEK) AND CURDATE()
INNER JOIN 
    SecondaryResidence sr ON p.PersonID = sr.PersonID
WHERE 
    e.FacilityID = 1  -- Replace :FacilityID with the specific facility ID
    AND (e.EndDate IS NULL OR e.EndDate > CURDATE())
GROUP BY 
    p.PersonID, e.Job
HAVING 
    COUNT(DISTINCT sr.ResidenceID) >= 3
ORDER BY 
    e.Job ASC, 
    COUNT(DISTINCT sr.ResidenceID) DESC;


-- sample data added to test out query #14

INSERT INTO SecondaryResidence (PersonID, ResidenceID, ResidenceType, StartDateAtAddress) VALUES
(32, 4, 'Secondary', '2019-01-01'),
(33, 4, 'Secondary', '2019-01-01'),
(34, 4, 'Secondary', '2019-01-01'),
(32, 5, 'Secondary', '2019-01-01'),
(33, 5, 'Secondary', '2019-01-01'),
(34, 5, 'Secondary', '2019-01-01');

INSERT INTO Schedule (MedicareCard, FacilityID, Schedule_Date, StartTime, EndTime) VALUES
('MD1', 1, '2024-03-15', '08:00', '16:00'),
('MD2', 1, '2024-03-15', '08:00', '16:00'),
('MD3', 1, '2024-03-16', '08:00', '16:00');

-- query #16
SELECT 
    e.Job AS Role,
    COUNT(DISTINCT e.MedicareCard) AS TotalWorkingEmployees,
    SUM(CASE WHEN hi.InfectionType = 'COVID-19' AND hi.DateOfInfection BETWEEN DATE_SUB(CURDATE(), INTERVAL 14 DAY) AND CURDATE() THEN 1 ELSE 0 END) AS TotalInfectedByCOVID
FROM 
    Employees e
LEFT JOIN 
    Persons p ON e.MedicareCard = p.MedicareCard
LEFT JOIN 
    HadInfections hi ON p.PersonID = hi.PersonID
WHERE 
    (e.EndDate IS NULL OR e.EndDate > CURDATE())
GROUP BY 
    e.Job
ORDER BY 
    e.Job ASC;

-- query 17
-- Provide a report of all the employees working in all the facilities by role. Report should 
-- include for every role of the employees, the total number of employees currently 
-- working in the facilities, and the total number of employees who have never been 
-- infected by COVID-19. Report should be displayed in ascending order by role. 
SELECT DISTINCT E.Job, 
	   COUNT(DISTINCT P.PersonID) AS 'Total Employees', 
       SUM( CASE WHEN H.PersonID IS NULL 
			THEN 1 ELSE 0 END) AS 'Never Infected'
FROM Employees E
LEFT JOIN Persons P ON P.MedicareCard = E.MedicareCard
LEFT OUTER JOIN HadInfections H ON H.PersonID = P.PersonID
WHERE E.EndDate IS NULL 
GROUP BY E.Job
order by E.Job ASC;

-- query 18
-- For all provinces, give the total number of facilities, the total number of employees 
-- currently working in the facilities, the total number of employees currently working 
-- and infected by COVID-19, the maximum capacity of the facilities, and the total hours 
-- scheduled in all facilities during a specific period. Results should be displayed in 
-- ascending order by province
SELECT 
    F.Province,
    COUNT(DISTINCT F.FacilityID) AS `Total Number Of Facilities`,
    COUNT(DISTINCT CASE WHEN E.EndDate IS NULL OR H.PersonID IS NOT NULL THEN E.MedicareCard END) AS `Total Employees Working/Infected`,
    SUM(DISTINCT F.Capacity) AS `Maximum Capacity`, -- Assuming they wantyed all capacity of the facilities together
    SUM(TIMESTAMPDIFF(HOUR, S.StartTime, S.EndTime)) AS `Total Hours Scheduled`
FROM Facilities F
JOIN Employees E ON E.FacilityID = F.FacilityID
JOIN Persons P ON P.MedicareCard = E.MedicareCard
LEFT JOIN HadInfections H ON H.PersonID = P.PersonID
LEFT JOIN Schedule S ON S.MedicareCard = E.MedicareCard
GROUP BY F.Province
ORDER BY F.Province ASC;
