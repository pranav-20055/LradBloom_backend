<?php
header("Content-Type: application/json");
require_once "db_config.php"; // your DB connection

$response = array();

try {
    // Get total sales
    $totalSalesResult = mysqli_query($conn, "SELECT SUM(price) AS total FROM products");
    $totalSalesRow = mysqli_fetch_assoc($totalSalesResult);
    $response["totalSales"] = (int)$totalSalesRow["total"];

    // Get top 2 leads based on likes or interest score
    $topLeadsResult = mysqli_query($conn, "
        SELECT c.client_name AS clientName, 
               COUNT(l.id) AS interestScore
        FROM likes l
        JOIN clients c ON l.client_id = c.id
        GROUP BY l.client_id
        ORDER BY interestScore DESC
        LIMIT 2
    ");

    $topLeads = array();
    while ($row = mysqli_fetch_assoc($topLeadsResult)) {
        $topLeads[] = array(
            "clientName" => $row["clientName"],
            "interestScore" => (int)$row["interestScore"]
        );
    }

    $response["topLeads"] = $topLeads;

    echo json_encode($response);

} catch (Exception $e) {
    echo json_encode(array("error" => $e->getMessage()));
}

mysqli_close($conn);
?>
