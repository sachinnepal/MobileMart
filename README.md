# MobileMart - E-Commerce Platform for Used Phones & Accessories

A complete e-commerce platform built with PHP, HTML, CSS, and JavaScript for buying and selling used phones and accessories. Features three user roles: Customer, Vendor, and Admin.

## Features

### 🛍️ Customer Features
- Browse and search products
- Filter products by category, condition, and price
- Shopping cart functionality
- Order placement and tracking
- Order history
- Profile management

### 🏪 Vendor Features
- Product listing and management
- Add, edit, and delete products
- Product approval system (admin approval required)
- Sales report and analytics
- View product performance

### 👨‍💼 Admin Features
- User management (customers, vendors, admins)
- Product approval/rejection system
- Order management and status updates
- Category management
- Dashboard with statistics
- View all products and orders

### 🎨 General Features
- Modern, responsive design
- Interactive UI with JavaScript
- Secure authentication system
- Product reviews system
- Search and filter functionality
- Shopping cart with localStorage
- Order tracking
- Multi-role access control

## Installation

### Prerequisites
- PHP 7.4 or higher
- MySQL 5.7 or higher
- Apache/Nginx web server
- phpMyAdmin (optional, for database management)

### Setup Steps

1. **Clone or download the project**
   ```bash
   cd mobilemart
   ```

2. **Create Database**
   - Open phpMyAdmin or MySQL command line
   - Import the `database.sql` file to create the database and tables
   ```bash
   mysql -u root -p < database.sql
   ```
   Or manually:
   - Create a database named `mobilemart`
   - Import the SQL file through phpMyAdmin

3. **Configure Database Connection**
   - Edit `config/db.php` with your database credentials:
   ```php
   $conn = new mysqli("localhost","your_username","your_password","mobilemart");
   ```

4. **Start Local Server**
   ```bash
   php -S localhost:8000
   ```
   Or use XAMPP/WAMP/MAMP and place the project in the `htdocs` or `www` folder.

5. **Access the Website**
   - Open your browser and go to: `http://localhost:8000` or `http://localhost/mobilemart`

## Default Login Credentials

### Admin Account
- **Email:** admin@mobilemart.com
- **Password:** admin123

### Customer/Vendor Accounts
- Register new accounts through the registration page

## Project Structure

```
mobilemart/
├── admin/              # Admin panel pages
│   ├── dashboard.php
│   ├── pending_products.php
│   ├── approve_product.php
│   ├── products.php
│   ├── users.php
│   ├── orders.php
│   ├── order_detail.php
│   └── categories.php
├── customer/           # Customer pages
│   ├── dashboard.php
│   ├── cart.php
│   ├── orders.php
│   ├── order_detail.php
│   └── profile.php
├── vendor/            # Vendor pages
│   ├── dashboard.php
│   ├── add_product.php
│   ├── edit_product.php
│   ├── products.php
│   └── sales.php
├── assets/
│   ├── css/
│   │   └── style.css
│   └── js/
│       └── main.js
├── config/
│   └── db.php         # Database configuration
├── index.php          # Homepage
├── login.php          # Login page
├── register.php       # Registration page
├── logout.php         # Logout handler
├── product_detail.php # Product detail page
├── database.sql       # Database schema
└── README.md          # This file
```

## Usage Guide

### For Customers
1. Register/Login as a customer
2. Browse products on the homepage
3. Use search and filters to find products
4. Click on a product to view details
5. Add products to cart
6. Proceed to checkout
7. Track orders in the dashboard

### For Vendors
1. Register/Login as a vendor
2. Go to vendor dashboard
3. Add products (will be pending admin approval)
4. Manage your products
5. View sales reports

### For Admins
1. Login with admin credentials
2. Review pending products
3. Approve or reject products
4. Manage users, orders, and categories
5. View platform statistics

## Security Notes

⚠️ **Important:** This is a development project. For production use, consider:

- Using prepared statements (already implemented in most places)
- Adding CSRF protection
- Implementing file upload validation for product images
- Using environment variables for database credentials
- Adding rate limiting
- Implementing proper session security
- Using HTTPS
- Adding input sanitization and validation
- Implementing password strength requirements

## Technologies Used

- **Backend:** PHP 7.4+
- **Database:** MySQL
- **Frontend:** HTML5, CSS3, JavaScript (Vanilla)
- **Styling:** Custom CSS with modern design
- **Session Management:** PHP Sessions

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Future Enhancements

- [ ] File upload for product images
- [ ] Payment gateway integration
- [ ] Email notifications
- [ ] Advanced search with filters
- [ ] Product reviews and ratings
- [ ] Wishlist functionality
- [ ] Coupon/discount system
- [ ] Multi-language support
- [ ] Mobile app API
- [ ] Advanced analytics

## License

This project is open source and available for educational purposes.

## Support

For issues or questions, please check the code comments or create an issue in the repository.

---

**Made with ❤️ for MobileMart E-Commerce Platform**

