<?php
require 'config.php';
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => "error", "message" => "Only POST method allowed", "db_name" => $db_name]);
    exit();
}

$org_id = $_POST['org_id'] ?? '';
$org_name = $_POST['org_name'] ?? '';
$email = $_POST['email'] ?? '';
$contact_number = $_POST['contact_number'] ?? '';

if (!$org_id || !$org_name || !$email || !$contact_number) {
    echo json_encode(["status" => "error", "message" => "All fields required", "db_name" => $db_name]);
    exit();
}

$stmt = $conn->prepare("INSERT INTO organizations (org_id, org_name, email, contact_number) VALUES (?, ?, ?, ?)");
$stmt->bind_param("isss", $org_id, $org_name, $email, $contact_number);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Organization added", "db_name" => $db_name]);
} else {
    echo json_encode(["status" => "error", "message" => $stmt->error, "db_name" => $db_name]);
}
?>
