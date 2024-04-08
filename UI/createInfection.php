<!--Include a navigatio nbar everywhere we go -->
<?php include 'navbar.php';  ?>

<?php
// Database connection
require_once 'connection.php';
//allowing access to several email things
require_once 'functions/CRUD_Email.php';

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $personID = $_POST["personID"];
    $dateOfInfection = $_POST["dateOfInfection"];
    $infectionNumber = $_POST["infectionNumber"];
    $infectionType = $_POST["infectionType"];

    // Insert new infection record into the database
    $sql = "INSERT INTO HadInfections (PersonID, DateOfInfection, InfectionNumber, InfectionType) 
            VALUES (:personID, :dateOfInfection, :infectionNumber, :infectionType)";
    $statement = $conn_pdo->prepare($sql);
    $statement->bindParam(':personID', $personID);
    $statement->bindParam(':dateOfInfection', $dateOfInfection);
    $statement->bindParam(':infectionNumber', $infectionNumber);
    $statement->bindParam(':infectionType', $infectionType);


    if ($statement->execute()) {
        //Get medicareCard
        $sql = "SELECT E.MedicareCard AS mID
            FROM Persons P  
            JOIN Employees E ON E.MedicareCard = P.MedicareCard
            WHERE P.PersonID = :personID";

        $data = $conn_pdo->prepare($sql);

        $data->bindParam(':personID', $personID);
        $data->execute();

        $card = $data->fetch();

        //Cancel schedule if true
        cancelAssignmentsForInfectedEmployee($card['mID'], $dateOfInfection);


        $conn_pdo = null;
        // Redirect to the infection list page after successful insertion
        echo "<script>alert('Infection record added successfully!'); window.location.href = 'displayInfection.php';</script>";
        exit();
    } else {
        $conn_pdo = null;
        // Handle error if insertion fails
        echo "<script>alert('Failed...'); window.location.href = 'displayInfection.php';</script>";
    }
}

// Fetch all persons from the database
$sql = "SELECT * FROM Persons";
$statement = $conn_pdo->prepare($sql);
$statement->execute();
$persons = $statement->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Infection</title>
    <link rel="stylesheet" href="Styling/facilities.css">
</head>
<body>
    <h1>Add New Infection</h1>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label for="personID">Person:</label><br>
        <select id="personID" name="personID" required>
            <option value="">Select Person</option>
            <?php foreach ($persons as $person) { ?>
                <option value="<?php echo $person['PersonID']; ?>"><?php echo $person['FirstName'] . ' ' . $person['LastName']; ?></option>
            <?php } ?>
        </select><br>

        <label for="dateOfInfection">Date of Infection:</label><br>
        <input type="date" id="dateOfInfection" name="dateOfInfection" required><br>

        <label for="infectionNumber">Infection Number:</label><br>
        <input type="number" id="infectionNumber" name="infectionNumber" required><br>

        <label for="infectionType">Infection Type:</label><br>
        <input type="text" id="infectionType" name="infectionType" required><br>

        <button type="submit">Add Infection</button>
    </form>
</body>

</html>