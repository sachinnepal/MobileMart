<?php
session_start();
include 'config/db.php';
include 'config/khalti_config.php';

header('Content-Type: application/json');

// Check if user is logged in
if (!isset($_SESSION['user']) || $_SESSION['user']['role'] != 'customer') {
    echo json_encode(["status" => "error", "message" => "User not authenticated"]);
    exit;
}

$data = json_decode(file_get_contents("php://input"), true);

$token = $data['token'] ?? null;
$amount = $data['amount'] ?? null;
$shipping_address = $data['shipping_address'] ?? null;

if (!$token || !$amount) {
    echo json_encode(["status" => "error", "message" => "Missing payment information"]);
    exit;
}

$user = $_SESSION['user'];
$secret_key = defined('KHALTI_SECRET_KEY') ? KHALTI_SECRET_KEY : getenv('KHALTI_SECRET_KEY');

if (!$secret_key) {
    echo json_encode(["status" => "error", "message" => "Khalti secret key not configured"]);
    exit;
}

// Verify payment with Khalti
$args = json_encode([
    "token" => $token,
    "amount" => $amount
]);

$ch = curl_init("https://khalti.com/api/v2/payment/verify/");
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $args);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    "Authorization: Key $secret_key",
    "Content-Type: application/json"
]);

$response = curl_exec($ch);
$status_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$curl_error = curl_error($ch);
curl_close($ch);

if ($status_code != 200) {
    // Try to get error details from response
    $error_data = json_decode($response, true);
    $error_message = "Payment verification failed";
    
    if ($curl_error) {
        $error_message .= " (cURL error: " . $curl_error . ")";
    } elseif ($error_data && isset($error_data['detail'])) {
        $error_message .= ": " . $error_data['detail'];
    } elseif ($error_data && isset($error_data['error_key'])) {
        $error_message .= ": " . $error_data['error_key'];
    } elseif ($response) {
        $error_message .= " (Response: " . substr($response, 0, 200) . ")";
    }
    
    error_log("Khalti verification failed - Status: $status_code, Response: $response");
    echo json_encode(["status" => "error", "message" => $error_message]);
    exit;
}

// Payment verified successfully, now create the order
try {
    // Get cart items
    $stmt = $conn->prepare("SELECT c.*, p.price, p.title FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id = ? AND p.status = 'approved'");
    $stmt->bind_param("i", $user['id']);
    $stmt->execute();
    $cartItems = $stmt->get_result();
    
    if ($cartItems->num_rows == 0) {
        echo json_encode(["status" => "error", "message" => "Cart is empty"]);
        exit;
    }
    
    $total = 0;
    $items = [];
    
    while ($item = $cartItems->fetch_assoc()) {
        $items[] = $item;
        $total += $item['price'] * $item['quantity'];
    }
    
    // Add shipping cost
    $total_with_shipping = $total + 10;
    
    // Convert amount from paisa to dollars for comparison (Khalti sends amount in paisa)
    $amount_in_dollars = $amount / 100;
    
    // Validate amount matches (allow small rounding differences)
    if (abs($amount_in_dollars - $total_with_shipping) > 0.01) {
        echo json_encode(["status" => "error", "message" => "Amount mismatch"]);
        exit;
    }
    
    // Use shipping address from request, fallback to user address
    $final_shipping_address = $shipping_address ?? $user['address'] ?? '';
    
    // Create order
    $payment_method = 'khalti';
    $stmt = $conn->prepare("INSERT INTO orders (user_id, total_amount, shipping_address, payment_method) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("idss", $user['id'], $total_with_shipping, $final_shipping_address, $payment_method);
    
    if (!$stmt->execute()) {
        echo json_encode(["status" => "error", "message" => "Failed to create order"]);
        exit;
    }
    
    $order_id = $conn->insert_id;
    
    // Create order items
    $stmt = $conn->prepare("INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)");
    
    foreach ($items as $item) {
        $stmt->bind_param("iiid", $order_id, $item['product_id'], $item['quantity'], $item['price']);
        $stmt->execute();
    }
    
    // Clear cart
    $stmt = $conn->prepare("DELETE FROM cart WHERE user_id = ?");
    $stmt->bind_param("i", $user['id']);
    $stmt->execute();
    
    echo json_encode([
        "status" => "success",
        "order_id" => $order_id,
        "message" => "Order placed successfully"
    ]);
    
} catch (Exception $e) {
    echo json_encode(["status" => "error", "message" => "Order creation failed: " . $e->getMessage()]);
}
