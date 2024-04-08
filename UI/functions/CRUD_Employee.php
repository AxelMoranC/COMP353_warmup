<?php
// Function to create a new employee
function createEmployee($medicareCard, $facilityID, $job, $startDate, $endDate= null) {
    //require_once 'connection.php';
    global $conn_pdo;

    try {
        $sql = "INSERT INTO Employees 
                (MedicareCard, FacilityID, Job, StartDate, EndDate) 
                VALUES (:medicareCard, :facilityID, :job, :startDate, :endDate)";
        
        $data = $conn_pdo->prepare($sql);

        $data->bindParam(':medicareCard', $medicareCard);
        $data->bindParam(':facilityID', $facilityID);
        $data->bindParam(':job', $job);
        $data->bindParam(':startDate', $startDate);

        // Bind EndDate as NULL if it's not provided
        // Check if endDate is provided or not
        if (!empty($endDate)) {
            $data->bindParam(':endDate', $endDate);
        } else {
            // Bind a NULL value if endDate is empty
            $data->bindValue(':endDate', null, PDO::PARAM_NULL);
        }
        
        
        // Execute the query
        if ($data->execute()) {
            $conn_pdo = null;
            echo "<script>alert('Employee added successfully!'); window.location.href = 'displayEmployee.php';</script>";
        } else {
            $conn_pdo = null;
            echo "<script>alert('Attempting to add employee....'); window.location.href = 'displayEmployee.php';</script>";
        }

    }
    catch(PDOException $e) {
        $conn_pdo = null;
        echo "<script>alert('{$e->getMessage()}'); window.location.href = 'displayEmployee.php';</script>";
    }
}

// Function to update an employee
function updateEmployee($medicareCard, $facilityID, $job, $startDate, $endDate) {
    //require_once 'connection.php';
    global $conn_pdo;

    $sql = "UPDATE Employees 
            SET FacilityID=:facilityID, Job=:job, StartDate=:startDate, EndDate=:endDate 
            WHERE MedicareCard=:medicareCard";
    
    $data = $conn_pdo->prepare($sql);
    $data->bindParam(':medicareCard', $medicareCard);
    $data->bindParam(':facilityID', $facilityID);
    $data->bindParam(':job', $job);
    $data->bindParam(':startDate', $startDate);
    
    // Check if endDate is provided or not
    if (!empty($endDate)) {
        $data->bindParam(':endDate', $endDate);
    } else {
        // Bind a NULL value if endDate is empty
        $data->bindValue(':endDate', null, PDO::PARAM_NULL);
    }
    
    // Execute the query
    if ($data->execute()) {
        $conn_pdo = null;
        return "Employee updated successfully";
    } else {
        $conn_pdo = null;
        return "Failed to update employee";
    }
}

// Function to delete an employee
function deleteEmployee($medicareCard, $startdate, $enddate) {
    global $conn_pdo;

    $sql = "DELETE FROM Employees WHERE MedicareCard=:medicareCard
                                        AND StartDate=:StartDate
                                        AND EndDate=:EndDate";

    $statement = $conn_pdo->prepare($sql);
    $statement->bindParam(':medicareCard', $medicareCard);
    $statement->bindParam(':StartDate', $startdate);
    $statement->bindParam(':EndDate', $enddate);

    // Execute the query
    if ($statement->execute()) {
        $conn_pdo = null;
        return "Employee deleted successfully";
    } else {
        $conn_pdo = null;
        return "Failed to delete employee";
    }
}


// Function to get all facility names and IDs
function getAllFacilityNames() {
    //require_once 'connection.php'; //open $conn_pdo
    global $conn_pdo;
    $names = array();

    try {
        //SQL Query to get names
        $sql = "SELECT FacilityID, FacilityName FROM Facilities";
        $data = $conn_pdo->query($sql);

        // Fetch all results
        while ($row = $data->fetch(PDO::FETCH_ASSOC)) {
            $names[$row['FacilityID']] = $row['FacilityName'];
        }

        // Close the connection
        //$conn_pdo = null;

        return $names;
    } catch (PDOException $e) {
        // Handle errors gracefully
        echo "Error: " . $e->getMessage();
        return array();
    }
}

function getAllPersons() {
    //require_once 'connection.php'; //open $conn_pdo
    global $conn_pdo;

    $names = array();

    try {
        //SQL Query to get names
        $sql = "SELECT MedicareCard, CONCAT(FirstName, ' ', LastName) AS FullName FROM Persons";
        $data = $conn_pdo->query($sql);

        // Fetch all results
        while ($row = $data->fetch(PDO::FETCH_ASSOC)) {
            $names[$row['MedicareCard']] = $row['FullName'];
        }

        return $names;
    } catch (PDOException $e) {
        // Handle errors gracefully
        echo "Error: " . $e->getMessage();
        return array();
    }
}

?>