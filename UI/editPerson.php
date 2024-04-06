<?php include 'navbar.php' ?>

<?php
require_once 'connection.php';
require_once 'functions/CRUD_Person.php'; // Include CRUD_Person.php

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $personID = $_POST["personID"];
    $firstName = $_POST["firstName"];
    $lastName = $_POST["lastName"];
    $dateOfBirth = $_POST["dateOfBirth"];
    $socialSecurity = $_POST["socialSecurity"];
    $medicareCard = $_POST["medicareCard"];
    $phoneNumber = $_POST["phoneNumber"];
    $citizenship = $_POST["citizenship"];
    $email = $_POST["email"];
    $residenceID = $_POST["residenceID"];
    $startedDateAtAddress = $_POST["startedDateAtAddress"];

    // Call function to update person information
    $updateMessage = updatePerson($personID, $firstName, $lastName, $dateOfBirth, $socialSecurity, $medicareCard, $phoneNumber, $citizenship, $email, $residenceID, $startedDateAtAddress);
    echo "<script>alert('$updateMessage'); window.location.href = 'displayPeople.php';</script>";
    exit; // Prevent further execution after updating person
}


// Check if person ID is provided in URL
if (isset($_GET["personID"])) {
    // Retrieve person ID from URL
    $personID = $_GET["personID"];

    // Fetch facility details from the database
    $statement = $conn_pdo->prepare('SELECT * FROM Persons WHERE PersonID = :personID');
    $statement->bindParam(':personID', $personID);

    $statement->execute();
    $facility = $statement->fetch();
}
else {
    header("Location: displayPeople.php");    // Redirect to displayPeople.php if person ID is not provided
    exit;
}

?>

<?php
//Retrieve Residence values
$sql2 = "SELECT ResidenceID, Address, City, Province, PostalCode FROM Residence";
$statement2 = $conn_pdo->prepare($sql2);
$statement2->execute();
$residences = $statement2->fetchAll(PDO::FETCH_ASSOC);


// Close the database connection
$conn_pdo = null;
?>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit for a  New Person</title>
    <link rel="stylesheet" href="Styling/people.css">
</head>

<body>
    <h1>Edit Person</h1>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <input type="hidden" name="personID" value="<?php echo $personID; ?>"> <!-- Hidden input field to store person ID -->

        <label for="firstName">First Name:</label><br />
        <input type="text" id="firstName" name="firstName" value="<?php echo $personDetails['FirstName']; ?>" required><br />

        <label for="lastName">Last Name:</label><br />
        <input type="text" id="lastName" name="lastName" value="<?php echo $personDetails['LastName']; ?>" required><br />

        <label for="dateOfBirth">Date of Birth:</label><br />
        <input type="date" id="dateOfBirth" name="dateOfBirth" value="<?php echo $personDetails['DateOfBirth']; ?>" required><br />

        <label for="socialSecurity">Social Security:</label><br />
        <input type="text" id="socialSecurity" name="socialSecurity" value="<?php echo $personDetails['SocialSecurity']; ?>" required><br />

        <label for="medicareCard">Medicare Card:</label><br />
        <input type="text" id="medicareCard" name="medicareCard" value="<?php echo $personDetails['MedicareCard']; ?>" required><br />

        <label for="phoneNumber">Phone Number:</label><br />
        <input type="tel" id="phoneNumber" name="phoneNumber" value="<?php echo $personDetails['PhoneNumber']; ?>"><br />

        <label for="citizenship">Citizenship:</label><br />
        <input type="text" id="citizenship" name="citizenship" value="<?php echo $personDetails['Citizenship']; ?>"><br />

        <label for="email">Email:</label><br />
        <input type="email" id="email" name="email" value="<?php echo $personDetails['Email']; ?>"><br />

        <label for="residenceID">Residence ID:</label> <br />
        <select id="residenceID" name="residenceID">
            <option value="">Select Residence</option>
            <?php foreach ($residences as $residence) { ?>
                <option value="<?php echo $residence['ResidenceID']; ?>" <?php if ($residence['ResidenceID'] == $personDetails['ResidenceID']) echo "selected"; ?>>
                    <?php echo $residence['Address'] . ', ' . $residence['City'] . ', ' . $residence['Province'] . ', ' . $residence['PostalCode']; ?>
                </option>
            <?php } ?>
        </select> <br />

        <label for="startedDateAtAddress">Started Date at Address:</label><br />
        <input type="date" id="startedDateAtAddress" name="startedDateAtAddress" value="<?php echo $personDetails['StartedDateAtAddress']; ?>" required><br />

        <button type="submit">Save Changes</button>
    </form>
</body>

</html>
