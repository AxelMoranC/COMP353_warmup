<!--Include a navigatio nbar everywhere we go -->
<?php include 'navbar.php';  ?>


<?php
    // Include CRUD_Employee.php file
    require_once 'connection.php';
    require_once "functions/CRUD_Employee.php";

    // Get all available facility names
    $facilityNames = getAllFacilityNames();
    // Get all available persons for the medicareCard connection
    $persons = getAllPersons();

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Retrieve form data
        $medicareCard = $_POST["medicareCard"];
        $facilityID = $_POST["facilityID"];
        $job = $_POST["job"];
        $startDate = $_POST["startDate"];
        $endDate = $_POST["endDate"];
        
        // Call from CRUD_Employee.php
        createEmployee($medicareCard, $facilityID, $job, $startDate, $endDate);
        $conn_pdo = null;
        exit; // Exit to ensure nothing happens after execution
    }
?>


<!DOCTYPE html>
<html>

<head>
    <title>Create Employee</title>
    <link rel="stylesheet" href="Styling/employees.css">
</head>

<body>
    <h1>Create a new Employee</h1>

    <!-- Form used to transfer data to create a new Employee -->
    <form action="./createEmployee.php" method="post">
        <!-- All data within our SQL Table -->
        <label for="person">All Persons Available for Work</h1>
        <select id="person" name="medicareCard" required>
            <option value="" disabled selected>Select person</option>
            <?php foreach ($persons as $medicareCard => $name) { ?>
                <option value="<?php echo $medicareCard; ?>"><?php echo $name; ?></option>
            <?php } ?>
        </select><br>
        
        <label for="facilityID">Facility:</label><br>
        <select id="facilityID" name="facilityID" required>
            <option value="" disabled selected>Select facility</option>
            <?php foreach ($facilityNames as $facilityID => $facilityName) { ?>
                <option value="<?php echo $facilityID; ?>"><?php echo $facilityName; ?></option>
            <?php } ?>
        </select><br>
        
        <label for="job">Job:</label><br>
        <select id="job" name="job" required>
            <option value="" disabled selected>Select job</option>
            <option value="nurse">nurse</option>
            <option value="doctor">doctor</option>
            <option value="cashier">cashier</option>
            <option value="pharmacist">pharmacist</option>
            <option value="receptionist">receptionist</option>
            <option value="administrative personnel">administrative personnel</option>
            <option value="security personnel">security personnel</option>
            <option value="regular employee">regular employee</option>
            <option value="general manager">general manager</option>
        </select><br>
        
        <label for="startDate">Start Date:</label><br>
        <input type="date" id="startDate" name="startDate" required><br>
        
        <label for="endDate">End Date:</label><br>
        <input type="date" id="endDate" name="endDate"><br>
        
        <br /><br />
        <button type="submit">Create new Employee</button>
    </form>

</body>
</html>