<?php include 'navbar.php'; ?>

<?php require_once 'connection.php'; ?>
<?php require_once 'functions/CRUD_Email.php'; ?>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if triggered by sending infected employee email
    if (isset($_POST["sendInfectedEmployeeEmail"])) {

        if (isset($_POST["infectedMedicareID"])) {
            $infectedMedicareID = $_POST["infectedMedicareID"];

            $result = sendInfectedEmployeeWarningEmail($infectedMedicareID);
            if ($result === true) {
                echo '<script>alert("Infected employee warning emails sent successfully.");</script>';
                //echo '<script>window.location.href="Email.php"; </script>';
            } else {
                echo '<script>alert("' . $result . '");</script>';
                echo '<script>window.location.href="Email.php"; </script>';
            }
        }
    }

    // Check if triggered by sending weekly schedule emails
    if (isset($_POST["sendWeeklyScheduleEmails"])) {
        $result = sendWeeklyScheduleEmails();

        if ($result === true) {
            $conn_pdo = null;
            echo '<script>alert("Weekly schedule emails sent.");</script>';
            echo '<script>window.location.href="Email.php"; </script>';
        } else {
            $conn_pdo = null;
            echo '<script>alert("' . $result . '");</script>';
            echo '<script>window.location.href="Email.php"; </script>';
        }
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
    <h1>Email Actions</h1>

    <form action="" method="post">
        <label for="infectedMedicareID">Infected Employee Medicare ID:</label>
        <input type="text" name="infectedMedicareID" id="infectedMedicareID" required>
        <input type="submit" name="sendInfectedEmployeeEmail" value="Send Infected Employee Email">
    </form>

    <br />
    <form action="" method="post">
        <input type="submit" name="sendWeeklyScheduleEmails" value="Send Weekly Schedule Emails">
    </form>
    <br />

    <a href="emailLog.php"><button>Show Email Log</button></a>
</body>
</html>