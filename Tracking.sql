# i)
-- For every facility in the system, get the province name where the facility is located, 
-- the facility name, the maximum number of employees that the facility needs to 
-- operate, the total number of employees currently working for the facility, and the 
-- total number of people who live with the current employees. 
SELECT 
    F.Province, 
    F.FacilityName AS 'Facility Name', 
    F.Capacity AS 'Maximum Capacity',
    COUNT(DISTINCT E.MedicareCard) AS 'Number of Employees',
    COUNT(DISTINCT L.PersonID) AS 'Number of People Living with Employees'
FROM Facilities F
LEFT JOIN Employees E ON F.FacilityName = E.FacilityName AND E.EndDate IS NULL
LEFT JOIN LivesWithEmployee L ON E.MedicareCard = L.MedicareCard
GROUP BY F.Province, F.FacilityName, F.Capacity
ORDER BY F.Province, F.FacilityName;


# ii)
--  For a given facility, provide a report that displays for every employee who is 
-- currently working for the facility, the number of roommates, the number of 
-- dependents, the number of parents, and the total number of people who currently 
-- live with the employee. 
    
-- for Hospital Maisonneuve Rosemont facility
SELECT 
    E.MedicareCard,
    E.FacilityName,
    SUM(CASE WHEN L.Relationship = 'Roommate' THEN 1 ELSE 0 END) AS 'Number of Roommates',
    SUM(CASE WHEN L.Relationship = 'Dependent' THEN 1 ELSE 0 END) AS 'Number of Dependents',
    SUM(CASE WHEN L.Relationship = 'Parent' THEN 1 ELSE 0 END) AS 'Number of Parents',
    SUM(CASE WHEN L.Relationship = 'Partner' THEN 1 ELSE 0 END) AS 'Number of Partners',
    COUNT(L.PersonID) AS 'Total Number of People Living with Employee'
FROM Employees E
LEFT JOIN LivesWithEmployee L ON E.MedicareCard = L.MedicareCard
WHERE E.FacilityName = 'Hospital Maisonneuve Rosemont' AND E.EndDate IS NULL
GROUP BY E.MedicareCard, E.FacilityName
ORDER BY E.MedicareCard;

-- for CLSC H Facility
SELECT 
    E.MedicareCard,
    E.FacilityName,
    SUM(CASE WHEN L.Relationship = 'Roommate' THEN 1 ELSE 0 END) AS 'Number of Roommates',
    SUM(CASE WHEN L.Relationship = 'Dependent' THEN 1 ELSE 0 END) AS 'Number of Dependents',
    SUM(CASE WHEN L.Relationship = 'Parent' THEN 1 ELSE 0 END) AS 'Number of Parents',
    SUM(CASE WHEN L.Relationship = 'Partner' THEN 1 ELSE 0 END) AS 'Number of Partners',
    COUNT(L.PersonID) AS 'Total Number of People Living with Employee'
FROM Employees E
LEFT JOIN LivesWithEmployee L ON E.MedicareCard = L.MedicareCard
WHERE E.FacilityName = 'CLSC H' AND E.EndDate IS NULL
GROUP BY E.MedicareCard, E.FacilityName
ORDER BY E.MedicareCard;

-- for Lakeshore Facility
SELECT 
    E.MedicareCard,
    E.FacilityName,
    SUM(CASE WHEN L.Relationship = 'Roommate' THEN 1 ELSE 0 END) AS 'Number of Roommates',
    SUM(CASE WHEN L.Relationship = 'Dependent' THEN 1 ELSE 0 END) AS 'Number of Dependents',
    SUM(CASE WHEN L.Relationship = 'Parent' THEN 1 ELSE 0 END) AS 'Number of Parents',
    SUM(CASE WHEN L.Relationship = 'Partner' THEN 1 ELSE 0 END) AS 'Number of Partners',
    COUNT(L.PersonID) AS 'Total Number of People Living with Employee'
FROM Employees E
LEFT JOIN LivesWithEmployee L ON E.MedicareCard = L.MedicareCard
WHERE E.FacilityName = 'Lakeshore' AND E.EndDate IS NULL
GROUP BY E.MedicareCard, E.FacilityName
ORDER BY E.MedicareCard;

-- for Justine Facility
SELECT 
    E.MedicareCard,
    E.FacilityName,
    SUM(CASE WHEN L.Relationship = 'Roommate' THEN 1 ELSE 0 END) AS 'Number of Roommates',
    SUM(CASE WHEN L.Relationship = 'Dependent' THEN 1 ELSE 0 END) AS 'Number of Dependents',
    SUM(CASE WHEN L.Relationship = 'Parent' THEN 1 ELSE 0 END) AS 'Number of Parents',
    SUM(CASE WHEN L.Relationship = 'Partner' THEN 1 ELSE 0 END) AS 'Number of Partners',
    COUNT(L.PersonID) AS 'Total Number of People Living with Employee'
FROM Employees E
LEFT JOIN LivesWithEmployee L ON E.MedicareCard = L.MedicareCard
WHERE E.FacilityName = 'Justine' AND E.EndDate IS NULL
GROUP BY E.MedicareCard, E.FacilityName
ORDER BY E.MedicareCard;


-- for UniDollar Facility
SELECT 
    E.MedicareCard,
    E.FacilityName,
    SUM(CASE WHEN L.Relationship = 'Roommate' THEN 1 ELSE 0 END) AS 'Number of Roommates',
    SUM(CASE WHEN L.Relationship = 'Dependent' THEN 1 ELSE 0 END) AS 'Number of Dependents',
    SUM(CASE WHEN L.Relationship = 'Parent' THEN 1 ELSE 0 END) AS 'Number of Parents',
    SUM(CASE WHEN L.Relationship = 'Partner' THEN 1 ELSE 0 END) AS 'Number of Partners',
    COUNT(L.PersonID) AS 'Total Number of People Living with Employee'
FROM Employees E
LEFT JOIN LivesWithEmployee L ON E.MedicareCard = L.MedicareCard
WHERE E.FacilityName = 'UniDollar' AND E.EndDate IS NULL
GROUP BY E.MedicareCard, E.FacilityName
ORDER BY E.MedicareCard;

-- for General Hospital Facility
SELECT 
    E.MedicareCard,
    E.FacilityName,
    SUM(CASE WHEN L.Relationship = 'Roommate' THEN 1 ELSE 0 END) AS 'Number of Roommates',
    SUM(CASE WHEN L.Relationship = 'Dependent' THEN 1 ELSE 0 END) AS 'Number of Dependents',
    SUM(CASE WHEN L.Relationship = 'Parent' THEN 1 ELSE 0 END) AS 'Number of Parents',
    SUM(CASE WHEN L.Relationship = 'Partner' THEN 1 ELSE 0 END) AS 'Number of Partners',
    COUNT(L.PersonID) AS 'Total Number of People Living with Employee'
FROM Employees E
LEFT JOIN LivesWithEmployee L ON E.MedicareCard = L.MedicareCard
WHERE E.FacilityName = 'General Hospital' AND E.EndDate IS NULL
GROUP BY E.MedicareCard, E.FacilityName
ORDER BY E.MedicareCard;

-- for Faubourg Clinic Facility
SELECT 
    E.MedicareCard,
    E.FacilityName,
    SUM(CASE WHEN L.Relationship = 'Roommate' THEN 1 ELSE 0 END) AS 'Number of Roommates',
    SUM(CASE WHEN L.Relationship = 'Dependent' THEN 1 ELSE 0 END) AS 'Number of Dependents',
    SUM(CASE WHEN L.Relationship = 'Parent' THEN 1 ELSE 0 END) AS 'Number of Parents',
    SUM(CASE WHEN L.Relationship = 'Partner' THEN 1 ELSE 0 END) AS 'Number of Partners',
    COUNT(L.PersonID) AS 'Total Number of People Living with Employee'
FROM Employees E
LEFT JOIN LivesWithEmployee L ON E.MedicareCard = L.MedicareCard
WHERE E.FacilityName = 'Faubourg Clinic' AND E.EndDate IS NULL
GROUP BY E.MedicareCard, E.FacilityName
ORDER BY E.MedicareCard;

-- for Sunset Center Facility
SELECT 
    E.MedicareCard,
    E.FacilityName,
    SUM(CASE WHEN L.Relationship = 'Roommate' THEN 1 ELSE 0 END) AS 'Number of Roommates',
    SUM(CASE WHEN L.Relationship = 'Dependent' THEN 1 ELSE 0 END) AS 'Number of Dependents',
    SUM(CASE WHEN L.Relationship = 'Parent' THEN 1 ELSE 0 END) AS 'Number of Parents',
    SUM(CASE WHEN L.Relationship = 'Partner' THEN 1 ELSE 0 END) AS 'Number of Partners',
    COUNT(L.PersonID) AS 'Total Number of People Living with Employee'
FROM Employees E
LEFT JOIN LivesWithEmployee L ON E.MedicareCard = L.MedicareCard
WHERE E.FacilityName = 'Sunset Center' AND E.EndDate IS NULL
GROUP BY E.MedicareCard, E.FacilityName
ORDER BY E.MedicareCard;

-- for Green Pharmacy Facility
SELECT 
    E.MedicareCard,
    E.FacilityName,
    SUM(CASE WHEN L.Relationship = 'Roommate' THEN 1 ELSE 0 END) AS 'Number of Roommates',
    SUM(CASE WHEN L.Relationship = 'Dependent' THEN 1 ELSE 0 END) AS 'Number of Dependents',
    SUM(CASE WHEN L.Relationship = 'Parent' THEN 1 ELSE 0 END) AS 'Number of Parents',
    SUM(CASE WHEN L.Relationship = 'Partner' THEN 1 ELSE 0 END) AS 'Number of Partners',
    COUNT(L.PersonID) AS 'Total Number of People Living with Employee'
FROM Employees E
LEFT JOIN LivesWithEmployee L ON E.MedicareCard = L.MedicareCard
WHERE E.FacilityName = 'Green Pharmacy' AND E.EndDate IS NULL
GROUP BY E.MedicareCard, E.FacilityName
ORDER BY E.MedicareCard;

-- for Santiago Bernabeu Facility
SELECT 
    E.MedicareCard,
    E.FacilityName,
    SUM(CASE WHEN L.Relationship = 'Roommate' THEN 1 ELSE 0 END) AS 'Number of Roommates',
    SUM(CASE WHEN L.Relationship = 'Dependent' THEN 1 ELSE 0 END) AS 'Number of Dependents',
    SUM(CASE WHEN L.Relationship = 'Parent' THEN 1 ELSE 0 END) AS 'Number of Parents',
    SUM(CASE WHEN L.Relationship = 'Partner' THEN 1 ELSE 0 END) AS 'Number of Partners',
    COUNT(L.PersonID) AS 'Total Number of People Living with Employee'
FROM Employees E
LEFT JOIN LivesWithEmployee L ON E.MedicareCard = L.MedicareCard
WHERE E.FacilityName = 'Santiago Bernabeu' AND E.EndDate IS NULL
GROUP BY E.MedicareCard, E.FacilityName
ORDER BY E.MedicareCard;

# iii)
-- For a given facility, provide a list of all employees who currently live with at least 
-- another employee who is currently working at the same facility and at least one of 
-- those employees is currently infected by COVID-19. The list should include the 
-- employee’s first name, last name, total number of employees living with the 
-- infected employee, address, city, and province. Results should be displayed sorted 
-- in ascending order by province, then city, then address. 

-- for Hospital Maisonneuve Rosemont

SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT LWE.PersonID) AS 'Total Employees Living with Infected',
    P.Address,
    P.City,
    P.Province
FROM Employees E
JOIN Persons P ON E.MedicareCard = P.MedicareCard
JOIN LivesWithEmployee LWE ON P.MedicareCard = LWE.MedicareCard
JOIN Employees E2 ON LWE.MedicareCard = E2.MedicareCard
JOIN HadInfections HI ON LWE.PersonID = HI.PersonID
WHERE E.FacilityName = 'Hospital Maisonneuve Rosemont'
AND E2.FacilityName = E.FacilityName
AND HI.InfectionType = 'COVID-19'
AND E.EndDate IS NULL
AND E2.EndDate IS NULL
GROUP BY P.FirstName, P.LastName, P.Address, P.City, P.Province
ORDER BY P.Province ASC, P.City ASC, P.Address ASC;



-- for CLSC H
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT LWE.PersonID) AS 'Total Employees Living with Infected',
    P.Address,
    P.City,
    P.Province
FROM Employees E
JOIN Persons P ON E.MedicareCard = P.MedicareCard
JOIN LivesWithEmployee LWE ON P.MedicareCard = LWE.MedicareCard
JOIN Employees E2 ON LWE.MedicareCard = E2.MedicareCard
JOIN HadInfections HI ON LWE.PersonID = HI.PersonID
WHERE E.FacilityName = 'CLSC H'
AND E2.FacilityName = E.FacilityName
AND HI.InfectionType = 'COVID-19'
AND E.EndDate IS NULL
AND E2.EndDate IS NULL
GROUP BY P.FirstName, P.LastName, P.Address, P.City, P.Province
ORDER BY P.Province ASC, P.City ASC, P.Address ASC;


-- for Lakeshore
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT LWE.PersonID) AS 'Total Employees Living with Infected',
    P.Address,
    P.City,
    P.Province
FROM Employees E
JOIN Persons P ON E.MedicareCard = P.MedicareCard
JOIN LivesWithEmployee LWE ON P.MedicareCard = LWE.MedicareCard
JOIN Employees E2 ON LWE.MedicareCard = E2.MedicareCard
JOIN HadInfections HI ON LWE.PersonID = HI.PersonID
WHERE E.FacilityName = 'Lakeshore'
AND E2.FacilityName = E.FacilityName
AND HI.InfectionType = 'COVID-19'
AND E.EndDate IS NULL
AND E2.EndDate IS NULL
GROUP BY P.FirstName, P.LastName, P.Address, P.City, P.Province
ORDER BY P.Province ASC, P.City ASC, P.Address ASC;


-- for Justine
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT LWE.PersonID) AS 'Total Employees Living with Infected',
    P.Address,
    P.City,
    P.Province
FROM Employees E
JOIN Persons P ON E.MedicareCard = P.MedicareCard
JOIN LivesWithEmployee LWE ON P.MedicareCard = LWE.MedicareCard
JOIN Employees E2 ON LWE.MedicareCard = E2.MedicareCard
JOIN HadInfections HI ON LWE.PersonID = HI.PersonID
WHERE E.FacilityName = 'Justine'
AND E2.FacilityName = E.FacilityName
AND HI.InfectionType = 'COVID-19'
AND E.EndDate IS NULL
AND E2.EndDate IS NULL
GROUP BY P.FirstName, P.LastName, P.Address, P.City, P.Province
ORDER BY P.Province ASC, P.City ASC, P.Address ASC;

-- for UniDollar
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT LWE.PersonID) AS 'Total Employees Living with Infected',
    P.Address,
    P.City,
    P.Province
FROM Employees E
JOIN Persons P ON E.MedicareCard = P.MedicareCard
JOIN LivesWithEmployee LWE ON P.MedicareCard = LWE.MedicareCard
JOIN Employees E2 ON LWE.MedicareCard = E2.MedicareCard
JOIN HadInfections HI ON LWE.PersonID = HI.PersonID
WHERE E.FacilityName = 'UniDollar'
AND E2.FacilityName = E.FacilityName
AND HI.InfectionType = 'COVID-19'
AND E.EndDate IS NULL
AND E2.EndDate IS NULL
GROUP BY P.FirstName, P.LastName, P.Address, P.City, P.Province
ORDER BY P.Province ASC, P.City ASC, P.Address ASC;

-- for General Hospital
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT LWE.PersonID) AS 'Total Employees Living with Infected',
    P.Address,
    P.City,
    P.Province
FROM Employees E
JOIN Persons P ON E.MedicareCard = P.MedicareCard
JOIN LivesWithEmployee LWE ON P.MedicareCard = LWE.MedicareCard
JOIN Employees E2 ON LWE.MedicareCard = E2.MedicareCard
JOIN HadInfections HI ON LWE.PersonID = HI.PersonID
WHERE E.FacilityName = 'General Hospital'
AND E2.FacilityName = E.FacilityName
AND HI.InfectionType = 'COVID-19'
AND E.EndDate IS NULL
AND E2.EndDate IS NULL
GROUP BY P.FirstName, P.LastName, P.Address, P.City, P.Province
ORDER BY P.Province ASC, P.City ASC, P.Address ASC;

-- for Faubourg Clinic
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT LWE.PersonID) AS 'Total Employees Living with Infected',
    P.Address,
    P.City,
    P.Province
FROM Employees E
JOIN Persons P ON E.MedicareCard = P.MedicareCard
JOIN LivesWithEmployee LWE ON P.MedicareCard = LWE.MedicareCard
JOIN Employees E2 ON LWE.MedicareCard = E2.MedicareCard
JOIN HadInfections HI ON LWE.PersonID = HI.PersonID
WHERE E.FacilityName = 'Faubourg Clinic'
AND E2.FacilityName = E.FacilityName
AND HI.InfectionType = 'COVID-19'
AND E.EndDate IS NULL
AND E2.EndDate IS NULL
GROUP BY P.FirstName, P.LastName, P.Address, P.City, P.Province
ORDER BY P.Province ASC, P.City ASC, P.Address ASC;

-- for Sunset Center
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT LWE.PersonID) AS 'Total Employees Living with Infected',
    P.Address,
    P.City,
    P.Province
FROM Employees E
JOIN Persons P ON E.MedicareCard = P.MedicareCard
JOIN LivesWithEmployee LWE ON P.MedicareCard = LWE.MedicareCard
JOIN Employees E2 ON LWE.MedicareCard = E2.MedicareCard
JOIN HadInfections HI ON LWE.PersonID = HI.PersonID
WHERE E.FacilityName = 'Sunset Center'
AND E2.FacilityName = E.FacilityName
AND HI.InfectionType = 'COVID-19'
AND E.EndDate IS NULL
AND E2.EndDate IS NULL
GROUP BY P.FirstName, P.LastName, P.Address, P.City, P.Province
ORDER BY P.Province ASC, P.City ASC, P.Address ASC;

-- for Green Pharmacy
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT LWE.PersonID) AS 'Total Employees Living with Infected',
    P.Address,
    P.City,
    P.Province
FROM Employees E
JOIN Persons P ON E.MedicareCard = P.MedicareCard
JOIN LivesWithEmployee LWE ON P.MedicareCard = LWE.MedicareCard
JOIN Employees E2 ON LWE.MedicareCard = E2.MedicareCard
JOIN HadInfections HI ON LWE.PersonID = HI.PersonID
WHERE E.FacilityName = 'Green Pharmacy'
AND E2.FacilityName = E.FacilityName
AND HI.InfectionType = 'COVID-19'
AND E.EndDate IS NULL
AND E2.EndDate IS NULL
GROUP BY P.FirstName, P.LastName, P.Address, P.City, P.Province
ORDER BY P.Province ASC, P.City ASC, P.Address ASC;

-- for Santiago Bernabeu
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT LWE.PersonID) AS 'Total Employees Living with Infected',
    P.Address,
    P.City,
    P.Province
FROM Employees E
JOIN Persons P ON E.MedicareCard = P.MedicareCard
JOIN LivesWithEmployee LWE ON P.MedicareCard = LWE.MedicareCard
JOIN Employees E2 ON LWE.MedicareCard = E2.MedicareCard
JOIN HadInfections HI ON LWE.PersonID = HI.PersonID
WHERE E.FacilityName = 'Santiago Bernabeu'
AND E2.FacilityName = E.FacilityName
AND HI.InfectionType = 'COVID-19'
AND E.EndDate IS NULL
AND E2.EndDate IS NULL
GROUP BY P.FirstName, P.LastName, P.Address, P.City, P.Province
ORDER BY P.Province ASC, P.City ASC, P.Address ASC;


-- insert data for iii)
-- Example insertion for one more residence, repeat or modify as needed
INSERT INTO Residence (HouseType, Address, City, Province, PostalCode, ResidencePhoneNumber, AmountBedrooms) VALUES
('house', '1000 Unique St', 'Montreal', 'Quebec', 'A1A 1A1', '514-000-0000', 4),
('condominium', '2000 Sample Ave', 'Laval', 'Quebec', 'B2B 2B2', '514-111-1111', 3),
('apartment', '10 Facility Ave', 'City1', 'Province1', 'P0C0D0', '514-101-1010', 2),
('house', '20 Facility St', 'City2', 'Province2', 'P1C1D1', '514-102-1020', 3);
-- Add more residences as per the requirement of your scenario
-- Adding new persons
INSERT INTO Persons (PersonID, FirstName, LastName, DateOfBirth, SocialSecurity, MedicareCard, PhoneNumber, Citizenship, Email, Address, City, Province, PostalCode) VALUES
(2001, 'John', 'Doe', '1980-01-01', 'SSN2001', 'MCN2001', '514-200-2001', 'Canadian', 'john.doe@email.com', '1000 Unique St', 'Montreal', 'Quebec', 'A1A 1A1'),
(2002, 'Jane', 'Doe', '1982-02-02', 'SSN2002', 'MCN2002', '514-200-2002', 'Canadian', 'jane.doe@email.com', '1000 Unique St', 'Montreal', 'Quebec', 'A1A 1A1'),
(3001, 'Employee1', 'Facility1', '1990-01-01', 'SSN3001', 'MCN3001', '514-300-3001', 'Canadian', 'employee1@facility1.com', '10 Facility Ave', 'City1', 'Province1', 'P0C0D0'),
(3002, 'Employee2', 'Facility1', '1991-02-02', 'SSN3002', 'MCN3002', '514-300-3002', 'Canadian', 'employee2@facility1.com', '10 Facility Ave', 'City1', 'Province1', 'P0C0D0');
-- Repeat for other facilities and ensure some of these new persons are living together
-- Assigning employees to facilities
INSERT INTO Employees (MedicareCard, FacilityName, Job, StartDate, EndDate) VALUES
('MCN2001', 'Hospital Maisonneuve Rosemont', 'doctor', '2022-01-01', NULL),
('MCN2002', 'Hospital Maisonneuve Rosemont', 'nurse', '2022-02-01', NULL),
('MCN3001', 'CLSC H', 'doctor', '2023-01-01', NULL),
('MCN3002', 'CLSC H', 'nurse', '2023-01-02', NULL);
-- Repeat for each facility with modifications as necessary
-- Marking some employees as infected
INSERT INTO HadInfections (PersonID, DateOfInfection, InfectionNumber, InfectionType) VALUES
(2001, '2023-01-01', 1, 'COVID-19'),
(3001, '2023-01-15', 1, 'COVID-19');
-- Ensure there's at least one infection per facility among the living arrangements
-- Linking employees living together
INSERT INTO LivesWithEmployee (MedicareCard, PersonID, Relationship) VALUES
('MCN2001', 2002, 'Partner'),
('MCN3001', 3002, 'Partner');


# iv)
-- For every province, give the total number of employees who are currently working 
-- and also the total number of employees who are currently working and are currently 
-- infected by COVID-19. Results should be displayed in ascending order by total 
-- number of employees working for the province and infected by COVID-19. 

-- NOTE: We assume current infection if it's after february 1st, as asymptomatic cases can occur.
SELECT F.Province, 
	   COUNT(DISTINCT E.MedicareCard) AS `Number Of Employees`,
       COUNT(DISTINCT CASE WHEN H.InfectionType = 'COVID-19' AND H.DateOfInfection >= '2024-02-01' THEN E.MedicareCard END) AS `Employees who are Working and Infected`
FROM Facilities F
JOIN Employees E ON E.FacilityName = F.FacilityName AND E.EndDate IS NULL
JOIN Persons P ON P.MedicareCard = E.MedicareCard
LEFT JOIN HadInfections H ON H.PersonID = P.PersonID
GROUP BY F.Province 
ORDER BY `Employees who are Working and Infected` ASC;


# v)
-- For the facility Hospital Maisonneuve Rosemont, give the details of all the nurses and doctors
--  who are currently working and got infected at least once with COVID-19. 
-- the total number of people who are currently living with the infected employee.
--  Results should be displayed sorted in descending order by date of infection
--  then ascending order by first name, then ascending order by last name.
	
SELECT 
    P.FirstName,
    P.LastName,
    E.Job AS 'Role',
    E.MedicareCard,
    P.SocialSecurity,
    P.PhoneNumber AS 'Telephone Number',
    P.Email,
    I.DateOfInfection,
    COUNT(DISTINCT L.PersonID) AS 'Total People Living with Infected Employee'
FROM Persons P
JOIN Employees E ON P.MedicareCard = E.MedicareCard
JOIN HadInfections I ON P.PersonID = I.PersonID
LEFT JOIN LivesWithEmployee L ON P.MedicareCard = L.MedicareCard
WHERE E.FacilityName = 'Hospital Maisonneuve Rosemont' 
AND E.EndDate IS NULL
AND E.Job IN ('nurse', 'doctor')
AND I.InfectionType = 'COVID-19'
GROUP BY P.FirstName, P.LastName, E.Job, E.MedicareCard, P.SocialSecurity, P.PhoneNumber, P.Email, I.DateOfInfection
ORDER BY I.DateOfInfection DESC, P.FirstName ASC, P.LastName ASC;

#vi)
-- Vi)
SELECT 
    P.FirstName,
    P.LastName,
    E.Job,
    P.MedicareCard,
    P.SocialSecurity,
    P.PhoneNumber,
    P.Email,
    COUNT(DISTINCT L.PersonID) AS 'Number of People Living with Employee'
FROM 
    Employees E
JOIN 
    Persons P ON E.MedicareCard = P.MedicareCard
LEFT JOIN 
    LivesWithEmployee L ON P.MedicareCard = L.MedicareCard
LEFT JOIN 
    HasVaccines V ON P.PersonID = V.PersonID
LEFT JOIN 
    HadInfections I ON P.PersonID = I.PersonID
WHERE 
    E.FacilityName = 'Hospital Maisonneuve Rosemont' AND
    E.EndDate IS NULL AND
    V.PersonID IS NULL AND
    I.PersonID IS NULL
GROUP BY 
    P.FirstName, P.LastName, E.Job, P.MedicareCard, P.SocialSecurity, P.PhoneNumber, P.Email
ORDER BY 
    E.Job ASC, P.FirstName ASC, P.LastName ASC;

-- queries to add data to test the query for vi)
INSERT INTO Persons (PersonID, FirstName, LastName, DateOfBirth, SocialSecurity, MedicareCard, PhoneNumber, Citizenship, Email, Address, City, Province, PostalCode) VALUES
(1001, 'Nora', 'Fields', '1987-03-21', 'SSN1001', 'MCN1001', '514-100-2001', 'Canadian', 'nora.fields@email.com', '123 West', 'Montreal', 'Quebec', 'H4S 3L4'),
(1002, 'Evan', 'Smith', '1992-07-14', 'SSN1002', 'MCN1002', '514-100-2002', 'Canadian', 'evan.smith@email.com', '456 Maple', 'Laval', 'Quebec', 'G12 J37');

INSERT INTO Employees (MedicareCard, FacilityName, Job, StartDate, EndDate) VALUES
('MCN1001', 'Hospital Maisonneuve Rosemont', 'nurse', '2022-01-01', NULL),
('MCN1002', 'Hospital Maisonneuve Rosemont', 'doctor', '2022-01-01', NULL);

INSERT INTO LivesWithEmployee (MedicareCard, PersonID, Relationship) VALUES
('MCN1001', 1002, 'Partner');



# vii)
--  For each vaccine type, give the total number of doses taken by either the employees 
-- in the system or by the people recorded in the system who live with the employees. 
-- Results should be displayed in descending order by total number of doses. 

	-- Added modifications to ensure that the person taking the vaccines is really an employee or someone living with them.
SELECT Type, COUNT(*) AS `Total Doses`
FROM HasVaccines V
WHERE EXISTS (
    SELECT * FROM Employees E,Persons P WHERE P.PersonID = V.PersonID AND P.MedicareCard = E.MedicareCard
    UNION
    SELECT * FROM LivesWithEmployee L WHERE L.PersonID = V.PersonID
)
GROUP BY Type
ORDER BY `Total Doses` DESC;



# viii)
-- For every employee in the system who is currently working and got infected at least 
-- 3 times, give the employee’s first-name, last-name, start date, facility name, role 
-- (nurse, doctor, etc.), Medicare card number, Social Security Number, telephone number, 
-- email address, the total number of infections, the total number of people 
-- who currently live with the employee, the residence type, and the total number of 
-- bedrooms of the residence he/she lives in. Results should be displayed in ascending 
-- order of the total number of infections, then by first name, then by last name. 

SELECT
    P.FirstName AS `First Name`,
    P.Lastname AS `Last Name`,
    E.StartDate AS `Start Of Employment`,
    E.FacilityName AS `Facility Employment`,
    E.Job AS `Role`,
    E.MedicareCard AS `Medicare Card`,
    P.SocialSecurity AS `Social Security Number`,
    P.PhoneNumber AS `Phone Number`,
    P.Email,
	( #To calculate for number of infections a person had.
        SELECT COUNT(*)
        FROM HadInfections H
        WHERE H.PersonID = P.PersonID
    ) AS `Total Number Of Infections`,
    
    COUNT(DISTINCT L.PersonID) AS `Total Number Of people Who Lives with him/her/them`,
    R.HouseType AS `House Type`,
    R.AmountBedrooms AS `Amount Of Bedrooms`
    
FROM Employees E
JOIN Persons P ON P.MedicareCard = E.MedicareCard
JOIN Facilities F ON F.FacilityName = E.FacilityName
LEFT JOIN LivesWithEmployee L ON E.MedicareCard = L.MedicareCard AND P.MedicareCard = L.MedicareCard
JOIN Residence R ON ((R.Address = P.Address) AND (R.City = P.City) AND (R.Province = P.Province) AND (R.PostalCode = P.PostalCode))
WHERE E.EndDate IS NULL 
GROUP BY P.FirstName, P.LastName, E.StartDate, F.FacilityName, E.Job, P.MedicareCard, P.SocialSecurity, R.HouseType, R.AmountBedrooms
HAVING `Total Number Of Infections` >= 3 
ORDER BY `Total Number Of Infections` ASC, `First Name` ASC, `Last Name` ASC;



--------------------------------------------------------------------------------------------
-- all select count(*) from R
select count(*) from Persons;
select count(*) from Facilities;
select count(*) from HadInfections;
select count(*) from HasVaccines;
select count(*) from Employees;
select count(*) from Residence;
select count(*) from LivesWithEmployee;
