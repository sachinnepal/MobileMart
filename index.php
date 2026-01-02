<?php
session_start();
include 'config/db.php';

// Get featured products
$featuredQuery = "SELECT p.*, u.name as vendor_name, c.name as category_name 
                  FROM products p 
                  LEFT JOIN users u ON p.user_id = u.id 
                  LEFT JOIN categories c ON p.category_id = c.id 
                  WHERE p.status = 'approved' 
                  ORDER BY p.views DESC, p.created_at DESC 
                  LIMIT 12";
$featuredProducts = $conn->query($featuredQuery);

// Get categories
$categories = $conn->query("SELECT * FROM categories ORDER BY name");

// Get user info if logged in
$user = $_SESSION['user'] ?? null;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MobileMart - Buy & Sell Used Phones & Accessories</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <header>
        <div class="header-container">
            <a href="index.php" class="logo">📱 MobileMart</a>
            <nav>
                <a href="index.php">Home</a>
                <a href="index.php#products">Products</a>
                <?php if ($user): ?>
                    <?php if ($user['role'] == 'customer'): ?>
                        <a href="customer/dashboard.php">Dashboard</a>
                        <a href="customer/cart.php">Cart <span id="cart-count" class="badge badge-info" style="display:none;">0</span></a>
                    <?php elseif ($user['role'] == 'vendor'): ?>
                        <a href="vendor/dashboard.php">Vendor Panel</a>
                    <?php elseif ($user['role'] == 'admin'): ?>
                        <a href="admin/dashboard.php">Admin Panel</a>
                    <?php endif; ?>
                    <a href="logout.php">Logout (<?php echo htmlspecialchars($user['name']); ?>)</a>
                <?php else: ?>
                    <a href="login.php">Login</a>
                    <a href="register.php" class="btn btn-primary">Register</a>
                <?php endif; ?>
            </nav>
        </div>
    </header>

    <section class="hero">
        <h1>Welcome to MobileMart</h1>
        <p>Your trusted marketplace for used phones and accessories</p>
        <div class="search-container">
            <input type="text" id="search-input" class="search-bar" placeholder="Search for phones, accessories...">
            <button id="search-btn" class="search-btn">Search</button>
        </div>
    </section>

    <div class="container">
        <section id="products">
            <h2 style="margin-bottom: 1rem;">Featured Products</h2>
            
            <div class="filters">
                <div class="filter-group">
                    <label>Category:</label>
                    <select id="filter-category">
                        <option value="all">All Categories</option>
                        <?php while($cat = $categories->fetch_assoc()): ?>
                            <option value="<?php echo $cat['id']; ?>"><?php echo htmlspecialchars($cat['name']); ?></option>
                        <?php endwhile; ?>
                    </select>
                </div>
                <div class="filter-group">
                    <label>Condition:</label>
                    <select id="filter-condition">
                        <option value="all">All Conditions</option>
                        <option value="new">New</option>
                        <option value="like_new">Like New</option>
                        <option value="good">Good</option>
                        <option value="fair">Fair</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label>Price Range:</label>
                    <input type="number" id="filter-min-price" placeholder="Min $" style="width: 100px;">
                    <input type="number" id="filter-max-price" placeholder="Max $" style="width: 100px;">
                </div>
            </div>

            <div class="products-grid">
                <?php if ($featuredProducts->num_rows > 0): ?>
                    <?php while($product = $featuredProducts->fetch_assoc()): ?>
                        <div class="product-card" 
                             data-category="<?php echo $product['category_id']; ?>"
                             data-condition="<?php echo $product['condition']; ?>"
                             data-price="<?php echo $product['price']; ?>"
                             onclick="window.location.href='product_detail.php?id=<?php echo $product['id']; ?>'">
                            <div class="product-image">
                                <?php if ($product['image']): ?>
                                    <img src="<?php echo htmlspecialchars($product['image']); ?>" alt="<?php echo htmlspecialchars($product['title']); ?>" style="width:100%;height:100%;object-fit:cover;">
                                <?php else: ?>
                                    📱
                                <?php endif; ?>
                            </div>
                            <div class="product-info">
                                <h3 class="product-title"><?php echo htmlspecialchars($product['title']); ?></h3>
                                <div class="product-price">Rs <?php echo number_format($product['price'], 2); ?></div>
                                <div class="product-meta">
                                    <span class="badge badge-info"><?php echo htmlspecialchars($product['category_name'] ?? 'Uncategorized'); ?></span>
                                    <span class="badge badge-success"><?php echo ucfirst(str_replace('_', ' ', $product['condition'])); ?></span>
                                    <br>
                                    <small>By: <?php echo htmlspecialchars($product['vendor_name']); ?></small>
                                </div>
                                <?php if ($user && $user['role'] == 'customer'): ?>
                                    <div class="product-actions">
                                        <form method="POST" action="customer/cart.php" style="display: inline;" onclick="event.stopPropagation();">
                                            <input type="hidden" name="product_id" value="<?php echo $product['id']; ?>">
                                            <input type="hidden" name="quantity" value="1">
                                            <button type="submit" name="add_to_cart" class="btn btn-primary btn-small">Add to Cart</button>
                                        </form>
                                    </div>
                                <?php endif; ?>
                            </div>
                        </div>
                    <?php endwhile; ?>
                <?php else: ?>
                    <div class="empty-state">
                        <div class="empty-state-icon">📦</div>
                        <h3>No products available yet</h3>
                        <p>Check back soon for amazing deals!</p>
                    </div>
                <?php endif; ?>
            </div>
        </section>
    </div>

    <footer style="background: var(--dark); color: white; padding: 2rem; text-align: center; margin-top: 4rem;">
        <p>&copy; 2024 MobileMart. All rights reserved.</p>
    </footer>

    <script src="assets/js/main.js"></script>
</body>
</html>
