<?php include 'navbar.php'; ?>


<!DOCTYPE html>
<html>
<head>
    <title>Email Log</title>
    <!-- Include your stylesheet -->
    <link rel="stylesheet" href="Styling/facilities.css">
</head>
<body>
    <h1>Email Log</h1>

    <?php
    require_once 'connection.php';

    // Retrieve email log records from the database
    $query = "SELECT log_id, email_date, sender, receiver, subject_email, 
                    SUBSTRING(body, 1, 100) AS shortEmailBody
              FROM EmailLog
              ORDER BY email_date DESC";
    
    $data = $conn_pdo->query($query);
    
    if ($data) {
        ?>

        <table>
            <tr>
                <th>Email ID</th>
                <th>Date</th>
                <th>Sender Facility ID</th>
                <th>Receiver ID</th>
                <th>Subject</th>
                <th>Body</th>
            </tr>

            <?php
            while ($row = $data->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr>";
                echo "<td>" . $row["log_id"] . "</td>";
                echo "<td>" . $row["email_date"] . "</td>";
                echo "<td>" . $row["sender"] . "</td>";
                echo "<td>" . $row["receiver"] . "</td>";
                echo "<td>" . $row["subject_email"] . "</td>";
                echo "<td>" . $row["shortEmailBody"] . "</td>";
                echo "</tr>";
            }
            ?>

        </table>
    <a href="email.php"><button>Go back</button></a>
        <?php
    } else {
        echo "Error executing query: " . implode(" ", $conn_pdo->errorInfo());
    }
    
    // Close the database connection
    $conn_pdo = null;
    ?>
    
</body>
</html>