<?php
require 'config.php';
header("Content-Type: application/json");

$db_name = "crm"; 

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode([
        "status" => "error",
        "message" => "Only POST method allowed",
        
    ]);
    exit();
}

$sql = "
    SELECT 
        o.org_id,
        o.org_name,
        COUNT(pe.id) AS total_units_sold,
        SUM(p.price) AS net_income
    FROM organizations o
    JOIN products p ON o.org_id = p.org_id
    JOIN product_engagement pe ON p.product_id = pe.product_id
    WHERE pe.liked = TRUE
    GROUP BY o.org_id, o.org_name
    ORDER BY net_income DESC
";

$result = $conn->query($sql);
$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode([
    "status" => "success",
    "message" => "Sales and income by organization",
    
    "data" => $data
]);
?>
