# MobileMart - Setup Guide

## Step-by-Step Installation Instructions

### Prerequisites
Before starting, make sure you have:
- ✅ PHP 7.4 or higher installed
- ✅ MySQL/MariaDB installed
- ✅ Apache web server (or use PHP built-in server)
- ✅ phpMyAdmin (optional, but recommended)

### Method 1: Using XAMPP (Recommended for Beginners)

#### Step 1: Install XAMPP
1. Download XAMPP from https://www.apachefriends.org/
2. Install XAMPP to `C:\xampp` (Windows) or `/Applications/XAMPP` (Mac)
3. Start Apache and MySQL from XAMPP Control Panel

#### Step 2: Setup Project
1. Copy the `mobilemart` folder to:
   - Windows: `C:\xampp\htdocs\mobilemart`
   - Mac: `/Applications/XAMPP/htdocs/mobilemart`
   - Linux: `/opt/lampp/htdocs/mobilemart`

#### Step 3: Create Database
1. Open phpMyAdmin: http://localhost/phpmyadmin
2. Click "New" to create a new database
3. Name it: `mobilemart`
4. Click "Import" tab
5. Choose file: `database.sql` (from your mobilemart folder)
6. Click "Go" to import

#### Step 4: Configure Database Connection
1. Open `config/db.php` in a text editor
2. Update the connection if needed:
   ```php
   $conn = new mysqli("localhost","root","","mobilemart");
   ```
   - Default XAMPP settings: username=`root`, password=`` (empty)
   - If you changed MySQL password, update it here

#### Step 5: Access Website
Open your browser and go to:
```
http://localhost/mobilemart
```

---

### Method 2: Using PHP Built-in Server (No XAMPP)

#### Step 1: Install PHP
- Windows: Download from https://windows.php.net/download/
- Mac: Usually pre-installed, or use Homebrew: `brew install php`
- Linux: `sudo apt-get install php mysql-server` (Ubuntu/Debian)

#### Step 2: Install MySQL
- Windows: Download MySQL from https://dev.mysql.com/downloads/
- Mac: `brew install mysql` or download installer
- Linux: `sudo apt-get install mysql-server`

#### Step 3: Setup Database
1. Open MySQL command line or MySQL Workbench
2. Create database:
   ```sql
   CREATE DATABASE mobilemart;
   ```
3. Import the schema:
   ```bash
   mysql -u root -p mobilemart < database.sql
   ```
   Or manually:
   - Open `database.sql` file
   - Copy all SQL commands
   - Paste and execute in MySQL

#### Step 4: Configure Database
1. Edit `config/db.php`:
   ```php
   $conn = new mysqli("localhost","your_username","your_password","mobilemart");
   ```
   Replace `your_username` and `your_password` with your MySQL credentials

#### Step 5: Start PHP Server
1. Open terminal/command prompt
2. Navigate to project folder:
   ```bash
   cd path/to/mobilemart
   ```
3. Start PHP server:
   ```bash
   php -S localhost:8000
   ```

#### Step 6: Access Website
Open browser and go to:
```
http://localhost:8000
```

---

### Method 3: Using WAMP (Windows)

#### Step 1: Install WAMP
1. Download from https://www.wampserver.com/
2. Install and start WAMP Server

#### Step 2: Setup Project
1. Copy `mobilemart` folder to: `C:\wamp64\www\mobilemart`

#### Step 3: Create Database
1. Open phpMyAdmin: http://localhost/phpmyadmin
2. Create database `mobilemart`
3. Import `database.sql`

#### Step 4: Configure & Access
1. Edit `config/db.php` (usually root with empty password)
2. Access: http://localhost/mobilemart

---

### Method 4: Using MAMP (Mac)

#### Step 1: Install MAMP
1. Download from https://www.mamp.info/
2. Install and start MAMP

#### Step 2: Setup Project
1. Copy `mobilemart` folder to: `/Applications/MAMP/htdocs/mobilemart`

#### Step 3: Create Database
1. Open phpMyAdmin: http://localhost:8888/phpMyAdmin
2. Create database `mobilemart`
3. Import `database.sql`

#### Step 4: Configure & Access
1. Edit `config/db.php`:
   ```php
   $conn = new mysqli("localhost:8889","root","root","mobilemart");
   ```
   (MAMP default port is 8889)
2. Access: http://localhost:8888/mobilemart

---

## Default Login Credentials

### Admin Account
- **Email:** admin@mobilemart.com
- **Password:** admin123

### Create New Accounts
- Go to: http://localhost/mobilemart/register.php
- Choose role: Customer or Vendor
- Register and login

---

## Troubleshooting

### Database Connection Error
**Error:** "DB Error" or "Connection failed"

**Solution:**
1. Check MySQL is running (XAMPP/WAMP/MAMP control panel)
2. Verify database name is `mobilemart`
3. Check username/password in `config/db.php`
4. Make sure database exists and tables are imported

### Page Not Found (404)
**Solution:**
1. Check file path is correct
2. Make sure Apache is running
3. Check URL is correct (case-sensitive on Linux/Mac)
4. Try: http://localhost/mobilemart/index.php

### PHP Errors
**Solution:**
1. Check PHP version: `php -v` (need 7.4+)
2. Enable error display in `config/db.php` temporarily:
   ```php
   ini_set('display_errors', 1);
   error_reporting(E_ALL);
   ```

### Permission Denied
**Solution:**
- Windows: Run as Administrator
- Mac/Linux: Check folder permissions:
  ```bash
  chmod -R 755 mobilemart
  ```

### Images Not Showing
**Solution:**
- Product images use URLs (for demo)
- In production, implement file upload
- For now, use image URLs like: https://via.placeholder.com/300

---

## Quick Test Checklist

✅ Database imported successfully
✅ Can access http://localhost/mobilemart
✅ Can see homepage with products
✅ Can register new account
✅ Can login with admin account
✅ Admin can see dashboard
✅ Vendor can add products
✅ Customer can view products

---

## Next Steps After Setup

1. **Test Admin Login:**
   - Login: admin@mobilemart.com / admin123
   - Go to Admin Dashboard
   - Check pending products

2. **Register as Vendor:**
   - Register new vendor account
   - Add products
   - Wait for admin approval

3. **Register as Customer:**
   - Register customer account
   - Browse products
   - Add to cart
   - Place order

4. **Customize:**
   - Edit `assets/css/style.css` for styling
   - Modify product categories in admin panel
   - Add your own products

---

## Production Deployment Notes

⚠️ **For Production Use:**
- Change default admin password
- Use environment variables for database credentials
- Enable HTTPS
- Implement file upload for product images
- Add CSRF protection
- Use prepared statements (already implemented)
- Set proper file permissions
- Disable error display
- Use strong passwords

---

## Support

If you encounter issues:
1. Check error messages in browser console (F12)
2. Check PHP error logs
3. Verify database connection
4. Ensure all files are uploaded correctly
5. Check file permissions

---

**Happy Coding! 🚀**

