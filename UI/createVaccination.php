<?php include 'navbar.php' ?>

<?php
// Database connection
require_once 'connection.php';


// Fetch all persons from the database
$sql = "SELECT * FROM Persons";
$statement = $conn_pdo->prepare($sql);
$statement->execute();
$persons = $statement->fetchAll(PDO::FETCH_ASSOC);



// Check if form is submitted -- Create vaccination
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $personID = $_POST["personID"];
    $dateOfVaccination = $_POST["dateOfVaccination"];
    $doseNumber = $_POST["doseNumber"];
    $location = $_POST["location"];
    $vaccineType = $_POST["vaccineType"];

    // Insert new vaccination record into the database
    $sql = "INSERT INTO HasVaccines (PersonID, DateOfVaccination, DoseNumber, Location, Type) 
            VALUES (:personID, :dateOfVaccination, :doseNumber, :location, :vaccineType)";
    $statement = $conn_pdo->prepare($sql);
    $statement->bindParam(':personID', $personID);
    $statement->bindParam(':dateOfVaccination', $dateOfVaccination);
    $statement->bindParam(':doseNumber', $doseNumber);
    $statement->bindParam(':location', $location);
    $statement->bindParam(':vaccineType', $vaccineType);

    if ($statement->execute()) {
        $conn_pdo = null;
        // Redirect to the vaccination list page after successful insertion
        echo "<script>alert('Vaccination tracking added successfully!'); window.location.href = 'displayVaccination.php';</script>";
        exit();
    } else {
        $conn_pdo = null;
        // Handle error if insertion fails
        echo "<script>alert('Vaccination tracking FAILED!'); window.location.href = 'displayVaccination.php';</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Vaccination</title>
    <link rel="stylesheet" href="Styling/facilities.css">
</head>
<body>
    <h1>Add New Vaccination</h1>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label for="personID">Person:</label><br>
            <select id="personID" name="personID" required>
                <option value="">Select Person</option>
                <?php foreach ($persons as $person) { ?>
                    <option value="<?php echo $person['PersonID']; ?>"><?php echo $person['FirstName'] . ' ' . $person['LastName']; ?></option>
                <?php } ?>
            </select><br>

        <label for="dateOfVaccination">Date of Vaccination:</label><br>
        <input type="date" id="dateOfVaccination" name="dateOfVaccination" required><br>

        <label for="doseNumber">Dose Number:</label><br>
        <input type="number" id="doseNumber" name="doseNumber" required><br>

        <label for="location">Location:</label><br>
        <input type="text" id="location" name="location" required><br>

        <label for="vaccineType">Vaccine Type:</label><br>
        <input type="text" id="vaccineType" name="vaccineType" required><br>

        <button type="submit">Add Vaccination</button>
    </form>
</body>
</html>
