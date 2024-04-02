<?php 
require_once 'connection.php';

$statement = $conn_pdo->prepare('SELECT * FROM Facilities;');
$statement->execute();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Facilities</title>
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
                    <td><?= $row["FacilityName"] ?></td>
                    <td><?= $row["FacilityType"] ?></td>
                    <td><?= $row["Address"] ?></td>
                    <td><?= $row["City"] ?></td>
                    <td><?= $row["Province"] ?></td>
                    <td><?= $row["Capacity"] ?></td>
                    <td><?= $row["WebAddress"] ?></td>
                    <td><?= $row["FacilityPhoneNumber"] ?></td>
                    <td><?= $row["PostalCode"] ?></td>
                    <td><a href="./editFac.php?facilityID=<?= $row["facilityID"] ?>">Edit</a></td> 
                    <td><a href="./deleteFac.php?facilityID=<?= urlencode($row["facilityID"]) ?>">Delete</a></td>

                </tr>
            <?php } ?>
        </tbody>
    </table>

    <a href="Facility.php">Back to homepage</a>
</body>

</html>
