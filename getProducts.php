<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

// ✅ Database connection
$host = "localhost";
$dbname = "crm";         // Update if needed
$username = "root";      // Default for XAMPP
$password = "";          // Default for XAMPP (empty)

// Connect to MySQL
$conn = new mysqli($host, $username, $password, $dbname);

// Connection check
if ($conn->connect_error) {
    echo json_encode(["error" => "Connection failed: " . $conn->connect_error]);
    exit();
}

// ✅ Fetch products from table
$sql = "SELECT product_id, product_name, price FROM products";
$result = $conn->query($sql);

$products = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $products[] = [
            "productId" => $row["product_id"],
            "productName" => $row["product_name"],
            "price" => $row["price"]
        ];
    }
    echo json_encode($products);
} else {
    echo json_encode(["message" => "No products found"]);
}

$conn->close();
?>
