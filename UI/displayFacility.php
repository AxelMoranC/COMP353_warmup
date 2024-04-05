<?php 
require_once 'connection.php';

$statement = $conn_pdo->prepare('SELECT * FROM Facilities;');
$statement->execute();

$conn_pdo = null;
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
    <!--Script for editing the Facility -->
    <script>
        function toggleEditability(row) {
            var cells = row.querySelectorAll('td');
            var editButton = row.querySelector('.edit-button');
            
            cells.forEach(function(cell) {
                cell.contentEditable = !cell.contentEditable;
            });

            editButton.textContent = (editButton.textContent === 'Edit') ? 'Save' : 'Edit';
        }
    </script>

</head>

<body>
    <h1>All Facilities</h1>

    <table>
        <thead>
            <tr>
                <td>ID</td>
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
                    <td contentEditable="false"><?= $row["FacilityID"] ?></td>
                    <td contentEditable="false"><?= $row["FacilityName"] ?></td>
                    <td contentEditable="false"><?= $row["FacilityType"] ?></td>
                    <td contentEditable="false"><?= $row["Address"] ?></td>
                    <td contentEditable="false"><?= $row["City"] ?></td>
                    <td contentEditable="false"><?= $row["Province"] ?></td>
                    <td contentEditable="false"><?= $row["Capacity"] ?></td>
                    <td contentEditable="false"><?= $row["WebAddress"] ?></td>
                    <td contentEditable="false"><?= $row["FacilityPhoneNumber"] ?></td>
                    <td contentEditable="false"><?= $row["PostalCode"] ?></td>
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
