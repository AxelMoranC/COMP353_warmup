<?php


function addRegister($firstname, $lastname, $dateOfBirth, $socialSecurity, $medicareCard, $phoneNumber, $citizenship,$email, $residenceID, $startedDateAtAddress) 
{
    require_once 'connection.php';
    // Prepare SQL statement to insert data into Persons table
    $sql = "INSERT INTO Persons (FirstName, LastName, DateOfBirth, SocialSecurity, MedicareCard, PhoneNumber, Citizenship, Email, ResidenceID, StartedDateAtAddress) 
            VALUES (:firstName, :lastName, :dateOfBirth, :socialSecurity, :medicareCard, :phoneNumber, :citizenship, :email, :residenceID, :startedDateAtAddress)";

    $statement = $conn_pdo->prepare($sql);

    // Bind parameters
    $statement->bindParam(':firstName', $firstName);
    $statement->bindParam(':lastName', $lastName);
    $statement->bindParam(':dateOfBirth', $dateOfBirth);
    $statement->bindParam(':socialSecurity', $socialSecurity);
    $statement->bindParam(':medicareCard', $medicareCard);
    $statement->bindParam(':phoneNumber', $phoneNumber);
    $statement->bindParam(':citizenship', $citizenship);
    $statement->bindParam(':email', $email);
    $statement->bindParam(':residenceID', $residenceID);
    $statement->bindParam(':startedDateAtAddress', $startedDateAtAddress);

    // Execute the statement
    if ($statement->execute()) {
        echo "<script>alert('Person added successfully!');</script>";
    } else {
        echo "<script>alert('Failed to add person.');</script>";
    }

    $conn_pdo = null;
}

function updatePerson($personID, $firstName, $lastName, $dateOfBirth, $socialSecurity, $medicareCard, $phoneNumber, $citizenship, $email, $residenceID, $startedDateAtAddress) 
{
    global $conn_pdo;

    try {
        $sql = "UPDATE Persons SET FirstName = :firstName, LastName = :lastName, DateOfBirth = :dateOfBirth, SocialSecurity = :socialSecurity, MedicareCard = :medicareCard, PhoneNumber = :phoneNumber, Citizenship = :citizenship, Email = :email, ResidenceID = :residenceID, StartedDateAtAddress = :startedDateAtAddress WHERE PersonID = :personID";

        $statement = $conn_pdo->prepare($sql);

        $statement->bindParam(':firstName', $firstName);
        $statement->bindParam(':lastName', $lastName);
        $statement->bindParam(':dateOfBirth', $dateOfBirth);
        $statement->bindParam(':socialSecurity', $socialSecurity);
        $statement->bindParam(':medicareCard', $medicareCard);
        $statement->bindParam(':phoneNumber', $phoneNumber);
        $statement->bindParam(':citizenship', $citizenship);
        $statement->bindParam(':email', $email);
        $statement->bindParam(':residenceID', $residenceID);
        $statement->bindParam(':startedDateAtAddress', $startedDateAtAddress);
        $statement->bindParam(':personID', $personID);

        $statement->execute();

        return "Person information updated successfully";
    } catch (PDOException $e) {
        return "Error updating person information: " . $e->getMessage();
    }

}


function deletePerson($personID) {
    global $conn_pdo;

    try {
        $sql = "DELETE FROM Persons WHERE PersonID=:id";

        $statement = $conn_pdo->prepare($sql);
        $statement->bindParam(':id', $personID);

        if ($statement->execute()) {
            $conn_pdo = null;
            return "Person's information deleted successfully";
        } else {
            $conn_pdo = null;
            return "Attempting to delete info...";
        }
    } catch (PDOException $e) {
        return "Error deleting person: " . $e->getMessage();
    }
}

?>