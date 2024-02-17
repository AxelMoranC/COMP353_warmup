# i)
-- For every facility in the system, get the province name where the facility is located, 
-- the facility name, the maximum number of employees that the facility needs to 
-- operate, the total number of employees currently working for the facility, and the 
-- total number of people who live with the current employees. 
SELECT 
    F.Province, F.FacilityName, F.Capacity,
    COUNT(E.EmployeeID),
    COUNT(DISTINCT L.PersonID)
FROM Facilities F
JOIN Employees E ON F.FacilityID = E.FacilityID
JOIN LivesWithEmployees L ON E.EmployeeID = L.EmployeeID
GROUP BY F.Province, F.FacilityName, F.Capacity;


# ii)
--  For a given facility, provide a report that displays for every employee who is 
-- currently working for the facility, the number of roommates, the number of 
-- dependents, the number of parents, and the total number of people who currently 
-- live with the employee. 


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
