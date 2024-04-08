<?php

// function isValid($employeeID, $scheduleDate, $startTime, $endTime) {
//     global $conn_pdo;

//     // Check if the employee meets the vaccination requirement
//     if (isEmployeeVaccinated($employeeID)) {
//         // Calculate the date six months prior to the schedule date
//         $sixMonthsAgo = date('Y-m-d', strtotime('-6 months', strtotime($scheduleDate)));

//         // Check if the employee received a COVID-19 vaccine in the past six months
//         if (hasReceivedCOVIDVaccine($employeeID, $sixMonthsAgo)) {
//             // Proceed with creating or updating the schedule
//             try {
//                 // Your code to insert or update the schedule goes here
//                 // Use appropriate SQL queries to perform the operation
//                 return "Schedule created/updated successfully.";
//             } catch (PDOException $e) {
//                 // Handle exceptions or errors
//                 return "Failed to create/update schedule: " . $e->getMessage();
//             }
//         } else {
//             // Notify the user that the employee does not meet the vaccination requirement
//             return "Employee does not meet the vaccination requirement.";
//         }
//     } else {
//         // Notify the user that the employee is not vaccinated
//         return "Employee is not vaccinated.";
//     }
// }

// // Function to check if the employee is vaccinated
// function isEmployeeVaccinated($employeeID) {
//     global $conn_pdo;

//     try {

//         return true; // Example implementation
//     } catch (PDOException $e) {
//         // Handle exceptions or errors
//         return false;
//     }
// }


// // Function to check if the employee has received a COVID-19 vaccine in the past six months
// function hasReceivedCOVIDVaccine($employeeID, $sixMonthsAgo) {
//     global $conn_pdo;

//     try {

//         return true; // Example implementation
//     } catch (PDOException $e) {
//         // Handle exceptions or errors
//         return false;
//     }
// }

function createSchedule($medicareCard, $facilityID, $scheduleDate, $startTime, $endTime) {
    // Insert new schedule into the database
    global $conn_pdo;

    try {
        $insertStatement = $conn_pdo->prepare('INSERT INTO Schedule (MedicareCard, FacilityID, Schedule_Date, StartTime, EndTime, is_no_assignment) 
        VALUES (:medicareCard, :facilityID, :scheduleDate, :startTime, :endTime, 1);');
        $insertStatement->bindParam(':medicareCard', $medicareCard);
        $insertStatement->bindParam(':facilityID', $facilityID);
        $insertStatement->bindParam(':scheduleDate', $scheduleDate);
        $insertStatement->bindParam(':startTime', $startTime);
        $insertStatement->bindParam(':endTime', $endTime);

        // Execute the statement
        if ($insertStatement->execute()) {
            $conn_pdo = null;
            echo "<script>alert('Success!'); window.location.href = 'displaySchedule.php';</script>";
        } 
        else {
            $conn_pdo = null;
            echo "<script>alert('Failed'); window.location.href = 'displaySchedule.php';</script>";
        }
    }
    catch (PDOException $e) {
        // Handle exceptions or errors
        $conn_pdo = null;
        $errorMessage = $e->getMessage();
            // Check if the error message indicates a trigger error
        if (strpos($errorMessage, 'SIGNAL') !== false) {
            echo "<script> alert('Failed to insert schedule: " . $e->getMessage() . "'); window.location.href = 'displaySchedule.php';</script>";
        }
        else {
            echo "<script> alert('Failed to insert schedule: " . $e->getMessage() . "'); window.location.href = 'displaySchedule.php';</script>";
        }

    }
}


function updateSchedule($medicareCard, $facilityID, $scheduleDate, $startTime, $endTime) 
{
    global $conn_pdo;
    // Update schedule in the database
    $updateStatement = $conn_pdo->prepare('UPDATE Schedule 
                                           SET FacilityID = :facilityID, 
                                               MedicareCard = :medicareCard, 
                                               Schedule_Date = :scheduleDate, 
                                               StartTime = :startTime, 
                                               EndTime = :endTime 
                                           WHERE scheduleID = :scheduleID;');
    $updateStatement->bindParam(':facilityID', $facilityID);
    $updateStatement->bindParam(':medicareCard', $employeeID);
    $updateStatement->bindParam(':scheduleDate', $date);
    $updateStatement->bindParam(':startTime', $startTime);
    $updateStatement->bindParam(':endTime', $endTime);
    $updateStatement->bindParam(':scheduleID', $scheduleID);
    $updateStatement->execute();
    
        // Execute the statement
        if ($updateStatement->execute()) {
            $conn_pdo = null;
            echo "<script>alert('Schedule edited successfully!'); window.location.href = 'displaySchedule.php';</script>";
            exit();
        } 
        else {
            $conn_pdo = null;
            echo "<script>alert('Schedule editor failed.'); window.location.href = 'displaySchedule.php';</script>";
            exit();
        }

}

//assign schedule
function assignSchedule($employeeID, $scheduleID) 
{
    global $conn_pdo;

     $data = $conn_pdo->prepare("UPDATE Schedule SET EmployeeID = :employeeID WHERE ScheduleID = :scheduleID");
     $data->bindParam(':employeeID', $employeeID);
     $data->bindParam(':scheduleID', $scheduleID);
     $data->execute();


}

// function deleteSchedule($scheduleID) 
// {



// }


