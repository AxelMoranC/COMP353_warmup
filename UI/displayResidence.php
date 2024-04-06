<?php include 'navbar.php'; ?>

<?php
require_once 'connection.php';
require_once 'functions/CRUD_Residence.php'; // Include CRUD_Residence.php

// Retrieve all residences from the database
$statement = $conn_pdo->prepare('SELECT * FROM Residence;');
$statement->execute();

// Check if delete parameter is present in the URL
if (isset($_GET["deleteID"])) {
    $residenceID = $_GET["deleteID"];
    $deleteMessage = deleteResidence($residenceID);
    echo "<script>alert('$deleteMessage'); window.location.href = 'displayResidence.php';</script>";
    exit; // Prevent further execution after deletion
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Residences</title>
    <link rel="stylesheet" href="Styling/facilities.css">
    <!--Script for editing the Residence -->
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
    <h1>All Residences</h1>

    <table>
        <thead>
            <tr>
                <td>Residence ID</td>
                <td>House Type</td>
                <td>Address</td>
                <td>City</td>
                <td>Province</td>
                <td>Postal Code</td>
                <td>Residence Phone Number</td>
                <td>Amount of Bedrooms</td>
                <td>Edit Residence</td>
                <td>Delete Residence</td>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $statement->fetch(PDO::FETCH_ASSOC)) { ?>
                <tr>
                    <td contentEditable="false"><?= $row["ResidenceID"] ?></td>
                    <td contentEditable="false"><?= $row["HouseType"] ?></td>
                    <td contentEditable="false"><?= $row["Address"] ?></td>
                    <td contentEditable="false"><?= $row["City"] ?></td>
                    <td contentEditable="false"><?= $row["Province"] ?></td>
                    <td contentEditable="false"><?= $row["PostalCode"] ?></td>
                    <td contentEditable="false"><?= $row["ResidencePhoneNumber"] ?></td>
                    <td contentEditable="false"><?= $row["AmountBedrooms"] ?></td>
                    <td><a href="./editResidence.php?ResidenceID=<?= urlencode($row["ResidenceID"]) ?>">Edit</a></td>
                    <td><a href="?deleteID=<?= urlencode($row["ResidenceID"]) ?>">Delete</a></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
    <br /><br />
    <a href="Residence.php" style="font-size: 38px">Back to previous page</a>
</body>

</html>
