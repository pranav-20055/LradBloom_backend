<?php
header("Content-Type: application/json");
require 'config.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => "error", "message" => "POST required", "db_name" => $db_name]);
    exit();
}

$product_id = $_POST['product_id'] ?? '';
$org_id = $_POST['org_id'] ?? '';

if (!$product_id || !$org_id) {
    echo json_encode(["status" => "error", "message" => "Product ID and Org ID required", "db_name" => $db_name]);
    exit();
}

$stmt = $conn->prepare("DELETE FROM products WHERE product_id = ? AND org_id = ?");
$stmt->bind_param("si", $product_id, $org_id);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Product deleted", "db_name" => $db_name]);
} else {
    echo json_encode(["status" => "error", "message" => $stmt->error, "db_name" => $db_name]);
}
?>
