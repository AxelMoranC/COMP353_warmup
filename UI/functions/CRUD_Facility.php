<?php
// Include database connection
require_once 'connection.php';

// Function to create a new facility
function createFacility($name, $address, $city, $province, $postalCode, $phoneNumber, $webAddress, $type, $capacity) {
    global $conn;
    $sql = "INSERT INTO Facilities (FacilityName, Address, City, Province, PostalCode, FacilityPhoneNumber, WebAddress, FacilityType, Capacity) 
            VALUES ('$name', '$address', '$city', '$province', '$postalCode', '$phoneNumber', '$webAddress', '$type', $capacity)";
    if ($conn->query($sql) === TRUE) {
        return "New facility created successfully";
    } else {
        return "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Function to read facilities
function readFacilities() {
    global $conn;
    $facilities = [];
    $sql = "SELECT * FROM Facilities";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $facilities[] = $row;
        }
    }
    return $facilities;
}

// Function to update a facility
function updateFacility($id, $name, $address, $city, $province, $postalCode, $phoneNumber, $webAddress, $type, $capacity) {
    global $conn;
    $sql = "UPDATE Facilities SET FacilityName='$name', Address='$address', City='$city', Province='$province', PostalCode='$postalCode', 
            FacilityPhoneNumber='$phoneNumber', WebAddress='$webAddress', FacilityType='$type', Capacity=$capacity WHERE FacilityID=$id";
    if ($conn->query($sql) === TRUE) {
        return "Facility updated successfully";
    } else {
        return "Error updating facility: " . $conn->error;
    }
}

// Function to delete a facility
function deleteFacility($id) {
    global $conn;
    $sql = "DELETE FROM Facilities WHERE FacilityID=$id";
    if ($conn->query($sql) === TRUE) {
        return "Facility deleted successfully";
    } else {
        return "Error deleting facility: " . $conn->error;
    }
}