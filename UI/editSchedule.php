<?php include 'navbar.php'; ?>

<?php 
require_once 'connection.php';
require_once 'functions/CRUD_Schedule.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Process form submission to update schedule details
    $scheduleID = $_POST["scheduleID"];
    $facilityID = $_POST["facilityID"];
    $medicareCard = $_POST["medicareCard"];
    $scheduleDate = $_POST["date"];
    $startTime = $_POST["startTime"];
    $endTime = $_POST["endTime"];
    
    updateSchedule($scheduleID, $medicareCard, $facilityID, $scheduleDate, $startTime, $endTime);
}


if (isset($_GET['scheduleID'])) {
// Retrieve schedule details for editing
$scheduleID = $_GET['scheduleID'];
$statement = $conn_pdo->prepare('SELECT * FROM Schedule WHERE ScheduleID = :scheduleID;');
$statement->bindParam(':scheduleID', $scheduleID);
$statement->execute();
$schedule = $statement->fetch(PDO::FETCH_ASSOC);
}


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Schedule</title>
    <link rel="stylesheet" href="Styling/employees.css" >
</head>

<body>
    <h1>Edit Schedule</h1>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <input type="hidden" name="scheduleID" value="<?= $schedule['ScheduleID'] ?>">
        <label for="facilityID">Facility ID</label><br>
        <input type="text" name="facilityID" id="facilityID" value="<?= $schedule['FacilityID'] ?>"><br>
        <label for="employeeID">Employee ID</label><br>
        <input type="text" name="medicareCard" id="medicareCard" value="<?= $schedule['MedicareCard'] ?>"><br>
        <label for="date">Date</label><br>
        <input type="text" name="date" id="date" value="<?= $schedule['Schedule_Date'] ?>"><br>
        <label for="startTime">Start Time</label><br>
        <input type="time" name="startTime" id="startTime" value="<?= $schedule['StartTime'] ?>"><br>
        <label for="endTime">End Time</label><br>
        <input type="time" name="endTime" id="endTime" value="<?= $schedule['EndTime'] ?>"><br>
        <br />
        <button type="submit">Update Schedule</button>
    </form>

    <a href="./displaySchedule.php"><button>Cancel</button?</a>
</body>

</html>
