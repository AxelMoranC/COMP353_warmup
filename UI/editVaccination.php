<?php include 'navbar.php' ?>

<?php
// Database connection
require_once 'connection.php';

// Check if ID, date, and dose number are provided in the URL
if (isset($_GET['id']) && isset($_GET['date']) && isset($_GET['dose'])) {
    $personID = $_GET['id'];
    $dateOfVaccination = $_GET['date'];
    $doseNumber = $_GET['dose'];

    // Fetch the vaccination record based on provided ID, date, and dose number
    $sql = "SELECT * FROM HasVaccines WHERE PersonID = :personID AND DateOfVaccination = :dateOfVaccination AND DoseNumber = :doseNumber";
    $data = $conn_pdo->prepare($sql);
    $data->bindParam(':personID', $personID);
    $data->bindParam(':dateOfVaccination', $dateOfVaccination);
    $data->bindParam(':doseNumber', $doseNumber);
    $data->execute();
    $vaccination = $data->fetch(PDO::FETCH_ASSOC);


    // Check if vaccination record exists
    if (!$vaccination) {
        echo "<script>alert('Error: Vaccination record not found.'); window.location.href = 'displayVaccination.php';</script>";
    }
} 

// Handle form submission for updating vaccination record
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve updated form data
    $personID = $_POST["personID"];
    $newDateOfVaccination = $_POST["dateOfVaccination"];
    $newDoseNumber = $_POST["doseNumber"];
    $newLocation = $_POST["location"];
    $newVaccineType = $_POST["vaccineType"];

    // Update the vaccination record in the database
    $sql = "UPDATE HasVaccines SET DateOfVaccination = :dateOfVaccination, DoseNumber = :doseNumber, Location = :location, Type = :vaccineType WHERE PersonID = :personID";
    $data = $conn_pdo->prepare($sql);
    $data->bindParam(':dateOfVaccination', $newDateOfVaccination);
    $data->bindParam(':doseNumber', $newDoseNumber);
    $data->bindParam(':location', $newLocation);
    $data->bindParam(':vaccineType', $newVaccineType);
    $data->bindParam(':personID', $personID);

    if ($data->execute()) {
        $conn_pdo = null;        
        //Redirect to the vaccination list page after successful update
        echo "<script>alert('Vaccination tracking edited successfully!'); window.location.href = 'displayVaccination.php';</script>";
        exit();
    } else {
        $conn_pdo = null;   
        // Handle error if update fails
        echo "<script>alert('Error: Unable to update vaccination record.'); window.location.href = 'displayVaccination.php';</script>";
    }
}
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit a Vaccination</title>
    <link rel="stylesheet" href="Styling/facilities.css">
</head>

<body>
<h1>Edit Vaccination</h1>

<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
    <input type="hidden" name="personID" value="<?php echo $vaccination['PersonID']; ?>">

    <label for="dateOfVaccination">Date of Vaccination:</label><br>
    <input type="date" id="dateOfVaccination" name="dateOfVaccination" value="<?php echo $vaccination['DateOfVaccination']; ?>" required><br>

    <label for="doseNumber">Dose Number:</label><br>
    <input type="number" id="doseNumber" name="doseNumber" value="<?php echo $vaccination['DoseNumber']; ?>" required><br>

    <label for="location">Location:</label><br>
    <input type="text" id="location" name="location" value="<?php echo $vaccination['Location']; ?>" required><br>

    <label for="vaccineType">Vaccine Type:</label><br>
    <input type="text" id="vaccineType" name="vaccineType" value="<?php echo $vaccination['Type']; ?>" required><br>

    <button type="submit">Edit Vaccination</button>
</form>

</body>

</html>