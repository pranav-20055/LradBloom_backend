<?php
require 'config.php';
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => "error", "message" => "Only POST allowed", "db_name" => $db_name]);
    exit();
}

$org_id = $_POST['org_id'] ?? null;

if (!$org_id) {
    echo json_encode(["status" => "error", "message" => "org_id required", "db_name" => $db_name]);
    exit();
}

$sql = "
    SELECT 
        p.product_id,
        p.product_name,
        COUNT(e.id) AS total_likes,
        ROUND(AVG(e.interest_score), 1) AS avg_interest
    FROM product_engagement e
    JOIN products p ON e.product_id = p.product_id
    WHERE e.liked = TRUE AND p.org_id = ?
    GROUP BY p.product_id
    ORDER BY total_likes DESC
    LIMIT 1
";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $org_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $product = $result->fetch_assoc();
    echo json_encode([
        "status" => "success",
        "message" => "Top liked product for organization $org_id",
        "db_name" => $db_name,
        "data" => $product
    ]);
} else {
    echo json_encode([
        "status" => "success",
        "message" => "No likes found for this organization",
        "db_name" => $db_name,
        "data" => null
    ]);
}
?>
