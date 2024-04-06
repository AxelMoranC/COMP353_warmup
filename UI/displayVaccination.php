<?php include 'navbar.php' ?>

<?php

// Database connection
require_once 'connection.php';

// data
$sql = "SELECT P.FirstName, P.LastName, H.PersonID, H.DateOfVaccination, H.DoseNumber, H.Location, H.Type
        FROM HasVaccines H
        JOIN Persons P ON H.PersonID = P.PersonID
        GROUP BY P.PersonID, H.DoseNumber
        ORDER BY P.PersonID, H.DoseNumber ASC";

//SQL
$statement = $conn_pdo->prepare($sql);
$statement->execute();
$vaccinations = $statement->fetchAll(PDO::FETCH_ASSOC);

// Check if deleteId, date, and dose are provided in the URL
if (isset($_GET['deleteId']) && isset($_GET['date']) && isset($_GET['dose'])) {
    $personID = $_GET['deleteId'];
    $dateOfVaccination = $_GET['date'];
    $doseNumber = $_GET['dose'];

    // Delete the vaccination record from the database
    $sql = "DELETE FROM HasVaccines WHERE PersonID = :personID AND DateOfVaccination = :dateOfVaccination AND DoseNumber = :doseNumber";
    $statement = $conn_pdo->prepare($sql);
    $statement->bindParam(':personID', $personID);
    $statement->bindParam(':dateOfVaccination', $dateOfVaccination);
    $statement->bindParam(':doseNumber', $doseNumber);

    if ($statement->execute()) {
        $conn_pdo = null;
        // Redirect to the vaccination list page after successful insertion
        echo "<script>alert('Vaccination tracking deleted successfully!'); window.location.href = 'displayVaccination.php';</script>";
        exit();
    } else {
        $conn_pdo = null;
        // Handle error if insertion fails
        echo "<script>alert('Vaccination deletiob FAILED!'); window.location.href = 'displayVaccination.php';</script>";
    }
}


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
                    <td><a href="editVaccination.php?id=<?= $vaccination['PersonID'] ?>                                 
                                 &date=<?= $vaccination['DateOfVaccination'] ?>
                                 &dose=<?= $vaccination['DoseNumber'] ?>" >
                                 Edit
                        </a>
                    </td>
                    <td><a href="?deleteId=<?= $vaccination['PersonID'] ?>
                                &date=<?= $vaccination['DateOfVaccination'] ?>
                                &dose=<?= $vaccination['DoseNumber'] ?>" 
                                onclick="return confirm('Are you sure you want to delete this vaccination record?')">
                                Delete
                        </a>
                    </td>
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
