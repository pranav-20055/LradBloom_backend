<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

// ✅ Define database credentials here
$host = "localhost";
$dbname = "crm"; // replace with your database name
$username = "root"; // default XAMPP username
$password = "";     // default XAMPP has empty password

// ✅ Connect to MySQL
$conn = new mysqli($host, $username, $password, $dbname);

// ✅ Check connection
if ($conn->connect_error) {
    echo json_encode(["error" => "Connection failed: " . $conn->connect_error]);
    exit();
}

// ✅ SQL Query
$sql = "SELECT org_name, contact_number, email FROM organizations";
$result = $conn->query($sql);

// ✅ Format and return data
$contacts = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $contacts[] = [
            "orgName" => $row["org_name"],
            "contactNumber" => $row["contact_number"],
            "email" => $row["email"]
        ];
    }
    echo json_encode($contacts);
} else {
    echo json_encode(["message" => "No contacts found"]);
}

$conn->close();
?>
