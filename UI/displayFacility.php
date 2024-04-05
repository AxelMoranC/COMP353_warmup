<?php 
require_once 'connection.php';

$statement = $conn_pdo->prepare('SELECT * FROM Facilities;');
$statement->execute();
?>

<!--Deleting a Facility -->
<?php 
require_once 'connection.php';
require_once 'functions/CRUD_Facility.php'; // Include CRUD_Facility.php

// Check if delete parameter is present in the URL
if (isset($_GET["deleteID"])) {
    $facilityID = $_GET["deleteID"];
    $deleteMessage = deleteFacility($facilityID);
    echo "<script>alert('$deleteMessage'); window.location.href = 'displayFacility.php';</script>";
    exit; // Prevent further execution after deletion
}

// Fetch all facilities
// $statement = $conn_pdo->prepare('SELECT * FROM Facilities;');
// $statement->execute();
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Facilities</title>
    <link rel="stylesheet" href="Styling/facilities.css">
</head>

<body>
    <h1>All Facilities</h1>

    <table>
        <thead>
            <tr>
                <td>Facility Name</td>
                <td> Type </td>
                <td>Address</td>
                <td>City</td>
                <td>Province</td>
                <td>Capacity</td>
                <td>Web Address</td>
                <td>Phone Number</td>
                <td>Postal Code</td>
                <td>Edit Facility</td>
                <td>Delete Facility</td> 
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $statement->fetch(PDO::FETCH_ASSOC)) { ?>
                <tr>
                    <td><?= $row["FacilityID"] ?></td>
                    <td><?= $row["FacilityName"] ?></td>
                    <td><?= $row["FacilityType"] ?></td>
                    <td><?= $row["Address"] ?></td>
                    <td><?= $row["City"] ?></td>
                    <td><?= $row["Province"] ?></td>
                    <td><?= $row["Capacity"] ?></td>
                    <td><?= $row["WebAddress"] ?></td>
                    <td><?= $row["FacilityPhoneNumber"] ?></td>
                    <td><?= $row["PostalCode"] ?></td>
                    <td><a href="./editFacility.php?FacilityID=<?= $row["FacilityID"] ?>">Edit</a></td> 
                    <!-- <td><a href="./deleteFacility.php?FacilityID=<?= urlencode($row["FacilityID"]) ?>">Delete</a></td> -->
                    <td><a href="?deleteID=<?= urlencode($row["FacilityID"]) ?>">Delete</a></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>

    <a href="Facility.php">Back to homepage</a>
</body>

</html>
