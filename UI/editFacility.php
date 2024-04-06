<?php include 'navbar.php';  ?>

<?php
require_once 'connection.php';
require_once 'functions/CRUD_Facility.php'; // Include CRUD_Facility.php

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $facilityID = $_POST["facilityID"];
    $facilityName = $_POST["facilityName"];
    $address = $_POST["address"];
    $city = $_POST["city"];
    $province = $_POST["province"];
    $postalCode = $_POST["postalCode"];
    $phoneNumber = $_POST["phoneNumber"];
    $webAddress = $_POST["webAddress"];
    $facilityType = $_POST["facilityType"];
    $capacity = $_POST["capacity"];
    
    // Call updateFacility function
    $updateMessage = updateFacility($facilityID, $facilityName, $address, $city, $province, $postalCode, $phoneNumber, $webAddress, $facilityType, $capacity);
    
    // Redirect back to displayFacility.php
    echo "<script>alert('$updateMessage'); window.location.href = 'displayFacility.php';</script>";
    exit; // Prevent further execution
}


// Retrieve facility details from the URL parameter
if (isset($_GET["FacilityID"])) {
    $facilityID = $_GET["FacilityID"];
    
    // Fetch facility details from the database
    $statement = $conn_pdo->prepare('SELECT * FROM Facilities WHERE FacilityID = :FacilityID');
    $statement->bindParam(':FacilityID', $facilityID);

    $statement->execute();
    $facility = $statement->fetch(PDO::FETCH_ASSOC);

    $conn_pdo = null;
} else {
    echo "Facility ID not available.";
    $conn_pdo = null;
    exit; // Prevent further execution
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Facility</title>
    <link rel="stylesheet" href="Styling/facilities.css">
</head>

<body>
    <h1>Edit Facility</h1>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <input type="hidden" name="facilityID" value="<?php echo $facility['FacilityID']; ?>">
        
        <label for="facilityName">Facility Name:</label><br>
        <input type="text" id="facilityName" name="facilityName" value="<?php echo $facility['FacilityName']; ?>" required><br>
        
        <label for="address">Address:</label><br>
        <input type="text" id="address" name="address" value="<?php echo $facility['Address']; ?>" required><br>
        
        <label for="city">City:</label><br>
        <input type="text" id="city" name="city" value="<?php echo $facility['City']; ?>" required><br>
        
        <label for="province">Province:</label><br>
        <input type="text" id="province" name="province" value="<?php echo $facility['Province']; ?>" required><br>
        
        <label for="postalCode">Postal Code:</label><br>
        <input type="text" id="postalCode" name="postalCode" value="<?php echo $facility['PostalCode']; ?>" required><br>
        
        <label for="phoneNumber">Phone Number:</label><br>
        <input type="tel" id="phoneNumber" name="phoneNumber" value="<?php echo $facility['FacilityPhoneNumber']; ?>" required><br>
        
        <label for="webAddress">Web Address:</label><br>
        <input type="text" id="webAddress" name="webAddress" value="<?php echo $facility['WebAddress']; ?>" required><br>
        
        <label for="facilityType">Facility Type:</label><br>
        <select id="facilityType" name="facilityType" required>
            <option value="" disabled>Select facility type</option>
            <option value="Hospital" <?php if ($facility['FacilityType'] === 'Hospital') echo 'selected'; ?>>Hospital</option>
            <option value="CLSC" <?php if ($facility['FacilityType'] === 'CLSC') echo 'selected'; ?>>CLSC</option>
            <option value="Clinic" <?php if ($facility['FacilityType'] === 'Clinic') echo 'selected'; ?>>Clinic</option>
            <option value="Pharmacy" <?php if ($facility['FacilityType'] === 'Pharmacy') echo 'selected'; ?>>Pharmacy</option>
            <option value="Special Installment" <?php if ($facility['FacilityType'] === 'Special Installment') echo 'selected'; ?>>Special Installment</option>
        </select><br>
        
        <label for="capacity">Capacity:</label><br>
        <input type="number" id="capacity" name="capacity" value="<?php echo $facility['Capacity']; ?>" required><br>

    <button type="submit">Save Changes</button>
</form>

    <a href="displayFacility.php">Back to Facility List</a>
</body>

</html>