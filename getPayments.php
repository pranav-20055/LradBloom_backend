<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

// Database connection setup
$host = "localhost";
$username = "root";
$password = "";
$dbname = "crm";

// Create connection
$conn = new mysqli($host, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    echo json_encode(["error" => "Connection failed: " . $conn->connect_error]);
    exit();
}

// Corrected query
$sql = "SELECT org_name, income FROM organization_sales";
$result = $conn->query($sql);

$transactions = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $transactions[] = [
            "username" => $row["org_name"],
            "amount" => "-$" . number_format($row["income"], 2)
        ];
    }
    echo json_encode($transactions);
} else {
    echo json_encode(["message" => "No payments found"]);
}

$conn->close();
?>
