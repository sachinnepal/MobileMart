# MobileMart – Production Ready

## Setup
1. Set environment variables:
KHALTI_PUBLIC_KEY
KHALTI_SECRET_KEY

2. Import database.sql
3. Enable HTTPS
4. Disable display_errors in php.ini

## Payment Flow
Frontend -> Khalti -> verify_khalti.php -> DB -> success/failed page
