<?php include 'navbar.php';  ?>

<?php
require_once 'functions/CRUD_Residence.php'; // Include 

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
    createResidence($houseType, $address, $city, $province, $postalCode, $residencePhoneNumber, $amountBedrooms);
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
<h1>Create a new Residence/Housing</h1>

<!-- Form used to transfer data to create a new Residence -->
<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
    <!-- Input fields for residence details -->
    <label for="houseType">House Type:</label><br>
    <select id="houseType" name="houseType" required>
        <option value="" disabled selected>Select house type</option>
        <option value="apartment">Apartment</option>
        <option value="condominium">Condominium</option>
        <option value="semidetached house">Semi-detached House</option>
        <option value="house">House</option>
    </select><br>

    <label for="address">Address:</label><br>
    <input type="text" id="address" name="address" placeholder="Enter address" required><br>
    
    <label for="city">City:</label><br>
    <input type="text" id="city" name="city" placeholder="Enter city" required><br>
    
    <label for="province">Province:</label><br>
    <input type="text" id="province" name="province" placeholder="Enter province" required><br>
    
    <label for="postalCode">Postal Code:</label><br>
    <input type="text" id="postalCode" name="postalCode" placeholder="Enter postal code" required><br>
    
    <label for="residencePhoneNumber">Residence Phone Number:</label><br>
    <input type="tel" id="residencePhoneNumber" name="residencePhoneNumber" placeholder="Enter phone number" required><br>
    
    <label for="amountBedrooms">Amount of Bedrooms:</label><br>
    <input type="number" id="amountBedrooms" name="amountBedrooms" placeholder="Enter number of bedrooms" required><br>
    
    <button type="submit">Create new Residence</button>
</form>

    <br /><br />
    <a href="displayResidence.php">Back to Residence's List</a>
</body>

</html>