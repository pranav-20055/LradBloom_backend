<?php
header('Content-Type: application/json');
include 'config.php'; // Make sure this file exists and sets up $conn

$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

if (!$username || !$password) {
    echo json_encode(["status" => "error", "message" => "Missing username or password"]);
    exit;
}

// Step 2: Hash the password before storing
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Step 3: Insert into the database
$stmt = $conn->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
$stmt->bind_param("ss", $username, $hashed_password);

try {
    $stmt->execute();
    echo json_encode(["status" => "success", "message" => "User registered successfully"]);
} catch (mysqli_sql_exception $e) {
    // Handles duplicate username or other DB errors
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
}

$stmt->close();
$conn->close();
?>
