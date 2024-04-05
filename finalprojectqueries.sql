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
INSERT INTO Residence (HouseType, Address, City, Province, PostalCode, ResidencePhoneNumber, AmountBedrooms) VALUES
('condominium', '321 Oak St', 'Vancouver', 'British Columbia', 'V6B 2J4', '438-888-3456', 3),
('house', '987 Maple St', 'Calgary', 'Alberta', 'T2P 1E4', '450-999-5678', 5),
('apartment', '654 Cedar St', 'Ottawa', 'Ontario', 'K1P 5H1', '514-333-8765', 1),
('semidetached house', '234 Birch', 'Montreal', 'Quebec', 'G12 K78', '514-777-8888', 3),
('condominium', '321 Daisy', 'Montreal', 'Quebec', 'HHI 3JK', '716-987-6543', 2);

-- Assuming PersonID 1 to 5 are linked to some Employees, and we're setting up secondary residences for them
INSERT INTO SecondaryResidence (PersonID, ResidenceID, ResidenceType, StartDateAtAddress) VALUES
(1, 21, 'Secondary', '2019-01-01'),
(2, 22, 'Secondary', '2019-02-01'),
(3, 23, 'Secondary', '2019-03-01'),
(4, 24, 'Secondary', '2019-04-01'),
(5, 25, 'Secondary', '2019-05-01');

-- Update or insert Employees to ensure they are currently working at FacilityID = 1 and have a valid MedicareCard from Persons table
INSERT INTO Employees (MedicareCard, FacilityID, Job, StartDate) VALUES
('M987654321', 1, 'nurse', '2020-01-01'),
('M876543210', 1, 'doctor', '2020-01-02'),
('M888888888', 1, 'cashier', '2020-01-03'),
('M888888880', 1, 'pharmacist', '2020-01-04'),
('M888888800', 1, 'receptionist', '2020-01-05');


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
