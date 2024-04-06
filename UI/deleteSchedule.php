<?php
// Include the database connection file
require_once 'connection.php';

// Check if the ScheduleID is provided in the URL
if (isset($_GET['scheduleID'])) {
    // Retrieve the ScheduleID from the URL parameter
    $scheduleID = $_GET['scheduleID'];

    // Prepare SQL statement to delete the schedule
    $deleteStatement = $conn_pdo->prepare('DELETE FROM Schedule WHERE ScheduleID = :scheduleID');
    $deleteStatement->bindParam(':scheduleID', $scheduleID);

    // Execute the SQL query
    if ($deleteStatement->execute()) {
        // If deletion is successful, redirect back to the page displaying all schedules
        header("Location: ./displaySchedule.php");
        exit();
    } else {
        // If deletion fails, display an error message
        echo "Error: Unable to delete the schedule.";
    }
} else {
    // If ScheduleID is not provided in the URL, display an error message
    echo "Error: ScheduleID is missing.";
}
?>
