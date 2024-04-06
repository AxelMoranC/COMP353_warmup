<?php

function createSchedule($medicareCard, $facilityID, $scheduleDate, $startTime, $endTime) {
    // Insert new schedule into the database
    global $conn_pdo;

    $insertStatement = $conn_pdo->prepare('INSERT INTO Schedule (MedicareCard, FacilityID, Schedule_Date, StartTime, EndTime) 
    VALUES (:medicareCard, :facilityID, :scheduleDate, :startTime, :endTime);');
    $insertStatement->bindParam(':medicareCard', $medicareCard);
    $insertStatement->bindParam(':facilityID', $facilityID);
    $insertStatement->bindParam(':scheduleDate', $scheduleDate);
    $insertStatement->bindParam(':startTime', $startTime);
    $insertStatement->bindParam(':endTime', $endTime);
    $insertStatement->execute();

    // Execute the statement
    if ($insertStatement->execute()) {
        $conn_pdo = null;
        echo "<script>alert('Success!'); window.location.href = 'displaySchedule.php';</script>";
        exit();
    } 
    else {
        $conn_pdo = null;
        echo "<script>alert('Failed'); window.location.href = 'displaySchedule.php';</script>";
        exit();
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


