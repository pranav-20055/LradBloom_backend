<?php
header("Content-Type: application/json");
require 'config.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => "error", "message" => "POST required", "db_name" => $db_name]);
    exit();
}

$product_id = $_POST['product_id'] ?? '';
$product_name = $_POST['product_name'] ?? '';
$price = $_POST['price'] ?? '';
$org_id = $_POST['org_id'] ?? '';

if (!$product_id || !$product_name || !$price || !$org_id) {
    echo json_encode(["status" => "error", "message" => "All fields required", "db_name" => $db_name]);
    exit();
}

$stmt = $conn->prepare("INSERT INTO products (product_id, product_name, price, org_id) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssdi", $product_id, $product_name, $price, $org_id);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Product added", "db_name" => $db_name]);
} else {
    echo json_encode(["status" => "error", "message" => $stmt->error, "db_name" => $db_name]);
}
?>
