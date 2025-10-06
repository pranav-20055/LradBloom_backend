<?php
require 'config.php';
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => "error", "message" => "Only POST method allowed"]);
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
    WHERE e.liked = TRUE
    GROUP BY p.product_id
    ORDER BY total_likes DESC
    LIMIT 1
";

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    $product = $result->fetch_assoc();
    echo json_encode([
        "status" => "success",
        "message" => "Top liked product across all organizations",
        "data" => $product
    ]);
} else {
    echo json_encode([
        "status" => "success",
        "message" => "No likes found",
        "data" => null
    ]);
}
?>
