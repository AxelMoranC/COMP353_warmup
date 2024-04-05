<!-- <?php
echo '
<form action="displayFacility.php" method="get">
    <label for="FacilityID">Enter Facility ID to delete:</label><br>
    <input type="text" id="FacilityID" name="FacilityID"><br>
    <input type="submit" value="Delete Facility">
</form>
';
?> -->
<?php
require_once 'connection.php';
//Ensures that there is a facilityID to be able to delete the right one
// TO ADD!!!!! --> a button to write the facility ID to be able to delete it
if (isset($_GET["FacilityID"])) {
    $facilityID = $_GET["FacilityID"];

    // Delete the facility record based on the provided facilityID
    $deleteStatement = $conn_pdo->prepare('DELETE FROM Facilities WHERE FacilityID = :FacilityID;');
    $deleteStatement->bindParam(':FacilityID', $facilityID);
    $deleteStatement->execute();

    header("Location: ./displayFacility.php");
} else {
    echo "Facility ID not provided.";
}
?>