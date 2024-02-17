# i)
SELECT 
    F.Province, F.FacilityName, F.Capacity,
    COUNT(E.EmployeeID),
    COUNT(DISTINCT L.PersonID)
FROM Facilities F
JOIN Employees E ON F.FacilityID = E.FacilityID
JOIN LivesWithEmployees L ON E.EmployeeID = L.EmployeeID
GROUP BY F.Province, F.FacilityName, F.Capacity;


# ii)


# iii)


# iv)


# v)



#vi)



# vii)


# viii)
