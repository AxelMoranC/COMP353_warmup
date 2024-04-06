<?php

    function createVaccination() {
        require_once 'connection.php';
        // Insert new vaccination record into the database
        $sql = "INSERT INTO HasVaccines (PersonID, DateOfVaccination, DoseNumber, Location, Type) 
                VALUES (:personID, :dateOfVaccination, :doseNumber, :location, :vaccineType)";
        $statement = $conn_pdo->prepare($sql);
        $statement->bindParam(':personID', $personID);
        $statement->bindParam(':dateOfVaccination', $dateOfVaccination);
        $statement->bindParam(':doseNumber', $doseNumber);
        $statement->bindParam(':location', $location);
        $statement->bindParam(':vaccineType', $vaccineType);

        if ($statement->execute()) {
            // Redirect to the vaccination list page after successful insertion
            header("Location: allVaccinations.php");
            exit();
        } else {
            // Handle error if insertion fails
            echo "Error: Unable to add new vaccination record.";
        }
    }
?>