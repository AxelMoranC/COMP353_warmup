<?php include 'navbar.php'; ?>

<?php 
require_once 'connection.php';
require_once 'functions/CRUD_Schedule.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve employee and schedule IDs from the form submission
    $employeeID = $_POST["employeeID"];
    $scheduleID = $_POST["scheduleID"];

    // Perform assignment logic here
    // For simplicity, let's assume you have a function called assignSchedule in CRUD_Schedule.php

    assignSchedule($employeeID, $scheduleID);
}

// Fetch available schedules within the selected facility
// Implement logic to retrieve available schedules as needed

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Schedule</title>
</head>

<body>
    <h1>Assign Schedule to an Employee within a Given Facility</h1>

    <form action="./assignSchedule.php" method="post">
        <!-- Input fields for employee and schedule IDs -->
        <!-- Example: -->
        <label for="employeeID">Employee ID</label><br>
        <input type="text" name="employeeID" id="employeeID"><br>
        <label for="scheduleID">Schedule ID</label><br>
        <input type="text" name="scheduleID" id="scheduleID"><br>
        
        <button type="submit">Assign Schedule</button>
    </form>

    <a href="./displayAvailableSchedules.php">Back to Display Available Schedules</a>
</body>

</html>