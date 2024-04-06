<?php include 'navbar.php';  ?>

<?php
require_once 'connection.php';
require_once 'functions/CRUD_Employee.php'; // Include CRUD_Facility.php

// Get all available facility names
$facilityNames = getAllFacilityNames();
// Get all available persons for the medicareCard connection
$persons = getAllPersons();


// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $medicareCard = $_POST["medicareCard"];
    $facilityID = $_POST["facilityID"];
    $job = $_POST["job"];
    $startDate = $_POST["startDate"];
    $endDate = $_POST["endDate"];
    // Call updateFacility function
    $updateMessage = updateEmployee($medicareCard, $facilityID, $job, $startDate, $endDate);
    
    // Redirect back to displayFacility.php
    echo "<script>alert('$updateMessage'); window.location.href = 'displayEmployee.php';</script>";
    exit; // Prevent further execution
}


// Retrieve facility details from the URL parameter
if (isset($_GET["ID"]) && isset($_GET["startDate"]) && isset($_GET["endDate"])) {
    $medicareCard = $_GET["ID"];
    $s_date = $_GET["startDate"];
    $e_date = $_GET["endDate"];

    if ($e_date=== "Ongoing" || $e_date === ""){
        $e_date = NULL;
    }


    // Fetch facility details from the database
    $statement = $conn_pdo->prepare('SELECT * FROM Employees 
                                        WHERE MedicareCard = :MedicareCard
                                        AND StartDate = :StartDate
                                        AND (EndDate = :EndDate OR EndDate IS NULL)');

    $statement->bindParam(':MedicareCard', $medicareCard);
    $statement->bindParam(':StartDate', $s_date);
    $statement->bindParam(':EndDate', $e_date);

    $statement->execute();
    $employeeInfo = $statement->fetch();

    //var_dump($employeeInfo);

    $conn_pdo = null;
} else {
    echo "MedicareCard and StartDate nowhere to be found.";
    $conn_pdo = null;
    exit; // Prevent further execution
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Facility</title>
    <link rel="stylesheet" href="Styling/employees.css">
</head>

<body>
    <h1>Edit Employee Information</h1>

    <!-- Form used to transfer data to update employee information -->
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <!-- All data within our SQL Table -->
        <label for="medicareCard">Medicare Card:</label><br>
        <input type="text" id="medicareCard" name="medicareCard" value="<?php echo $employeeInfo['MedicareCard']; ?>" readonly><br>

        
        <label for="facilityID">Facility:</label><br>
        <select id="facilityID" name="facilityID" required>
            <?php foreach ($facilityNames as $facilityID => $facilityName) { ?>
                <option value="<?php echo $facilityID; ?>" <?php if ($facilityID === $employeeInfo['FacilityID']) echo 'selected'; ?>><?php echo $facilityName; ?></option>
            <?php } ?>
        </select><br>
        
        <label for="job">Job:</label><br>
        <select id="job" name="job" required>
        <option value="" disabled>Select job</option>
            <option value="nurse" <?php if ($employeeInfo['Job'] === 'nurse') echo 'selected'; ?>>Nurse</option>
            <option value="doctor" <?php if ($employeeInfo['Job'] === 'doctor') echo 'selected'; ?>>Doctor</option>
            <option value="cashier" <?php if ($employeeInfo['Job'] === 'cashier') echo 'selected'; ?>>Cashier</option>
            <option value="pharmacist" <?php if ($employeeInfo['Job'] === 'pharmacist') echo 'selected'; ?>>Pharmacist</option>
            <option value="receptionist" <?php if ($employeeInfo['Job'] === 'receptionist') echo 'selected'; ?>>Receptionist</option>
            <option value="administrative personnel" <?php if ($employeeInfo['Job'] === 'administrative personnel') echo 'selected'; ?>>Administrative Personnel</option>
            <option value="security personnel" <?php if ($employeeInfo['Job'] === 'security personnel') echo 'selected'; ?>>Security Personnel</option>
            <option value="regular employee" <?php if ($employeeInfo['Job'] === 'regular employee') echo 'selected'; ?>>Regular Employee</option>
            <option value="general manager" <?php if ($employeeInfo['Job'] === 'general manager') echo 'selected'; ?>>General Manager</option>
            <!-- <option value="" disabled selected>Select job</option>
            <option value="nurse">nurse</option>
            <option value="doctor">doctor</option>
            <option value="cashier">cashier</option>
            <option value="pharmacist">pharmacist</option>
            <option value="receptionist">receptionist</option>
            <option value="administrative personnel">administrative personnel</option>
            <option value="security personnel">security personnel</option>
            <option value="regular employee">regular employee</option>
            <option value="general manager">general manager</option> -->
        </select><br>
        
        <label for="startDate">Start Date:</label><br>
        <input type="date" id="startDate" name="startDate" value="<?php echo $employeeInfo['StartDate']; ?>" required><br>
        
        <label for="endDate">End Date:</label><br>
        <input type="date" id="endDate" name="endDate" value="<?php echo $employeeInfo['EndDate']; ?>"><br>
        
        <br /><br />
        <button type="submit">Edit Employee</button>
    </form>

    <br /><br />
    <a href="displayEmployee.php">Back to Employee's List</a>
</body>

</html>