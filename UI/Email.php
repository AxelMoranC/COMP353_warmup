<?php include 'navbar.php'; ?>

<?php
require_once 'connection.php';
require_once 'functions/CRUD_Email.php';


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["sendInfectedEmail"])) {
       

        if (sendInfectedTeacherEmail($infectedTeacherMedicareID, $infectionDate)) {
            echo "Infected teacher email sent to principal successfully.";
        } else {
            echo "Failed to send infected teacher email.";
        }
    }

    if (isset($_POST["sendWeeklyScheduleEmails"])) {
        sendWeeklyScheduleEmails();
        echo "Weekly schedule emails sent.";
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Email Actions</title>
    <link rel="stylesheet" href="Styling/facilities.css">
</head>

<body>
<!-- <th><a href="index.php"><button >Index</button></a></th>
<th><a href="Student.php"> <button >Student</button></a></th>
    <th><a href="Employee.php"> <button >Employee</button></a></th>
    <th><a href="Facility.php"><button >Facility</button></a></th>
    <th><a href="Infection.php"><button >Infection</button></a></th>
    <th><a href="Vaccination.php"><button >Vaccination</button></a></th>
    <th><a href="Registration.php"><button >Registration</button></a></th>
    <th><a href="email.php"><button >Email</button></a></th> -->
    <h1>Email Actions</h1>
    <form action="" method="post">
        <input type="submit" name="sendInfectedEmail" value="Send Infected Teacher Email">
    </form>
    <br>
    <form action="" method="post">
        <input type="submit" name="sendWeeklyScheduleEmails" value="Send Weekly Schedule Emails">
    </form>
    <br>
    <a href="emailLog.php"><button>Show Email Log</button></a>
</body>
</html>