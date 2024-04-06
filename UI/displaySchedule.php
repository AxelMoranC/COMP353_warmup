<?php include 'navbar.php' ?>

<?php 
require_once 'connection.php';

$data = $conn_pdo->prepare('SELECT * FROM Schedule;');

$data->execute();
//$schedules = $data->fetchAll(PDO::FETCH_ASSOC);
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Schedules</title>
    <link rel="stylesheet" href="Styling/employees.css" >
</head>

<body>
    <h1>All Schedules</h1>

    <table>
        <thead>
            <tr>
                <th>Schedule ID</th>
                <th>Medicare Card</th>
                <th>Facility ID</th>
                <th>Schedule Date</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $data->fetch(PDO::FETCH_ASSOC)) { ?>
                <tr>
                    <td><?= $row["ScheduleID"] ?></td>
                    <td><?= $row["MedicareCard"] ?></td>
                    <td><?= $row["FacilityID"] ?></td>
                    <td><?= $row["Schedule_Date"] ?></td>
                    <td><?= $row["StartTime"] ?></td>
                    <td><?= $row["EndTime"] ?></td>
                    <td><a href="./editSchedule.php?scheduleID=<?= $row["ScheduleID"] ?>">Edit</a></td>
                    <td><a href="./deleteSchedule.php?scheduleID=<?= $row["ScheduleID"] ?>">Delete</a></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>

    <a href="Employee.php">Back to Employee's homepage</a>
</body>

</html>
