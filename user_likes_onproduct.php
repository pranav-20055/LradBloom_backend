<?php
require 'config.php';
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => "error", "message" => "Only POST allowed"]);
    exit();
}

$user_id = $_POST['user_id'] ?? '';
$product_id = $_POST['product_id'] ?? '';
$liked = $_POST['liked'] ?? '1'; 

if (!$user_id || !$product_id) {
    echo json_encode(["status" => "error", "message" => "user_id and product_id required"]);
    exit();
}

$stmt = $conn->prepare("
    INSERT INTO product_engagement (user_id, product_id, liked)
    VALUES (?, ?, ?)
    ON DUPLICATE KEY UPDATE liked = VALUES(liked)
");
$stmt->bind_param("isi", $user_id, $product_id, $liked);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Like updated"]);
} else {
    echo json_encode(["status" => "error", "message" => $stmt->error]);
}
?>
