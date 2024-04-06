<?php include 'navbar.php' ?>

<?php
require_once 'connection.php';

$data = $conn_pdo->prepare('SELECT s.ScheduleID, s.FacilityID, 
                                    F.FacilityName,
                                    p.FirstName AS employeeFirstName, 
                                    p.LastName AS employeeLastName, 
                                    s.Schedule_Date, s.StartTime, s.EndTime 
                            FROM Schedule s
                            JOIN Persons p ON s.MedicareCard = p.MedicareCard
                            JOIN Facilities F on F.FacilityID = s.FacilityID');
$data->execute();
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedule Information</title>
    <link rel="stylesheet" href="Styling/employees.css" >
</head>

<body>
    <h1>Schedule Information</h1>

    <table>
        <thead>
            <tr>
                <td>Schedule ID</td>
                <td>Facility ID</td>
                <td>Facility Name</td>
                <td>Employee Name</td>
                <td>Date</td>
                <td>Start Time</td>
                <td>End Time</td>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $data->fetch(PDO::FETCH_ASSOC)) { ?>
                <tr>
                    <td><?= $row["ScheduleID"] ?></td>
                    <td><?= $row["FacilityID"] ?></td>
                    <td><?= $row["FacilityName"] ?></td>
                    <td><?= $row["employeeFirstName"] . ' ' . $row["employeeLastName"] ?></td>
                    <td><?= $row["Schedule_Date"] ?></td>
                    <td><?= $row["StartTime"] ?></td>
                    <td><?= $row["EndTime"] ?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>

    <br /><br />
    <a href="createSchedule.php"><button style="font-size: 18px">Add to schedule</button></a>
    <a href="Employee.php"><button style="font-size: 18px">Back to Previous Page</button></a>
</body>

</html>
