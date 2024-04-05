<!--Include a navigatio nbar everywhere we go -->
<?php include 'navbar.php';  ?>




<!--make sure every field is full-->
<?php
        //Include CRUD_Facility.php file
        require_once "functions/CRUD_Facility.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $facilityName = $_POST["facilityName"];
    $address = $_POST["address"];
    $city = $_POST["city"];
    $province = $_POST["province"];
    $postalCode = $_POST["postalCode"];
    $phoneNumber = $_POST["phoneNumber"];
    $webAddress = $_POST["webAddress"];
    $facilityType = $_POST["facilityType"];
    $capacity = $_POST["capacity"];
    
    // Call from CRUD_Facility.php
    createFacility($facilityName, $address, $city, $province, $postalCode, $phoneNumber, $webAddress, $facilityType, $capacity);
    exit; //Exit to ensure nothing happens after execution
}
?>



<!--HTML-->
<!DOCTYPE html>
<html>

<head>
    <title>Create Facility</title>
    <link rel="stylesheet" href="Styling/facilities.css">
</head>

<body>
    <h1> Create a new Facility <h1>

        <!--Form used to transfer data to create a new Facility -->
    <form action="./createFacility.php" method="post">

        <!--All data within our SQL Table -->
        <label for="facilityName">Facility Name:</label><br>
        <input type="text" id="facilityName" name="facilityName" placeholder="Enter facility name" required><br>
        
        <label for="address">Address:</label><br>
        <input type="text" id="address" name="address" placeholder="Enter address" required><br>
        
        <label for="city">City:</label><br>
        <input type="text" id="city" name="city" placeholder="Enter city" required><br>
        
        <label for="province">Province:</label><br>
        <input type="text" id="province" name="province" placeholder="Enter province" required><br>
        
        <label for="postalCode">Postal Code:</label><br>
        <input type="text" id="postalCode" name="postalCode" placeholder="Enter postal code" required><br>
        
        <label for="phoneNumber">Phone Number:</label><br>
        <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Enter phone number" required><br>
        
        <label for="webAddress">Web Address:</label><br>
        <input type="text" id="webAddress" name="webAddress" placeholder="Enter web address" required><br>
        
        <label for="facilityType">Facility Type:</label><br>
        <select id="facilityType" name="facilityType" required>

            <option value="" disabled selection>Select facility type</option>
            <option value="Hospital">Hospital</option>
            <option value="CLSC">CLSC</option>
            <option value="clinic">Clinic</option>
            <option value="pharmacy">Pharmacy</option>
            <option value="special installment">Special Installment</option>

        </select><br>
        
        <label for="capacity">Capacity:</label><br>
        <input type="number" id="capacity" name="capacity" placeholder="Enter capacity" required><br>
        
        <button type="submit">Create new Facility</button>
    </form>

</body>


</html>