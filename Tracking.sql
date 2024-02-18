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
    COUNT(DISTINCT L.PersonID) AS 'Total Employees Living with Infected',
    R.Address,
    R.City,
    R.Province
FROM Persons P
JOIN LivesWithEmployee L ON P.PersonID = L.PersonID
JOIN Infections I ON P.PersonID = I.PersonID
JOIN Employees E ON P.PersonID = E.PersonID
JOIN Residence R ON P.ResidenceID = R.ResidenceID
WHERE I.InfectionType = 'COVID-19'
AND E.FacilityID = (SELECT FacilityID FROM Facilities WHERE FacilityName = 'Hospital Maisonneuve Rosemont') 
AND E.EndDate IS NULL
AND EXISTS (
    SELECT 1 FROM LivesWithEmployee L2
    WHERE L2.MedicareCard = E.MedicareCard
    AND L2.PersonID != P.PersonID
)
GROUP BY P.FirstName, P.LastName, R.Address, R.City, R.Province
ORDER BY R.Province, R.City, R.Address;


-- for CLSC H
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT L.PersonID) AS 'Total Employees Living with Infected',
    R.Address,
    R.City,
    R.Province
FROM Persons P
JOIN LivesWithEmployee L ON P.PersonID = L.PersonID
JOIN Infections I ON P.PersonID = I.PersonID
JOIN Employees E ON P.PersonID = E.PersonID
JOIN Residence R ON P.ResidenceID = R.ResidenceID
WHERE I.InfectionType = 'COVID-19'
AND E.FacilityID = (SELECT FacilityID FROM Facilities WHERE FacilityName = 'CLSC H') 
AND E.EndDate IS NULL
AND EXISTS (
    SELECT 1 FROM LivesWithEmployee L2
    WHERE L2.MedicareCard = E.MedicareCard
    AND L2.PersonID != P.PersonID
)
GROUP BY P.FirstName, P.LastName, R.Address, R.City, R.Province
ORDER BY R.Province, R.City, R.Address;

-- for Lakeshore
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT L.PersonID) AS 'Total Employees Living with Infected',
    R.Address,
    R.City,
    R.Province
FROM Persons P
JOIN LivesWithEmployee L ON P.PersonID = L.PersonID
JOIN Infections I ON P.PersonID = I.PersonID
JOIN Employees E ON P.PersonID = E.PersonID
JOIN Residence R ON P.ResidenceID = R.ResidenceID
WHERE I.InfectionType = 'COVID-19'
AND E.FacilityID = (SELECT FacilityID FROM Facilities WHERE FacilityName = 'Lakeshore') 
AND E.EndDate IS NULL
AND EXISTS (
    SELECT 1 FROM LivesWithEmployee L2
    WHERE L2.MedicareCard = E.MedicareCard
    AND L2.PersonID != P.PersonID
)
GROUP BY P.FirstName, P.LastName, R.Address, R.City, R.Province
ORDER BY R.Province, R.City, R.Address;

-- for Justine
SELECT 
    SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT L.PersonID) AS 'Total Employees Living with Infected',
    R.Address,
    R.City,
    R.Province
FROM Persons P
JOIN LivesWithEmployee L ON P.PersonID = L.PersonID
JOIN Infections I ON P.PersonID = I.PersonID
JOIN Employees E ON P.PersonID = E.PersonID
JOIN Residence R ON P.ResidenceID = R.ResidenceID
WHERE I.InfectionType = 'COVID-19'
AND E.FacilityID = (SELECT FacilityID FROM Facilities WHERE FacilityName = 'Justine') 
AND E.EndDate IS NULL
AND EXISTS (
    SELECT 1 FROM LivesWithEmployee L2
    WHERE L2.MedicareCard = E.MedicareCard
    AND L2.PersonID != P.PersonID
)
GROUP BY P.FirstName, P.LastName, R.Address, R.City, R.Province
ORDER BY R.Province, R.City, R.Address;

-- for UniDollar
SELECT 
    SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT L.PersonID) AS 'Total Employees Living with Infected',
    R.Address,
    R.City,
    R.Province
FROM Persons P
JOIN LivesWithEmployee L ON P.PersonID = L.PersonID
JOIN Infections I ON P.PersonID = I.PersonID
JOIN Employees E ON P.PersonID = E.PersonID
JOIN Residence R ON P.ResidenceID = R.ResidenceID
WHERE I.InfectionType = 'COVID-19'
AND E.FacilityID = (SELECT FacilityID FROM Facilities WHERE FacilityName = 'UniDollar') 
AND E.EndDate IS NULL
AND EXISTS (
    SELECT 1 FROM LivesWithEmployee L2
    WHERE L2.MedicareCard = E.MedicareCard
    AND L2.PersonID != P.PersonID
)
GROUP BY P.FirstName, P.LastName, R.Address, R.City, R.Province
ORDER BY R.Province, R.City, R.Address;

-- for General Hospital
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT L.PersonID) AS 'Total Employees Living with Infected',
    R.Address,
    R.City,
    R.Province
FROM Persons P
JOIN LivesWithEmployee L ON P.PersonID = L.PersonID
JOIN Infections I ON P.PersonID = I.PersonID
JOIN Employees E ON P.PersonID = E.PersonID
JOIN Residence R ON P.ResidenceID = R.ResidenceID
WHERE I.InfectionType = 'COVID-19'
AND E.FacilityID = (SELECT FacilityID FROM Facilities WHERE FacilityName = 'General Hospital') 
AND E.EndDate IS NULL
AND EXISTS (
    SELECT 1 FROM LivesWithEmployee L2
    WHERE L2.MedicareCard = E.MedicareCard
    AND L2.PersonID != P.PersonID
)
GROUP BY P.FirstName, P.LastName, R.Address, R.City, R.Province
ORDER BY R.Province, R.City, R.Address;

-- for Faubourg Clinic
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT L.PersonID) AS 'Total Employees Living with Infected',
    R.Address,
    R.City,
    R.Province
FROM Persons P
JOIN LivesWithEmployee L ON P.PersonID = L.PersonID
JOIN Infections I ON P.PersonID = I.PersonID
JOIN Employees E ON P.PersonID = E.PersonID
JOIN Residence R ON P.ResidenceID = R.ResidenceID
WHERE I.InfectionType = 'COVID-19'
AND E.FacilityID = (SELECT FacilityID FROM Facilities WHERE FacilityName = 'Faubourg Clinic') 
AND E.EndDate IS NULL
AND EXISTS (
    SELECT 1 FROM LivesWithEmployee L2
    WHERE L2.MedicareCard = E.MedicareCard
    AND L2.PersonID != P.PersonID
)
GROUP BY P.FirstName, P.LastName, R.Address, R.City, R.Province
ORDER BY R.Province, R.City, R.Address;

-- for Sunset Center
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT L.PersonID) AS 'Total Employees Living with Infected',
    R.Address,
    R.City,
    R.Province
FROM Persons P
JOIN LivesWithEmployee L ON P.PersonID = L.PersonID
JOIN Infections I ON P.PersonID = I.PersonID
JOIN Employees E ON P.PersonID = E.PersonID
JOIN Residence R ON P.ResidenceID = R.ResidenceID
WHERE I.InfectionType = 'COVID-19'
AND E.FacilityID = (SELECT FacilityID FROM Facilities WHERE FacilityName = 'Sunset Center') 
AND E.EndDate IS NULL
AND EXISTS (
    SELECT 1 FROM LivesWithEmployee L2
    WHERE L2.MedicareCard = E.MedicareCard
    AND L2.PersonID != P.PersonID
)
GROUP BY P.FirstName, P.LastName, R.Address, R.City, R.Province
ORDER BY R.Province, R.City, R.Address;

-- for Green Pharmacy
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT L.PersonID) AS 'Total Employees Living with Infected',
    R.Address,
    R.City,
    R.Province
FROM Persons P
JOIN LivesWithEmployee L ON P.PersonID = L.PersonID
JOIN Infections I ON P.PersonID = I.PersonID
JOIN Employees E ON P.PersonID = E.PersonID
JOIN Residence R ON P.ResidenceID = R.ResidenceID
WHERE I.InfectionType = 'COVID-19'
AND E.FacilityID = (SELECT FacilityID FROM Facilities WHERE FacilityName = 'Green Pharmacy') 
AND E.EndDate IS NULL
AND EXISTS (
    SELECT 1 FROM LivesWithEmployee L2
    WHERE L2.MedicareCard = E.MedicareCard
    AND L2.PersonID != P.PersonID
)
GROUP BY P.FirstName, P.LastName, R.Address, R.City, R.Province
ORDER BY R.Province, R.City, R.Address;

-- for Santiago Bernabeu
SELECT 
    P.FirstName,
    P.LastName,
    COUNT(DISTINCT L.PersonID) AS 'Total Employees Living with Infected',
    R.Address,
    R.City,
    R.Province
FROM Persons P
JOIN LivesWithEmployee L ON P.PersonID = L.PersonID
JOIN Infections I ON P.PersonID = I.PersonID
JOIN Employees E ON P.PersonID = E.PersonID
JOIN Residence R ON P.ResidenceID = R.ResidenceID
WHERE I.InfectionType = 'COVID-19'
AND E.FacilityID = (SELECT FacilityID FROM Facilities WHERE FacilityName = 'Santiago Bernabeu') 
AND E.EndDate IS NULL
AND EXISTS (
    SELECT 1 FROM LivesWithEmployee L2
    WHERE L2.MedicareCard = E.MedicareCard
    AND L2.PersonID != P.PersonID
)
GROUP BY P.FirstName, P.LastName, R.Address, R.City, R.Province
ORDER BY R.Province, R.City, R.Address;

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



# vii)


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

