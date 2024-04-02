<?php
//our database
//NOT SAFE MUST STORE IT ELSEWHERE
$servername = "qjc353.encs.concordia.ca";
$username = "qjc353_4";
$password = "compaari"; 
$database = "qjc353_4"; 

/** 
    WE GOT 2 OPTIONS: EITHER MySQLi OR PDO
    Generally speaking, PDO is a good choice if you need to work 
    with multiple databases or write portable code as it provides a consistent and abstract interface. 
    MySQLi is ideal for accessing the specific features of MySQL or prefer an object-oriented or procedural style.
*/

/**1ST OPTION */

// Check MySQLi connection
/** try {
    // Create connection
    $conn = new mysqli($servername, $username, $password, $database);

    // Check connection
    if ($conn->connect_error) {
        throw new Exception("Connection failed: " . $conn->connect_error);
    }
    echo "Connected successfully! Move...";

    // Close connection
    //$conn->close();
  
} catch (Exception $e) {
    // Handle exceptions
    echo "Error: " . $e->getMessage();
} */



/**2ND OPTION */
 
// Create connection using PDO
try {
    $conn_pdo = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    // Set PDO error mode to exception
    $conn_pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully! Move...";
  
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>
