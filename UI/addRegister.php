<?php include 'navbar.php' ?>

<?php
    require_once 'connection.php';
    require_once "functions/CRUD_Person.php";
// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
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

    addRegister($firstname, $lastname, $dateOfBirth, $socialSecurity, $medicareCard, $phoneNumber, $citizenship,$email, $residenceID, $startedDateAtAddress);
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
// $conn_pdo = null;

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Person</title>
    <link rel="stylesheet" href="Styling/people.css">
</head>

<body>
    <h1>Add New Person</h1>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label for="firstName">First Name:</label><br />
        <input type="text" id="firstName" name="firstName" required><br />

        <label for="lastName">Last Name:</label><br />
        <input type="text" id="lastName" name="lastName" required><br />

        <label for="dateOfBirth">Date of Birth:</label><br />
        <input type="date" id="dateOfBirth" name="dateOfBirth" required><br />

        <label for="socialSecurity">Social Security:</label><br />
        <input type="text" id="socialSecurity" name="socialSecurity" required><br />

        <label for="medicareCard">Medicare Card:</label><br />
        <input type="text" id="medicareCard" name="medicareCard" required><br />

        <label for="phoneNumber">Phone Number:</label><br />
        <input type="tel" id="phoneNumber" name="phoneNumber"><br />

        <label for="citizenship">Citizenship:</label><br />
        <input type="text" id="citizenship" name="citizenship"><br />

        <label for="email">Email:</label><br />
        <input type="email" id="email" name="email"><br />

         <label for="residenceID">Residence ID:</label> <br />
        <!--<input type="number" id="residenceID" name="residenceID" required><br /> -->
        <select id="residenceID" name="residenceID">
            <option value="">Select Residence</option>
            <?php foreach ($residences as $residence) { ?>
                <option value="<?php echo $residence['ResidenceID']; ?>">
                    <?php echo $residence['Address'] . ', ' . $residence['City'] . ', ' . $residence['Province'] . ', ' . $residence['PostalCode']; ?>
                </option>
            <?php } ?>
        </select> <br />

        <label for="startedDateAtAddress">Started Date at Address:</label><br />
        <input type="date" id="startedDateAtAddress" name="startedDateAtAddress" required><br />

        <button type="submit">Add Person</button>
    </form>
</body>

</html>
