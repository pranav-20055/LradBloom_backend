<?php
require 'config.php';
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode([
        "status" => "error",
        "message" => "Only POST method is allowed"
    ]);
    exit();
}

$sql = "SELECT * FROM leads ORDER BY created_at DESC";
$result = $conn->query($sql);

$leads = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $leads[] = $row;
    }

    echo json_encode([
        "status" => "success",
        "message" => "Leads retrieved successfully",
        "data" => $leads
    ]);
} else {
    echo json_encode([
        "status" => "success",
        "message" => "No leads found",
        "data" => []
    ]);
}
?>
