<!-- FROM CHATGPT MUST CHECK AUTHENTICITY -->

<?php
session_start();

// Set session variables for database connection details
$_SESSION['db_servername'] = "qjc353.encs.concordia.ca";
$_SESSION['db_username'] = "qjc353_4";
$_SESSION['db_password'] = "compaari";
$_SESSION['db_database'] = "qjc353_4";


// Function to close database connection --ONLY FOR MYSQLi
function closeDatabaseConnection($conn) {
    mysqli_close($conn);
}

// Function to close database connection --ONLY FOR PDO
function closeDatabaseConnectionPDO() {
    //$conn_pdo->query('KILL CONNECTION_ID()');
    $conn_pdo = null;
}

?>
