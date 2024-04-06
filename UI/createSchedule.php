<!-- Include a navigation bar everywhere we go -->
<?php include 'navbar.php'; ?>

<?php 
require_once 'connection.php';
require_once "functions/CRUD_Schedule.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $medicareCard = $_POST["medicareCard"];
    $facilityID = $_POST["facilityID"];
    $scheduleDate = $_POST["scheduleDate"];
    $startTime = $_POST["startTime"];
    $endTime = $_POST["endTime"];

    //Go to CRUD_Schedule.php
    try {
        // Attempt to create the schedule
        createSchedule($medicareCard, $facilityID, $scheduleDate, $startTime, $endTime);
    } catch (PDOException $e) {
        $state = $e->getMessage();
        // Handle the exception gracefully
        echo "<script>alert(($state)); window.location.href = 'displayEmployee.php';</script>";
    }


}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Schedule</title>
    <link rel="stylesheet" href="Styling/employees.css" >
</head>

<body>
    <h1>Create Schedule</h1>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">

        <label for="medicareCard">Medicare Card</label><br>
        <input type="text" name="medicareCard" id="medicareCard"><br>
        <label for="facilityID">Facility ID</label><br>
        <input type="text" name="facilityID" id="facilityID"><br>
        <label for="scheduleDate">Schedule Date</label><br>
        <input type="date" name="scheduleDate" id="scheduleDate"><br>
        <label for="startTime">Start Time</label><br>
        <input type="time" name="startTime" id="startTime"><br>
        <label for="endTime">End Time</label><br>
        <input type="time" name="endTime" id="endTime"><br>
        
        <button type="submit">Create Schedule</button>
    </form>

    <a href="./schedule.php"><button>Cancel</button></a>
</body>

</html>