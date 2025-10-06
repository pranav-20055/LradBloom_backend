<?php
require 'config.php';
header("Content-Type: application/json");

$sql = "SELECT org_id, org_name, email, contact_number, created_at FROM organizations";
$result = $conn->query($sql);

$orgs = [];
while ($row = $result->fetch_assoc()) {
    $orgs[] = $row;
}

echo json_encode([
    "status" => "success",
    "message" => "Organizations list",
    "data" => $orgs
]);
?>
