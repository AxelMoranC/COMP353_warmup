<?php include 'navbar.php'; ?>

<?php
require_once 'connection.php';
require_once 'functions/CRUD_Person.php';

// Fetch person/Employees details from the database
$sql = "SELECT P.*, R.Address, R.Province, R.PostalCode, R.City 
        FROM Persons P
        JOIN Residence R on R.ResidenceID = P.ResidenceID
        WHERE P.MedicareCard IN (SELECT MedicareCard FROM Employees)";

$statement = $conn_pdo->prepare($sql);
$statement->execute();
$persons = $statement->fetchAll(PDO::FETCH_ASSOC);

// Fetch person details from the database who live with employees
$sql2 = "SELECT P.*, L.MedicareCard AS OWNER, L.Relationship
         FROM Persons P
         JOIN LivesWithEmployee L ON P.PersonID = L.PersonID
         JOIN Residence R ON R.ResidenceID = P.ResidenceID";

$statement2 = $conn_pdo->prepare($sql2);
$statement2->execute();
$closePeople = $statement2->fetchAll(PDO::FETCH_ASSOC);



// Check if delete parameter is present in the URL
if (isset($_GET["personID"])) {
    $PersonID = $_GET["personID"];
    $deleteMessage = deletePerson($PersonID);
    echo "<script>alert('$deleteMessage'); window.location.href = 'displayFacility.php';</script>";
    exit; // Prevent further execution after deletion
}


// Close the database connection
$conn_pdo = null;
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Every people in the Database</title>
    <link rel="stylesheet" href="Styling/people.css">
</head>

<body>
    <h1>Persons/Employees Information</h1>

    <table>
        <thead>
            <tr>
                <th> Edit </th>
                <th> Delete </th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Date of Birth</th>
                <th>Social Security</th>
                <th>Medicare Card</th>
                <th>Phone Number</th>
                <th>Citizenship</th>
                <th>Email</th>
                <th>Address</th>
                <th>City</th>
                <th>Province</th>
                <th>Postal Code</th>
                <th>Started Date at Address</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($persons as $person) { ?>
                <tr>
                    <td><a href="editPerson.php?PersonID=<?= $person['PersonID'] ?>">Edit</a></td>
                    <td><a href="?personID=<?= $person['PersonID'] ?>">Delete</a></td>
                    <td><?php echo $person['FirstName']; ?></td>
                    <td><?php echo $person['LastName']; ?></td>
                    <td><?php echo $person['DateOfBirth']; ?></td>
                    <td><?php echo $person['SocialSecurity']; ?></td>
                    <td><?php echo $person['MedicareCard']; ?></td>
                    <td><?php echo $person['PhoneNumber']; ?></td>
                    <td><?php echo $person['Citizenship']; ?></td>
                    <td><?php echo $person['Email']; ?></td>
                    <td><?php echo $person['Address']; ?></td>
                    <td><?php echo $person['City']; ?></td>
                    <td><?php echo $person['Province']; ?></td>
                    <td><?php echo $person['PostalCode']; ?></td>
                    <td><?php echo $person['StartedDateAtAddress']; ?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>

    <br />
    <br />
    <br />

    <h1>People who Live with Employees</h1>

    <table>
        <thead>
            <tr>
                <th> Edit </th>
                <th> Delete </th>
                <th>First Name</th>
                <th>Last Name</th>
                <th> Lives With </th>
                <th> Relationship </th>
                <th>Date of Birth</th>
                <th>Social Security</th>
                <th>Medicare Card</th>
                <th>Phone Number</th>
                <th>Citizenship</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($closePeople as $person) { ?>
                <tr>
                    <td><a href="editPerson.php?PersonID=<?= $person['PersonID'] ?>">Edit</a></td>
                    <td><a href="?personID=<?= $person['PersonID'] ?>">Delete</a></td>
                    <td><?php echo $person['FirstName']; ?></td>
                    <td><?php echo $person['LastName']; ?></td>
                    <td><?php echo $person['OWNER']; ?></td>
                    <td><?php echo $person['Relationship']; ?></td>
                    <td><?php echo $person['DateOfBirth']; ?></td>
                    <td><?php echo $person['SocialSecurity']; ?></td>
                    <td><?php echo $person['MedicareCard']; ?></td>
                    <td><?php echo $person['PhoneNumber']; ?></td>
                    <td><?php echo $person['Citizenship']; ?></td>
                    <td><?php echo $person['Email']; ?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>

<br /><br /><br /><br />
<a href="Registration.php"><button>Return to previous page</button></a>
</body>
