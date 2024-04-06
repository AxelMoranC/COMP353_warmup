<?php include 'navbar.php'; ?>

<?php
require_once 'connection.php';

//employees details and job information about covid 
$sql = "SELECT H.*, P.FirstName, P.LastName, E.Job, F.FacilityName 
        FROM HadInfections H
        JOIN Persons P ON H.PersonID = P.PersonID
        JOIN Employees E ON P.MedicareCard = E.MedicareCard
        JOIN Facilities F ON E.FacilityID = F.FacilityID
        ORDER BY H.DateOfInfection ASC";

// Fetch non-employee infections data
$sql2 = "SELECT P.FirstName, P.LastName, E.Job, F.FacilityName, L.Relationship
        FROM LivesWithEmployee L
        JOIN Persons P ON L.PersonID = P.PersonID
        JOIN Employees E ON L.MedicareCard = E.MedicareCard
        JOIN Facilities F ON E.FacilityID = F.FacilityID";

$statement = $conn_pdo->prepare($sql);
$statement->execute();
$infections = $statement->fetchAll(PDO::FETCH_ASSOC);

$statement2 = $conn_pdo->prepare($sql2);
$statement2->execute();
$infections_NonEmployees = $statement2->fetchAll(PDO::FETCH_ASSOC);

// Close the database connection
$conn_pdo = null;
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>All Infections</title>
    <link rel="stylesheet" href="Styling/facilities.css">
</head>

<body>
    <h1>All Infections</h1>

    <table>
        <thead>
            <tr>
                <th>Edit</th>
                <th>Delete</th>
                <th>Date of Infection</th>
                <th>Infection Number</th>
                <th>Infection Type</th>
                <th>Person Name</th>
                <th>Job</th>
                <th>Facility</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($infections as $infection) { ?>
                <tr>
                    <td><?php echo $infection['DateOfInfection']; ?></td>
                    <td><?php echo $infection['InfectionNumber']; ?></td>
                    <td><?php echo $infection['InfectionType']; ?></td>
                    <td><?php echo $infection['FirstName'] . ' ' . $infection['LastName']; ?></td>
                    <td><?php echo $infection['Job']; ?></td>
                    <td><?php echo $infection['FacilityName']; ?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>

    <h1>Non-Employee Infections</h1>

    <table>
        <thead>
            <tr>
                <th>Edit</th>
                <th>Delete</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Job</th>
                <th>Facility</th>
                <th>Relationship with Employee</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($infections_NonEmployees as $infection) { ?>
                <tr>
                    <td><?= $infection['FirstName'] ?></td>
                    <td><?= $infection['LastName'] ?></td>
                    <td><?= $infection['Job'] ?></td>
                    <td><?= $infection['FacilityName'] ?></td>
                    <td><?= $infection['Relationship'] ?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>

</body>

</html>
