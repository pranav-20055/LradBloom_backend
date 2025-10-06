<?php
$mysqli = new mysqli("localhost", "root", "", "crm");

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

if (!isset($_POST['product_id'])) {
    echo json_encode(['success' => false, 'message' => 'Product ID missing']);
    exit;
}

$product_id = intval($_POST['product_id']);

$query = "UPDATE products SET interest_score = interest_score + 1 WHERE id = ?";
$stmt = $mysqli->prepare($query);
$stmt->bind_param("i", $product_id);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Product liked']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to like product']);
}

$stmt->close();
$mysqli->close();
?>
