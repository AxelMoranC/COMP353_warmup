<?php include 'navbar.php' ?>

<?php

// Database connection
require_once 'connection.php';

// data
$sql = "SELECT P.FirstName, P.LastName, H.DateOfVaccination, H.DoseNumber, H.Location, H.Type
        FROM HasVaccines H
        JOIN Persons P ON H.PersonID = P.PersonID";

//SQL
$statement = $conn_pdo->prepare($sql);
$statement->execute();
$vaccinations = $statement->fetchAll(PDO::FETCH_ASSOC);

// Close the database connection
$conn_pdo = null;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Vaccinations</title>
    <link rel="stylesheet" href="Styling/facilities.css">
</head>
<body>
    <h1>All Vaccinations</h1>

    <table>
        <thead>
            <tr>
                <th>Edit</th>
                <th>Delete</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Date of Vaccination</th>
                <th>Dose Number</th>
                <th>Location</th>
                <th>Vaccine Type</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($vaccinations as $vaccination) { ?>
                <tr>
                    <td> </td>
                    <td> </td>
                    <td><?= $vaccination['FirstName'] ?></td>
                    <td><?= $vaccination['LastName'] ?></td>
                    <td><?= $vaccination['DateOfVaccination'] ?></td>
                    <td><?= $vaccination['DoseNumber'] ?></td>
                    <td><?= $vaccination['Location'] ?></td>
                    <td><?= $vaccination['Type'] ?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
</body>
</html>
