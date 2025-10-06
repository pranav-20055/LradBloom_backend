<?php
session_start();
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *"); // Allow requests from any origin

include 'config.php'; // Ensure this file connects to your DB

$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

if (!$username || !$password) {
    echo json_encode(["success" => false, "message" => "Missing username or password"]);
    exit;
}

$stmt = $conn->prepare("SELECT id, password, role FROM users WHERE username = ?");
$stmt->bind_param("s", $username);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows === 1) {
    $stmt->bind_result($user_id, $db_password, $role);
    $stmt->fetch();

    if ($password === $db_password) { // Compare as plain text (or hash if hashed)
        $_SESSION['user_id'] = $user_id;
        $_SESSION['username'] = $username;
        $_SESSION['role'] = $role;

        echo json_encode([
            "success" => true,
            "message" => "Login successful",
            "role" => $role
        ]);
    } else {
        echo json_encode(["success" => false, "message" => "Incorrect password"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "User not found"]);
}

$stmt->close();
$conn->close();
?>
