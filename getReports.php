<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

$host = "localhost";
$username = "root";
$password = "";
$dbname = "crm";

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    echo json_encode(["error" => "Connection failed: " . $conn->connect_error]);
    exit();
}

// ✅ Updated column name from `sales_amount` to `income`
$sql = "SELECT org_name, income FROM organization_sales";
$result = $conn->query($sql);

$reports = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $reports[] = [
            "organization" => $row["org_name"],
            "sales" => "Sales: $" . number_format($row["income"])
        ];
    }
    echo json_encode($reports);
} else {
    echo json_encode(["message" => "No reports found"]);
}

$conn->close();
?>
