<?php
include 'config.php'; // database connection

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'] ?? '';
    $new_password = $_POST['new_password'] ?? '';
    $confirm_password = $_POST['confirm_password'] ?? '';

    // Validation
    if (empty($username) || empty($new_password) || empty($confirm_password)) {
        echo json_encode(["status" => "error", "message" => "All fields are required"]);
        exit;
    }

    if ($new_password !== $confirm_password) {
        echo json_encode(["status" => "error", "message" => "Passwords do not match"]);
        exit;
    }

    // Check if username exists
    $stmt = $conn->prepare("SELECT id FROM users WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows === 0) {
        echo json_encode(["status" => "error", "message" => "User not found"]);
        exit;
    }

    // Update password (hash for security)
    $hashed_password = password_hash($new_password, PASSWORD_BCRYPT);
    $update_stmt = $conn->prepare("UPDATE users SET password = ? WHERE username = ?");
    $update_stmt->bind_param("ss", $hashed_password, $username);

    if ($update_stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Password updated successfully"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to update password"]);
    }
}
?>
