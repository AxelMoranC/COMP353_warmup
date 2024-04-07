<?php include 'navbar.php'; ?>
<?php
// Database connection
require_once 'connection.php';

// SQL query to retrieve information about secondary residences
$sql = "SELECT P.FirstName, P.LastName, R.ResidenceID, 
            R.HouseType, R.Address, R.City, R.Province, R.PostalCode, 
            R.ResidencePhoneNumber, R.AmountBedrooms, SR.StartDateAtAddress
        FROM SecondaryResidence SR
        JOIN Residence R ON SR.ResidenceID = R.ResidenceID
        JOIN Persons P ON SR.PersonID = P.PersonID";

// Execute the SQL query
$statement = $conn_pdo->prepare($sql);
$statement->execute();
$residences = $statement->fetchAll(PDO::FETCH_ASSOC);

// Close the database connection
$conn_pdo = null;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secondary Residences</title>
    <link rel="stylesheet" href="Styling/people.css">
</head>
<body>
    <h1>Secondary Residences</h1>

    <table>
        <thead>
            <tr>
                <th>Belongs to: </th>
                <th> ID </th>
                <th>House Type</th>
                <th>Address</th>
                <th>City</th>
                <th>Province</th>
                <th>Postal Code</th>
                <th>Residence Phone Number</th>
                <th>Amount of Bedrooms</th>
                <th>Start Date At Address</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($residences as $residence) { ?>
                <tr>
                    <td><?= $residence['FirstName']. ' ' .$residence['LastName'] ?></td>
                    <td><?= $residence['ResidenceID'] ?></td>
                    <td><?= $residence['HouseType'] ?></td>
                    <td><?= $residence['Address'] ?></td>
                    <td><?= $residence['City'] ?></td>
                    <td><?= $residence['Province'] ?></td>
                    <td><?= $residence['PostalCode'] ?></td>
                    <td><?= $residence['ResidencePhoneNumber'] ?></td>
                    <td><?= $residence['AmountBedrooms'] ?></td>
                    <td><?= $residence['StartDateAtAddress'] ?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
</body>
</html>
