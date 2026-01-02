<?php
session_start();
include 'config/db.php';

$product_id = intval($_GET['id'] ?? 0);

// Get product details
$productQuery = "SELECT p.*, u.name as vendor_name, c.name as category_name 
                 FROM products p 
                 LEFT JOIN users u ON p.user_id = u.id 
                 LEFT JOIN categories c ON p.category_id = c.id 
                 WHERE p.id = ? AND p.status = 'approved'";
$stmt = $conn->prepare($productQuery);
$stmt->bind_param("i", $product_id);
$stmt->execute();
$product = $stmt->get_result()->fetch_assoc();

if (!$product) {
    header("Location: index.php");
    exit();
}

// Increment views
$conn->query("UPDATE products SET views = views + 1 WHERE id = $product_id");

// Get user info
$user = $_SESSION['user'] ?? null;

// Get reviews
$reviews = $conn->query("SELECT r.*, u.name as reviewer_name 
                         FROM reviews r 
                         JOIN users u ON r.user_id = u.id 
                         WHERE r.product_id = $product_id 
                         ORDER BY r.created_at DESC");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($product['title']); ?> - MobileMart</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <header>
        <div class="header-container">
            <a href="index.php" class="logo">📱 MobileMart</a>
            <nav>
                <a href="index.php">Home</a>
                <?php if ($user): ?>
                    <?php if ($user['role'] == 'customer'): ?>
                        <a href="customer/dashboard.php">Dashboard</a>
                        <a href="customer/cart.php">Cart <span id="cart-count" class="badge badge-info" style="display:none;">0</span></a>
                    <?php elseif ($user['role'] == 'vendor'): ?>
                        <a href="vendor/dashboard.php">Vendor Panel</a>
                    <?php elseif ($user['role'] == 'admin'): ?>
                        <a href="admin/dashboard.php">Admin Panel</a>
                    <?php endif; ?>
                    <a href="logout.php">Logout</a>
                <?php else: ?>
                    <a href="login.php">Login</a>
                    <a href="register.php" class="btn btn-primary">Register</a>
                <?php endif; ?>
            </nav>
        </div>
    </header>

    <div class="container">
        <a href="index.php" style="color: var(--primary); text-decoration: none; margin-bottom: 1rem; display: inline-block;">← Back to Products</a>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 3rem; margin-top: 2rem;">
            <div>
                <div class="product-image" style="height: 400px; border-radius: 12px; overflow: hidden;">
                    <?php if ($product['image']): ?>
                        <img src="<?php echo htmlspecialchars($product['image']); ?>" alt="<?php echo htmlspecialchars($product['title']); ?>" style="width:100%;height:100%;object-fit:cover;">
                    <?php else: ?>
                        <div style="width:100%;height:100%;display:flex;align-items:center;justify-content:center;font-size:6rem;">📱</div>
                    <?php endif; ?>
                </div>
            </div>

            <div>
                <h1 style="margin-bottom: 1rem;"><?php echo htmlspecialchars($product['title']); ?></h1>
                
                <div style="margin-bottom: 1rem;">
                    <span class="badge badge-info"><?php echo htmlspecialchars($product['category_name'] ?? 'Uncategorized'); ?></span>
                    <span class="badge badge-success"><?php echo ucfirst(str_replace('_', ' ', $product['condition'])); ?></span>
                </div>

                <div style="font-size: 2.5rem; font-weight: bold; color: var(--primary); margin-bottom: 1.5rem;">
                    Rs <?php echo number_format($product['price'], 2); ?>
                </div>

                <div style="margin-bottom: 1.5rem;">
                    <p><strong>Vendor:</strong> <?php echo htmlspecialchars($product['vendor_name']); ?></p>
                    <?php if ($product['brand']): ?>
                        <p><strong>Brand:</strong> <?php echo htmlspecialchars($product['brand']); ?></p>
                    <?php endif; ?>
                    <?php if ($product['model']): ?>
                        <p><strong>Model:</strong> <?php echo htmlspecialchars($product['model']); ?></p>
                    <?php endif; ?>
                    <p><strong>Stock:</strong> <?php echo $product['stock']; ?> available</p>
                    <p><strong>Views:</strong> <?php echo $product['views']; ?></p>
                </div>

                <div style="margin-bottom: 2rem;">
                    <h3>Description</h3>
                    <p style="color: var(--gray); line-height: 1.8;"><?php echo nl2br(htmlspecialchars($product['description'])); ?></p>
                </div>

                <?php if ($user && $user['role'] == 'customer'): ?>
                    <form method="POST" action="customer/cart.php" style="margin-bottom: 2rem;">
                        <input type="hidden" name="product_id" value="<?php echo $product['id']; ?>">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit" name="add_to_cart" class="btn btn-primary" style="width: 100%; padding: 1rem; font-size: 1.1rem;">
                            Add to Cart
                        </button>
                    </form>
                <?php elseif (!$user): ?>
                    <a href="login.php" class="btn btn-primary" style="width: 100%; padding: 1rem; font-size: 1.1rem; text-align: center; display: block;">
                        Login to Purchase
                    </a>
                <?php endif; ?>
            </div>
        </div>

        <div style="margin-top: 3rem;">
            <h2>Reviews</h2>
            <?php if ($reviews->num_rows > 0): ?>
                <?php while($review = $reviews->fetch_assoc()): ?>
                    <div style="background: white; padding: 1.5rem; border-radius: 12px; margin-bottom: 1rem; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                            <strong><?php echo htmlspecialchars($review['reviewer_name']); ?></strong>
                            <div>
                                <?php for($i = 1; $i <= 5; $i++): ?>
                                    <span style="color: <?php echo $i <= $review['rating'] ? '#fbbf24' : '#e5e7eb'; ?>;">★</span>
                                <?php endfor; ?>
                            </div>
                        </div>
                        <p style="color: var(--gray);"><?php echo htmlspecialchars($review['comment']); ?></p>
                        <small style="color: var(--gray);"><?php echo date('M d, Y', strtotime($review['created_at'])); ?></small>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <div class="empty-state">
                    <p>No reviews yet. Be the first to review!</p>
                </div>
            <?php endif; ?>
        </div>
    </div>

    <script src="assets/js/main.js"></script>
</body>
</html>

