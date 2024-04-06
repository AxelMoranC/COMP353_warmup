<?php

// Function to create a new residence
function createResidence($houseType, $address, $city, $province, $postalCode, $residencePhoneNumber, $amountBedrooms) {
    require_once 'connection.php';

    $sql = "INSERT INTO Residence 
            (HouseType, Address, City, Province, PostalCode, ResidencePhoneNumber, AmountBedrooms) 
            VALUES (:houseType, :address, :city, :province, :postalCode, :residencePhoneNumber, :amountBedrooms)";
    
    $statement = $conn_pdo->prepare($sql);
    $statement->bindParam(':houseType', $houseType);
    $statement->bindParam(':address', $address);
    $statement->bindParam(':city', $city);
    $statement->bindParam(':province', $province);
    $statement->bindParam(':postalCode', $postalCode);
    $statement->bindParam(':residencePhoneNumber', $residencePhoneNumber);
    $statement->bindParam(':amountBedrooms', $amountBedrooms);

    // Execute the statement
    if ($statement->execute()) {
        $conn_pdo = null;
        echo "<script>alert('Residence added successfully!'); window.location.href = 'displayResidence.php';</script>";
    } else {
        $conn_pdo = null;
        echo "<script>alert('Failed to add residence. Please try again.'); window.location.href = 'displayResidence.php';</script>";
    }
}

// Function to update a residence
function updateResidence($id, $houseType, $address, $city, $province, $postalCode, $residencePhoneNumber, $amountBedrooms) {
    global $conn_pdo;

    $sql = "UPDATE Residence 
            SET HouseType=:houseType, Address=:address, City=:city, Province=:province, PostalCode=:postalCode, 
            ResidencePhoneNumber=:residencePhoneNumber, AmountBedrooms=:amountBedrooms 
            WHERE ResidenceID=:id";
    
    $statement = $conn_pdo->prepare($sql);
    $statement->bindParam(':id', $id);
    $statement->bindParam(':houseType', $houseType);
    $statement->bindParam(':address', $address);
    $statement->bindParam(':city', $city);
    $statement->bindParam(':province', $province);
    $statement->bindParam(':postalCode', $postalCode);
    $statement->bindParam(':residencePhoneNumber', $residencePhoneNumber);
    $statement->bindParam(':amountBedrooms', $amountBedrooms);

    // Execute the statement
    if ($statement->execute()) {
        $conn_pdo = null;
        return "Residence updated successfully";
    } else {
        $conn_pdo = null;
        return "Failed to update residence. Please try again.";
    }
}

// Function to delete a residence
function deleteResidence($id) {
    global $conn_pdo;
    
    $sql = "DELETE FROM Residence WHERE ResidenceID=:id";
    $statement = $conn_pdo->prepare($sql);
    $statement->bindParam(':id', $id);

    // Execute the statement
    if ($statement->execute()) {
        $conn_pdo = null;
        return "Residence deleted successfully";
    } else {
        $conn_pdo = null;
        return "Failed to delete residence. Please try again.";
    }
}

?>