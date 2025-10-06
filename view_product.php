<?php
header("Content-Type: application/json");
require 'config.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => "error", "message" => "POST required", "db_name" => $db_name]);
    exit();
}

$org_id = $_POST['org_id'] ?? '';

if (!$org_id) {
    echo json_encode(["status" => "error", "message" => "Org ID required", "db_name" => $db_name]);
    exit();
}

$stmt = $conn->prepare("SELECT * FROM products WHERE org_id = ?");
$stmt->bind_param("i", $org_id);
$stmt->execute();
$result = $stmt->get_result();

$products = [];
while ($row = $result->fetch_assoc()) {
    $products[] = $row;
}

echo json_encode([
    "status" => "success",
    "message" => "Products fetched",
    "db_name" => $db_name,
    "data" => $products
]);
?>
