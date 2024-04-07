<?php
// Include the connection file
require_once 'connection.php';

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["delete_ids"])) {
    // Retrieve the selected log IDs
    $delete_ids = $_POST["delete_ids"];

    //DELETE query
    $query = "DELETE FROM EmailLog WHERE log_id IN (" . implode(",", $delete_ids) . ")";

    try {
        // Execute the DELETE query
        $data = $conn_pdo->prepare($query);
        $data->execute();

        // Close the database connection
        $conn_pdo = null;
        // Redirect back to the email log page after deletion
        header("Location: EmailLog.php");
        exit();

    } catch (PDOException $e) {
        // Close the database connection
        $conn_pdo = null;
        // Handle any errors
        echo "Error: " . $e->getMessage();

        // Redirect back to the email log page after deletion
        header("Location: EmailLog.php");
    }
}

else 
{
    // Redirect back to the email log page after deletion
    header("Location: EmailLog.php");
}



