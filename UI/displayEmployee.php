<?php include 'navbar.php';  ?>


<?php
require_once 'connection.php';
require_once 'functions/CRUD_Employee.php'; // Include CRUD_Facility.php

// Fetch all employees with their names and facility names
$statement = $conn_pdo->query('SELECT e.MedicareCard, p.FirstName, p.LastName, f.FacilityName, e.Job, e.StartDate, e.EndDate
                                FROM Employees e
                                JOIN Persons p ON e.MedicareCard = p.MedicareCard
                                JOIN Facilities f ON e.FacilityID = f.FacilityID
                                GROUP BY e.FacilityID, e.MedicareCard');

$employees = $statement->fetchAll(PDO::FETCH_ASSOC);


// Check if delete parameter is present in the URL
if (isset($_GET["deleteID"]) && isset($_GET["startDate"]) && isset($_GET["endDate"])) {
    $medicareCard = $_GET["deleteID"];
    $s_date = $_GET["startDate"];
    $e_date = $_GET["endDate"];
    $deleteMessage = deleteEmployee($medicareCard, $s_date, $_e_date);
    echo "<script>alert('$deleteMessage'); window.location.href = 'displayEmployee.php';</script>";
    exit; // Prevent further execution after deletion
}
?>


<!DOCTYPE Html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Employees</title>
    <!-- Include your stylesheet -->
    <link rel="stylesheet" href="Styling/employees.css">
</head>


<body>
<h1>Employee Information</h1>

<table>
    <thead>
        <tr>
            <th>Medicare Card</th>
            <th>First name </th>
            <th>Last name </th>
            <th>Facility Name</th>
            <th>Job</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th> Edit </th>
            <th> Delete </th>
        </tr>
    </thead>
    <tbody>
        <!--Display all data from it -->
        <?php foreach ($employees as $employee) : ?>
            <tr>
                <td><?= $employee['MedicareCard'] ?></td>
                <td><?= $employee['FirstName'] ?></td>
                <td><?= $employee['LastName'] ?></td>
                <td><?= $employee['FacilityName'] ?></td>
                <td><?= $employee['Job'] ?></td>
                <td><?= $employee['StartDate'] ?></td>
                <td><?= $employee['EndDate'] ?? 'Ongoing' ?></td> <!-- Display 'Ongoing' if EndDate is NULL -->
                <td><a href="./editEmployee.php?ID=<?= urlencode($employee["MedicareCard"]) ?>
                            &startDate=<?= urlencode($employee["StartDate"]) ?>
                            &endDate=<?=urlencode($employee['EndDate']) ?>">
                            Edit
                    </a>
                </td> 
                
                <td><a href="?deleteID=<?= urlencode($employee["MedicareCard"]) ?>
                            &startDate=<?= urlencode($employee["StartDate"]) ?>
                            &endDate=<?=urlencode($employee['EndDate']) ?>">
                            Delete
                    </a>
                </td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<a href="Employee.php">Back to Previous Page</a>


</body>



</html>