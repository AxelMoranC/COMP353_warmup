<?php

// Function to create a new facility
function createFacility($facilityName, $address, $city, $province, $postalCode, $phoneNumber, $webAddress, $facilityType, $capacity) {
    require_once 'connection.php';
    $sql = "INSERT INTO Facilities 
                            (FacilityName, Address, City, Province, PostalCode, FacilityPhoneNumber, WebAddress, FacilityType, Capacity) 
                            VALUES (:facilityName, :address, :city, :province, :postalCode, :phoneNumber, :webAddress, :facilityType, :capacity)";
    
    $data = $conn_pdo->prepare($sql);
    $data->bindParam(':facilityName', $facilityName);
    $data->bindParam(':address', $address);
    $data->bindParam(':city', $city);
    $data->bindParam(':province', $province);
    $data->bindParam(':postalCode', $postalCode);
    $data->bindParam(':phoneNumber', $phoneNumber);
    $data->bindParam(':webAddress', $webAddress);
    $data->bindParam(':facilityType', $facilityType);
    $data->bindParam(':capacity', $capacity);

    //return and close connection
    if ($data->execute()) {
        //$conn_pdo->query('KILL CONNECTION_ID()');
        $conn_pdo = null;
        echo "<script>alert('Added!'); window.location.href = 'displayFacility.php';</script>";
    }
    else {
        $conn_pdo = null;
        echo "<script>alert('Attempting to add facility.....'); window.location.href = 'displayFacility.php';</script>";
    }
}


// Function to update a facility
function updateFacility($id, $name, $address, $city, $province, $postalCode, $phoneNumber, $webAddress, $type, $capacity) {
    global $conn_pdo;

    $sql = "UPDATE Facilities SET FacilityName=:facilityName, Address=:address, City=:city, Province=:province, PostalCode=:postalCode, 
            FacilityPhoneNumber=:phoneNumber, WebAddress=:webAddress, FacilityType=:facilityType, Capacity=:capacity WHERE FacilityID=:id";
    
    $data = $conn_pdo->prepare($sql);

    // Bind parameters
    $data->bindParam(':id', $id);
    $data->bindParam(':facilityName', $name);
    $data->bindParam(':address', $address);
    $data->bindParam(':city', $city);
    $data->bindParam(':province', $province);
    $data->bindParam(':postalCode', $postalCode);
    $data->bindParam(':phoneNumber', $phoneNumber);
    $data->bindParam(':webAddress', $webAddress);
    $data->bindParam(':facilityType', $type);
    $data->bindParam(':capacity', $capacity);

    //See if it works
    if ($data->execute()) {
        $conn_pdo = null;
        return "Facility updated successfully";
    } else {
        $conn_pdo = null;
        return "Attempting to update facility... " ;
    }
}

// Function to delete a facility
function deleteFacility($id) {
    global $conn_pdo;

    $sql = "DELETE FROM Facilities WHERE FacilityID=:id";

    $statement = $conn_pdo->prepare($sql);
    
    $statement->bindParam(':id', $id);

    if ($statement->execute()) {
        $conn_pdo = null;
        return "Facility deleted successfully";
    } else {
        $conn_pdo = null;
        return "Attempting to delete facility...";
    }
}


?>