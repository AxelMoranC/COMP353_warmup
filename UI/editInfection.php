<?php include 'navbar.php' ?>

<?php
// Database connection
require_once 'connection.php';

// updating infection record
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve data
    $newDateOfInfection = $_POST["dateOfInfection"];
    $newInfectionNum = $_POST["infectionNum"];
    $newInfectionType = $_POST["infectionType"];

    // Update the infection record in the database
    $sql = "UPDATE HadInfections SET DateOfInfection = :dateOfInfection, InfectionNumber = :infectionNum, InfectionType = :infectionType WHERE PersonID = :personID";
    $data = $conn_pdo->prepare($sql);
    $data->bindParam(':dateOfInfection', $newDateOfInfection);
    $data->bindParam(':infectionNum', $newInfectionNum);
    $data->bindParam(':infectionType', $newInfectionType);
    $data->bindParam(':personID', $personID);

    if ($data->execute()) {
        $conn_pdo = null;        
        // Redirect to the infections list page after successful update
        echo "<script>alert('Infection record edited successfully!'); window.location.href = 'displayInfection.php';</script>";
        exit();
    } else {
        $conn_pdo = null;   
        // Handle error if update fails
        echo "Error: Unable to update infection record.";
        exit();
    }
}

// Check if ID, date, and dose number are provided in the URL
if (isset($_GET['PersonID']) && isset($_GET['DateOfInfection']) && isset($_GET['number'])) {
    $personID = $_GET['PersonID'];
    $DateOfInfection = $_GET['DateOfInfection'];
    $infectionNum = $_GET['number'];

    // Fetch the vaccination record based on provided ID, date, and dose number
    $sql = "SELECT * FROM HadInfections WHERE PersonID = :personID AND DateOfInfection = :DateOfInfection AND InfectionNumber = :infectionNum";
    $data = $conn_pdo->prepare($sql);
    $data->bindParam(':personID', $personID);
    $data->bindParam(':DateOfInfection', $DateOfInfection);
    $data->bindParam(':infectionNum', $infectionNum);
    $data->execute();
    $infection = $data->fetch(PDO::FETCH_ASSOC);
} else {
    echo "Invalid request.";
    $conn_pdo = null;
    exit();
}

?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Infection Case</title>
    <link rel="stylesheet" href="Styling/facilities.css">
</head>

<body>
<h1>Edit Infection Case</h1>

<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
    <input type="hidden" name="personID" value="<?php echo $vaccination['PersonID']; ?>">

    <label for="dateOfVaccination">Date of Infection:</label><br>
    <input type="date" id="dateOfInfection" name="dateOfInfection" value="<?php echo $infection['DateOfInfection']; ?>" required><br>

    <label for="dateOfVaccination">Number Of Infection:</label><br>
    <input type="number" id="infectionNum" name="infectionNum" value="<?php echo $infection['InfectionNumber']; ?>" required><br>

    <label for="dateOfVaccination">Infection Type:</label><br>
    <input type="text" id="infectionType" name="infectionType" value="<?php echo $infection['InfectionType']; ?>" required><br>

    <button type="submit">Edit Infection</button>
</form>

</body>

</html>