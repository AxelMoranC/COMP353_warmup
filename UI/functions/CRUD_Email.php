<?php
//require_once 'connection.php';


//Function to send a Mail to someone using the mail function in php
function sendMail($to, $subject, $message) {
    $headers = "From: sender@example.com" . "\r\n";
    $headers .= "Reply-To: sender@example.com" . "\r\n";

    try {
        // Attempt to send the email
        $mailSent = mail($to, $subject, $message, $headers);

        // Check if the email was sent successfully
        if ($mailSent) {
            return true;
        } else {
            return false;
        }
    } catch (Exception $e) {
        // Handle any exceptions that occur during email sending
        error_log("Error sending email: " . $e->getMessage());
        return false;
    }
}

// Function to log email in the database
function logEmail($sender, $receiver, $subject, $body) {
    global $conn_pdo;

    $emailDate = date('Y-m-d H:i:s'); // Get current date and time

    try {
        $sql = "INSERT INTO EmailLog (email_date, sender, receiver, subject_email, body)
                  VALUES (:emailDate, :sender, :receiver, :subject, SUBSTRING(:body, 1, 100))";
        $data = $conn_pdo->prepare($sql);
        $data->bindParam(':emailDate', $emailDate);
        $data->bindParam(':sender', $sender);
        $data->bindParam(':receiver', $receiver);
        $data->bindParam(':subject', $subject);
        $data->bindParam(':body', $body);

        $data->execute();

        return true;
    } catch (PDOException $e) {
        // Handle exceptions or errors
        return false;
    }
}

// Function to send email and log it
function sendAndLogEmail($to, $subject, $message, $senderID, $receiverID) {
    if (sendMail($to, $subject, $message)) {

        // If email sent successfully, log it in the database
        if (logEmail($senderID, $receiverID, $subject, $message)) {
            return true;
        } else {
            // Handle logging failure
            return false;
        }
    } else {
        // Handle email sending failure
        return false;
    }
}



//This function cancels the schedule for an infected employee
function cancelAssignmentsForInfectedEmployee($medicareCard, $infectionDate) {
    global $conn_pdo;


    $endDate = date('m-d-Y', strtotime($infectionDate . ' + 2 weeks'));

    try {
        // Retrieve the email address of the infected employee
        // $emailQuery = "SELECT EmailAddress FROM Persons WHERE MedicareCard = :medicareCard";
        // $emailStatement = $conn_pdo->prepare($emailQuery);
        // $emailStatement->bindParam(':medicareCard', $medicareCard);
        // $emailStatement->execute();
        // $emailResult = $emailStatement->fetch();
        // $infectedEmployeeEmail = $emailResult['EmailAddress'];

        // // Compose the email message
        // $subject = "Assignment Cancellation Due to COVID-19 Infection";
        // $message = "Dear Employee,\n\nYour assignment has been canceled due to a COVID-19 infection. Please contact your supervisor for further instructions.\n\nBest regards,\n\nYour Company";

        // // Send email to the infected employee
        // sendMail($infectedEmployeeEmail, $subject, $message);



        $sql = "UPDATE Schedule
                  SET StartTime = NULL, EndTime = NULL
                  WHERE MedicareCard = :medicareCard 
                    AND Schedule_Date BETWEEN :infectionDate AND :endDate";
        
        $data = $conn_pdo->prepare($sql);
        $data->bindParam(':medicareCard', $infectedMedicareCard);
        $data->bindParam(':infectionDate', $infectionDate);
        $data->bindParam(':endDate', $endDate);
        $data->execute();

        return true;
    } catch (PDOException $e) {
        // Handle exceptions or errors
        return "Failed to send canceled assignments warning emails: " . $e->getMessage();
    }
}

//This function sends an email to all the employees that one of their colleagues has been infected
function sendInfectedEmployeeWarningEmail($medicareCard) {
    global $conn_pdo;

    try {
        $query_employee = "SELECT E.*, P.PersonID, P.FirstName, P.LastName,F.FacilityName
                            FROM Employees E
                            JOIN Persons P ON P.MedicareCard = E.MedicareCard
                            JOIN Facilities F ON E.FacilityID = F.FacilityID
                            WHERE E.MedicareCard = :medicareCard";
            
         //Connect to database   
        $data = $conn_pdo->prepare($query_employee);     
        // Bind the parameter
        $data->bindParam(':medicareCard', $medicareCard);
        $data->execute();

        $employee = $data->fetch();

        //while ($employee = $data->fetchAll(PDO::FETCH_ASSOC)) {

        // Define email parameters
        if ($employee) {
            $subject = "Warning: COVID-19 Infection Alert";
            $message = "Dear colleague,\r\n\r\nOne of your coworkers ({$employee['FirstName']} {$employee['LastName']}-> {$employee['MedicareCard']})\r\n";
            $message .= "has been infected with COVID-19. Please take necessary precautions and monitor your health.\r\n\r\n";
            $message .= "Best regards,\r\n\r\n";
            $message .= "{$employee['FacilityName']}.";

            // Send email MAKE UP BULLSHIT WE DON;T WANT TO SEND IT TO ACTUAL EMAILS OR ELSE WE'RE FFFFFFFFF
            //$infectedEmployeeEmail = "qj_comp353_4@encs.concordia.ca";

            // $infectedEmail = array(
            //     'a_moranc@live.concordia.ca',
            //     'Robert.chen@mail.concordia.ca',
            //     'ay_man@live.concordia.ca',
            //     'a_nduwum@live.concordia.ca',
            // );

            // foreach ($infectedEmail as $emails) {
            //     sendAndLogEmail($emails, $subject, $message, $employee['FacilityID'], $employee['PersonID']);
            // }
            $infectedEmployeeEmail = "qjc353@encs.concordia.ca";


            return sendAndLogEmail($infectedEmployeeEmail, $subject, $message, $employee['FacilityID'], $employee['PersonID']);
        }
        return true;
    } catch (PDOException $e) {
        // Handle exceptions or errors
        return "Failed to send infected employee warning emails: " . $e->getMessage();
    }
}



//This function sends a WeeklySchedule Email to all the employees from the same facility
function sendWeeklyScheduleEmails() {
    global $conn_pdo;

    // Get next Sunday and Saturday dates
    $nextSunday = date('m-d-y', strtotime('next Sunday'));
    $nextSaturday = date('m-d-y', strtotime($nextSunday . ' + 6 days'));

    try {
        $sql = "SELECT e.MedicareCard, e.FacilityID, f.FacilityName, f.Address, f.City, f.Province,
                        p.FirstName, p.LastName, p.Email, p.PersonID,
                        s.Schedule_Date, s.StartTime, s.EndTime
                FROM Employees e
                JOIN Schedule s ON e.MedicareCard = s.MedicareCard
                JOIN Facilities f ON e.FacilityID = f.FacilityID
                JOIN Persons p ON e.MedicareCard = p.MedicareCard
                WHERE s.Schedule_Date BETWEEN :nextSunday AND :nextSaturday";

        $data = $conn_pdo->prepare($sql);
        $data->bindParam(':nextSunday', $nextSunday);
        $data->bindParam(':nextSaturday', $nextSaturday);

        $data->execute();
        //$result = $data->fetchAll(PDO::FETCH_ASSOC);

        //Send email to facilities and stuff
        while ($row = $data->fetchAll(PDO::FETCH_ASSOC)) {

            $subject = "{$row['FacilityName']} Schedule for " . date('l m-d-y', strtotime($nextSunday)) . " to " . date('l m-d-y', strtotime($nextSaturday));    
            $body .= "Hello {$row['FirstName']} {$row['LastName']}, ({$row['Email']}). as a member of our facility,\r\n";
            $body .= "This is your schedule for the coming week:\n";

            for ($i = 0; $i < 7; $i++) {
                $dayOfWeek = date('l', strtotime($nextSunday . " + $i days"));
                $startTime = ($row["StartTime_$i"]) ? date('H:i', strtotime($row["StartTime_$i"])) : 'No Assignment';
                $endTime = ($row["EndTime_$i"]) ? date('H:i', strtotime($row["EndTime_$i"])) : 'No Assignment';
                $body .= "$dayOfWeek: $startTime - $endTime\r\n";
            }

            //Finish
            $body .= "Kind regards, \r\n\r\n";
            $body = "hello, this is {$row['FacilityName']}\r\n";
            $body .= "Address: {$row['Address']}, {$row['City']}, {$row['Province']}\r\n";


            //$receiverEmail = $row['EmailAddress'];
            // Send email MAKE UP BULLSHIT WE DON;T WANT TO SEND IT TO ACTUAL EMAILS OR ELSE WE'RE FFFFFFFFF
            //$receiverEmail = "sentWeeklySchedule@lol.com";
            $receiverEmail = "qj_comp353_4@encs.concordia.ca";
            $receiverID = $row['PersonID'];
            $senderFacilityID = $row['FacilityID'];

            // $receiverEmail = array(
            //     'a_moranc@live.concordia.ca',
            //     'Robert.chen@mail.concordia.ca',
            //     'ay_man@live.concordia.ca',
            //     'a_nduwum@live.concordia.ca',
            // );

            // foreach ($receiverEmail as $emails) {
            //     sendAndLogEmail($emails, $subject, $body, $senderFacilityID, $receiverID);
            // }

            return sendAndLogEmail($receiverEmail, $subject, $body, $senderFacilityID, $receiverID);
        }

        return true;
    } catch (PDOException $e) {
        // Handle exceptions or errors
        return "Failed to send weekly emails: " . $e->getMessage();
    }
}




