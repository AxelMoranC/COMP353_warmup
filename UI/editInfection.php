<?php include 'navbar.php' ?>

<?php
// Database connection
require_once 'connection.php';

// updating infection record
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve data
    $personID = $_POST["personID"];
    $oldDateOfInfection = $_POST["oldDateOfInfection"];
    $newDateOfInfection = $_POST["dateOfInfection"];
    $newInfectionNum = $_POST["infectionNum"];
    $newInfectionType = $_POST["infectionType"];

    try {
        // Update the infection record in the database
        $sql = "UPDATE HadInfections SET 
                    DateOfInfection = :newDateOfInfection, 
                    InfectionNumber = :newInfectionNum, 
                    InfectionType = :newInfectionType 
                    WHERE PersonID = :personID 
                    AND DateOfInfection = :oldDateOfInfection";

        $statement = $conn_pdo->prepare($sql);
        $statement->bindParam(':newDateOfInfection', $newDateOfInfection);
        $statement->bindParam(':newInfectionNum', $newInfectionNum);
        $statement->bindParam(':newInfectionType', $newInfectionType);
        $statement->bindParam(':personID', $personID);
        $statement->bindParam(':oldDateOfInfection', $oldDateOfInfection);

        if ($statement->execute()) {
            $conn_pdo = null;        
            // Redirect to the infections list page after successful update
            echo "<script>alert('Infection record edited successfully!'); window.location.href = 'displayInfection.php';</script>";
            exit();
        } else {
            $conn_pdo = null;   
            // Handle error if update fails
            echo "<script>alert('Infection record could not be edited!'); window.location.href = 'displayInfection.php';</script>";
            exit();
        }
    }
    catch(PDOException $e) {
        $conn_pdo = null;   
        // Handle error if update fails
        echo "<script>alert('{$e->getMessage()}'); window.location.href = 'displayInfection.php';</script>";
    }
}

// Check if ID, date, and dose number are provided in the URL
if (isset($_GET['PersonID']) && isset($_GET['DateOfInfection']) && isset($_GET['number'])) {
    $personID = $_GET['PersonID'];
    $oldDateOfInfection = $_GET['DateOfInfection'];
    $infectionNum = $_GET['number'];

    // Fetch the infection record based on provided ID, date, and number
    $sql = "SELECT * FROM HadInfections WHERE PersonID = :personID AND DateOfInfection = :oldDateOfInfection AND InfectionNumber = :infectionNum";
    $statement = $conn_pdo->prepare($sql);
    $statement->bindParam(':personID', $personID);
    $statement->bindParam(':oldDateOfInfection', $oldDateOfInfection);
    $statement->bindParam(':infectionNum', $infectionNum);
    $statement->execute();
    $infection = $statement->fetch(PDO::FETCH_ASSOC);

} else {
    echo "<script>alert('Infection record could not be edited!'); window.location.href = 'displayInfection.php';</script>";
    $conn_pdo = null;
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
        <input type="hidden" name="personID" value="<?php echo $infection['PersonID']; ?>">
        <input type="hidden" name="oldDateOfInfection" value="<?php echo htmlspecialchars($oldDateOfInfection); ?>">

        <label for="dateOfInfection">Date of Infection:</label><br>
        <input type="date" id="dateOfInfection" name="dateOfInfection" value="<?php echo $infection['DateOfInfection']; ?>" required><br>

        <label for="infectionNum">Number Of Infection:</label><br>
        <input type="number" id="infectionNum" name="infectionNum" value="<?php echo $infection['InfectionNumber']; ?>" required><br>

        <label for="infectionType">Infection Type:</label><br>
        <input type="text" id="infectionType" name="infectionType" value="<?php echo $infection['InfectionType']; ?>" required><br>

        <button type="submit">Edit Infection</button>
    </form>

</body>

</html>