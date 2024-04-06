<?php include 'navbar.php'; ?>

<?php
require_once 'connection.php';
require_once 'functions/CRUD_Residence.php'; // Include CRUD_Residence.php

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $residenceID = $_POST["residenceID"];
    $houseType = $_POST["houseType"];
    $address = $_POST["address"];
    $city = $_POST["city"];
    $province = $_POST["province"];
    $postalCode = $_POST["postalCode"];
    $residencePhoneNumber = $_POST["residencePhoneNumber"];
    $amountBedrooms = $_POST["amountBedrooms"];
    
    // Call updateResidence function
    $updateMessage = updateResidence($residenceID, $houseType, $address, $city, $province, $postalCode, $residencePhoneNumber, $amountBedrooms);
    
    // Redirect back to displayResidence.php
    echo "<script>alert('$updateMessage'); window.location.href = 'displayResidence.php';</script>";
    exit; // Prevent further execution
}

// Retrieve residence details from the URL parameter
if (isset($_GET["ResidenceID"])) {
    $residenceID = $_GET["ResidenceID"];
    
    // Fetch residence details from the database
    $statement = $conn_pdo->prepare('SELECT * FROM Residence WHERE ResidenceID = :ResidenceID');
    $statement->bindParam(':ResidenceID', $residenceID);
    $statement->execute();

    $residence = $statement->fetch();

    $conn_pdo = null;
} else {
    echo "Residence ID not available.";
    $conn_pdo = null;
    exit; // Prevent further execution
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Residence</title>
    <link rel="stylesheet" href="Styling/facilities.css">
</head>

<body>
    <h1>Edit Residence</h1>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <input type="hidden" name="residenceID" value="<?php echo $residence['ResidenceID']; ?>">
        
        <label for="houseType">House Type:</label><br>
        <input type="text" id="houseType" name="houseType" value="<?php echo $residence['HouseType']; ?>" required><br>
        
        <label for="address">Address:</label><br>
        <input type="text" id="address" name="address" value="<?php echo $residence['Address']; ?>" required><br>
        
        <label for="city">City:</label><br>
        <input type="text" id="city" name="city" value="<?php echo $residence['City']; ?>" required><br>
        
        <label for="province">Province:</label><br>
        <input type="text" id="province" name="province" value="<?php echo $residence['Province']; ?>" required><br>
        
        <label for="postalCode">Postal Code:</label><br>
        <input type="text" id="postalCode" name="postalCode" value="<?php echo $residence['PostalCode']; ?>" required><br>
        
        <label for="residencePhoneNumber">Residence Phone Number:</label><br>
        <input type="tel" id="residencePhoneNumber" name="residencePhoneNumber" value="<?php echo $residence['ResidencePhoneNumber']; ?>" required><br>
        
        <label for="amountBedrooms">Amount of Bedrooms:</label><br>
        <input type="number" id="amountBedrooms" name="amountBedrooms" value="<?php echo $residence['AmountBedrooms']; ?>" required><br>

        <button type="submit">Save Changes</button>
    </form>

    <a href="displayResidence.php" style="font-size: 38px">Back to Residence List</a>
</body>

</html>
