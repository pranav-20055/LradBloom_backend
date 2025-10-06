<?php
require 'config.php';
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => "error", "message" => "Only POST allowed", "db_name" => $db_name]);
    exit();
}

$org_id = $_POST['org_id'] ?? '';

if (!$org_id) {
    echo json_encode(["status" => "error", "message" => "org_id is required", "db_name" => $db_name]);
    exit();
}

$stmt = $conn->prepare("DELETE FROM organizations WHERE org_id = ?");
$stmt->bind_param("i", $org_id);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Organization deleted", "db_name" => $db_name]);
} else {
    echo json_encode(["status" => "error", "message" => $stmt->error, "db_name" => $db_name]);
}
?>
