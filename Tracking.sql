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
