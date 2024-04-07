<?php
require_once 'connection.php';


//Function to send a Mail to someone using the mail function in php
function sendMail($to, $subject, $message) {
    $headers = "From: sender@example.com" . "\r\n";
    $headers .= "Reply-To: sender@example.com" . "\r\n";

    $mailSent = mail($to, $subject, $message, $headers);

    if ($mailSent) {
        return true;
    } else {
        return false;
    }
}



//This function cancels the schedule for an infected teacher
function cancelAssignmentsForInfectedTeacher($teacherMedicareID, $infectionDate) {
    global $connection;

    $endDate = date('Y-m-d', strtotime($infectionDate . ' + 2 weeks'));

    $updateQuery = "UPDATE Schedule
                    SET startTime = NULL, endTime = NULL
                    WHERE employeeID = $teacherMedicareID AND date BETWEEN '$infectionDate' AND '$endDate'";

    $result = $connection->query($updateQuery);

    if ($result) {
        return true;
    } else {
        return false;
    }
}
//This function sends an email to all the teacher that one of their colleagues has been infected
function sendInfectedTeacherEmail($teacherMedicareID, $infectionDate) {
    global $connection;

    $teacherQuery = "SELECT emp.*, fac.facilityName
                     FROM Employees emp
                     JOIN Facilities fac ON emp.facilityID = fac.facilityID
                     WHERE emp.medicareID = $teacherMedicareID";

    $teacherResult = $connection->query($teacherQuery);
    $teacherData = $teacherResult->fetch_assoc();

    $principalEmail = "InfectionAlert@example.com"; 
    $subject = "Warning";
    $message = "{$teacherData['firstName']} {$teacherData['lastName']} who teaches in your school has been infected with COVID-19 on $infectionDate.";

    $emailSent = sendMail($principalEmail, $subject, $message);

    if ($emailSent) {
        // Log email in the database
        $emailID = uniqid(); // Generate a unique email ID
        $logQuery = "INSERT INTO EmailLog (emailID, senderFacilityID, receiverID, emailDate, emailSubject, emailBody, type)
                     VALUES ('$emailID', '{$teacherData['facilityID']}', '$teacherMedicareID', NOW(), '$subject', '" . substr($message, 0, 80) . "', 'infected')";
        $connection->query($logQuery);
        
        return true;
    } else {
        return false;
    }
}
//This function sends a WeeklySchedule Email to all the teachers
function sendWeeklyScheduleEmails() {
    global $connection;

    $today = date('Y-m-d');
    $nextSunday = date('Y-m-d', strtotime('next Sunday'));
    $nextSaturday = date('Y-m-d', strtotime($nextSunday . ' + 6 days'));

    $scheduleQuery = "SELECT sch.*, emp.firstName, emp.lastName, emp.emailAddress, fac.facilityName, fac.address, fac.city, fac.province
                      FROM Schedule sch
                      JOIN Employees emp ON sch.employeeID = emp.medicareID
                      JOIN Facilities fac ON sch.facilityID = fac.facilityID
                      WHERE sch.date BETWEEN '$nextSunday' AND '$nextSaturday'";

    $scheduleResult = $connection->query($scheduleQuery);

    
    while ($row = $scheduleResult->fetch_assoc()) {
        $employeeName = $row['firstName'] . ' ' . $row['lastName'];
        $facilityName = $row['facilityName'];
        $address = $row['address'] . ', ' . $row['city'] . ', ' . $row['province'];
        $email = $row['emailAddress'];
        $scheduleDetails = '';

        for ($i = 0; $i < 7; $i++) {
            $dayOfWeek = date('l', strtotime($nextSunday . " + $i days"));
            $startTime = ($row["startTime_$i"]) ? date('H:i', strtotime($row["startTime_$i"])) : 'No Assignment';
            $endTime = ($row["endTime_$i"]) ? date('H:i', strtotime($row["endTime_$i"])) : 'No Assignment';
            $scheduleDetails .= "$dayOfWeek: $startTime - $endTime\n";
        }

        $subject = "$facilityName Schedule for " . date('d-M-Y', strtotime($nextSunday)) . " to " . date('d-M-Y', strtotime($nextSaturday));
        $message = "Facility Name: $facilityName\nAddress: $address\nEmployee Name: $employeeName\nEmail: $email\n\nSchedule for the coming week:\n$scheduleDetails";

        $emailSent = sendMail($email, $subject, $message);

        if ($emailSent) {
            // Log email in the database
            $emailID = uniqid(); // Generate a unique email ID
            $logQuery = "INSERT INTO EmailLog (emailID, senderFacilityID, receiverID, emailDate, emailSubject, emailBody, type)
                         VALUES ('$emailID', '{$row['facilityID']}', '{$row['medicareID']}', NOW(), '$subject', '" . substr($message, 0, 80) . "', 'schedule')";
            $connection->query($logQuery);
        }
    }
}

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


