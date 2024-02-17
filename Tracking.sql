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

# iii)
-- For a given facility, provide a list of all employees who currently live with at least 
-- another employee who is currently working at the same facility and at least one of 
-- those employees is currently infected by COVID-19. The list should include the 
-- employee’s first name, last name, total number of employees living with the 
-- infected employee, address, city, and province. Results should be displayed sorted 
-- in ascending order by province, then city, then address. 



# iv)


# v)



#vi)



# vii)


# viii)
