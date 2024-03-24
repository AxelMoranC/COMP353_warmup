<!-- FROM CHATGPT MUST CHECK AUTHENTICITY -->

<?php
session_start();

// Set session variables for database connection details
$_SESSION['db_servername'] = "localhost";
$_SESSION['db_username'] = "username";
$_SESSION['db_password'] = "password";
$_SESSION['db_database'] = "dbname";

// Function to establish database connection
function connectToDatabase() {
    $conn = mysqli_connect($_SESSION['db_servername'], $_SESSION['db_username'], $_SESSION['db_password'], $_SESSION['db_database']);
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
    return $conn;
}

// Function to close database connection
function closeDatabaseConnection($conn) {
    mysqli_close($conn);
}

// Usage
$conn = connectToDatabase();

// Perform database operations using $conn

// After use, close the connection
closeDatabaseConnection($conn);
?>
