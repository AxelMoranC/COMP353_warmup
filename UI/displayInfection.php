<?php include 'navbar.php'; ?>

<?php
require_once 'connection.php';

//employees details and job information about covid 
$sql = "SELECT H.*, P.FirstName, P.LastName, E.Job, F.FacilityName 
        FROM HadInfections H
        JOIN Persons P ON H.PersonID = P.PersonID
        JOIN Employees E ON P.MedicareCard = E.MedicareCard
        JOIN Facilities F ON E.FacilityID = F.FacilityID
        GROUP BY H.PersonID, H.InfectionNumber
        ORDER BY H.PersonID, H.InfectionNumber ASC";

// Fetch non-employee infections data
$sql2 ="SELECT DISTINCT H.*, P.FirstName, P.LastName, E.MedicareCard AS OWNER, L.Relationship AS RELA
        FROM HadInfections H
        JOIN LivesWithEmployee L on L.PersonID = H.PersonID
        JOIN Persons P ON L.PersonID = P.PersonID
        JOIN Employees E ON L.MedicareCard = E.MedicareCard
                GROUP BY H.PersonID, H.InfectionNumber
                ORDER BY H.PersonID, H.InfectionNumber ASC";

$statement = $conn_pdo->prepare($sql);
$statement->execute();
$infections = $statement->fetchAll(PDO::FETCH_ASSOC);

$statement2 = $conn_pdo->prepare($sql2);
$statement2->execute();
$infections_NonEmployees = $statement2->fetchAll(PDO::FETCH_ASSOC);

?>

<!--For Deleting Infection -->
<?php 
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['deleteID']) && isset($_GET['DateOfInfection']) && isset($_GET['number'])) {
    $personID = $_GET['deleteID'];
    $dateOfInfection = $_GET['DateOfInfection'];
    $infectionNumber = $_GET['number'];

    // SQL to delete the infection record
    $sql = "DELETE FROM HadInfections WHERE PersonID = :personID AND DateOfInfection = :dateOfInfection AND InfectionNumber = :infectionNumber";
    $statement = $conn_pdo->prepare($sql);
    $statement->bindParam(':personID', $personID);
    $statement->bindParam(':dateOfInfection', $dateOfInfection);
    $statement->bindParam(':infectionNumber', $infectionNumber);

    if ($statement->execute()) {
        $conn_pdo = null;
        // Redirect back to the page where the deletion was initiated
        // Redirect to the infections list page after successful update
        echo "<script>alert('Infection record deleted!'); window.location.href = 'displayInfection.php';</script>";
        exit();
    } else {
        $conn_pdo = null;
        echo "Error: Unable to delete infection record.";
    }
}

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
                    <td><a href="editInfection.php?PersonID=<?= $infection['PersonID'] ?>
                                &DateOfInfection=<?= $infection['DateOfInfection'] ?>
                                &number=<?= $infection['InfectionNumber'] ?>">
                                Edit
                        </a>
                    </td>
                    <td><a href="?deleteID=<?= $infection['PersonID'] ?>
                                &DateOfInfection=<?= $infection['DateOfInfection'] ?>
                                &number=<?= $infection['InfectionNumber'] ?>" 
                                onclick="return confirm('Are you sure you want to delete this infection record?')">
                                Delete
                        </a>
                    </td>
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

    <br /><br /><br /><br /><br /><br />

    <h1>Non-Employee Infections</h1>

    <table>
        <thead>
            <tr>
                <th>Edit</th>
                <th>Delete</th>
                <th>Date of Infection</th>
                <th>Infection Number</th>
                <th>Infection Type</th>
                <th>Full Name</th>
                <th>Lives With </th>
                <th>Relationship with Employee</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($infections_NonEmployees as $infection) { ?>
                <tr>
                    <td><a href="editInfection.php?PersonID=<?= $infection['PersonID'] ?>
                                &DateOfInfection=<?= $infection['DateOfInfection'] ?>
                                &number=<?= $infection['InfectionNumber'] ?>">
                                Edit
                        </a>
                    </td>
                    <td><a href="?deleteID=<?= $infection['PersonID'] ?>
                                &DateOfInfection=<?= $infection['DateOfInfection'] ?>
                                &number=<?= $infection['InfectionNumber'] ?>" 
                                onclick="return confirm('Are you sure you want to delete this infection record?')">
                                Delete
                        </a>
                    </td>
                    <td><?php echo $infection['DateOfInfection']; ?></td>
                    <td><?php echo $infection['InfectionNumber']; ?></td>
                    <td><?php echo $infection['InfectionType']; ?></td>
                    <td><?php echo $infection['FirstName'] . ' ' . $infection['LastName']; ?></td>
                    <td><?= $infection['OWNER'] ?></td>
                    <td><?= $infection['RELA'] ?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>

</body>

</html>
