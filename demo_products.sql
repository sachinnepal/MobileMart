-- Demo Products for MobileMart
-- Run this SQL script to add demo products to your database
-- Make sure you have at least one vendor user in the database
-- Category IDs: 1=Smartphones, 2=Phone Accessories, 3=Phone Cases, 4=Chargers, 5=Headphones, 6=Screen Protectors, 7=Batteries, 8=Other

USE mobilemart;

-- Get the first vendor user_id (or admin if no vendor exists)
SET @vendor_id = (SELECT id FROM users WHERE role = 'vendor' LIMIT 1);
SET @vendor_id = IFNULL(@vendor_id, 1); -- Use admin if no vendor exists

-- Insert Demo Products
INSERT INTO products (user_id, title, description, price, category_id, `condition`, brand, model, image, stock, status) VALUES

-- Smartphones (category_id = 1)
(@vendor_id, 'iPhone 13 Pro Max 256GB', 'Excellent condition iPhone 13 Pro Max with 256GB storage. Minor scratches on screen, all functions working perfectly. Comes with original box and charger.', 85000.00, 1, 'like_new', 'Apple', 'iPhone 13 Pro Max', 'https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?w=400', 2, 'approved'),

(@vendor_id, 'Samsung Galaxy S21 Ultra 512GB', 'Like new Samsung Galaxy S21 Ultra with 512GB storage. No scratches, perfect condition. Includes S Pen, original box, and all accessories.', 75000.00, 1, 'like_new', 'Samsung', 'Galaxy S21 Ultra', 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400', 1, 'approved'),

(@vendor_id, 'OnePlus 9 Pro 128GB', 'Good condition OnePlus 9 Pro. Minor wear on edges, screen is perfect. Fast charging works great. No box included.', 45000.00, 1, 'good', 'OnePlus', 'OnePlus 9 Pro', 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400', 3, 'approved'),

(@vendor_id, 'Xiaomi Mi 11 256GB', 'Fair condition Xiaomi Mi 11. Screen has minor scratches but fully functional. Battery health at 85%. Great value for money.', 35000.00, 1, 'fair', 'Xiaomi', 'Mi 11', 'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=400', 2, 'approved'),

(@vendor_id, 'iPhone 12 128GB', 'Good condition iPhone 12. Some scratches on back, screen is perfect. All functions working. Original charger included.', 55000.00, 1, 'good', 'Apple', 'iPhone 12', 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400', 4, 'approved'),

(@vendor_id, 'Samsung Galaxy A52 5G 128GB', 'Like new Samsung Galaxy A52 5G. Barely used, perfect condition. Great camera and battery life. Original box included.', 32000.00, 1, 'like_new', 'Samsung', 'Galaxy A52 5G', 'https://images.unsplash.com/photo-1601972602236-8c23525d7545?w=400', 5, 'approved'),

(@vendor_id, 'Google Pixel 6 128GB', 'Excellent condition Google Pixel 6. No scratches, perfect screen. Outstanding camera quality. Original box and charger.', 48000.00, 1, 'like_new', 'Google', 'Pixel 6', 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400', 2, 'approved'),

(@vendor_id, 'OPPO Find X3 Pro 256GB', 'Good condition OPPO Find X3 Pro. Minor wear on corners, screen perfect. Fast charging works great. No box.', 42000.00, 1, 'good', 'OPPO', 'Find X3 Pro', 'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=400', 3, 'approved'),

(@vendor_id, 'iPhone SE 2022 128GB', 'Brand new iPhone SE 2022. Still in box, never used. Perfect for budget iPhone users. Sealed package.', 38000.00, 1, 'new', 'Apple', 'iPhone SE 2022', 'https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?w=400', 6, 'approved'),

(@vendor_id, 'Realme GT 5G 256GB', 'Fair condition Realme GT 5G. Screen has minor scratches, functions all work. Great performance for gaming. Battery health 80%.', 28000.00, 1, 'fair', 'Realme', 'GT 5G', 'https://images.unsplash.com/photo-1601972602236-8c23525d7545?w=400', 4, 'approved'),

-- Phone Cases (category_id = 3)
(@vendor_id, 'iPhone 13 Pro Clear Case', 'Premium clear protective case for iPhone 13 Pro. Shockproof and scratch-resistant. Maintains phone aesthetics while providing protection.', 1500.00, 3, 'new', 'Generic', 'Clear Case iPhone 13 Pro', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 20, 'approved'),

(@vendor_id, 'Samsung Galaxy S21 Silicone Case', 'Soft silicone case for Galaxy S21. Comfortable grip and excellent protection. Available in multiple colors. Brand new.', 1200.00, 3, 'new', 'Generic', 'Silicone Case S21', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 25, 'approved'),

(@vendor_id, 'Leather Case for iPhone 12', 'Genuine leather case for iPhone 12. Premium quality with card slots. Patina will develop beautifully over time. New condition.', 2500.00, 3, 'new', 'Generic', 'Leather Case iPhone 12', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 15, 'approved'),

(@vendor_id, 'Rugged Armor Case Universal', 'Heavy-duty rugged case for most smartphones. Military-grade protection with built-in screen protector. Shockproof and waterproof.', 1800.00, 3, 'new', 'Generic', 'Rugged Armor Case', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 30, 'approved'),

(@vendor_id, 'Wallet Case with Card Holder', 'Multi-functional wallet case with card slots and cash pocket. Stand function for viewing. Fits most 6-6.5 inch phones. Like new.', 2200.00, 3, 'like_new', 'Generic', 'Wallet Case Universal', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 18, 'approved'),

-- Chargers (category_id = 4)
(@vendor_id, 'Fast Charger 25W USB-C', 'Samsung 25W fast charger with USB-C cable. Quick charge compatible. Original and unused. Perfect for fast charging needs.', 1500.00, 4, 'new', 'Samsung', '25W Fast Charger', 'https://images.unsplash.com/photo-1586816879360-004f5e0e8f23?w=400', 40, 'approved'),

(@vendor_id, 'iPhone Lightning Cable 2m', 'Original Apple Lightning cable 2 meters long. Brand new, sealed package. Compatible with all iPhone models with Lightning port.', 1200.00, 4, 'new', 'Apple', 'Lightning Cable 2m', 'https://images.unsplash.com/photo-1586816879360-004f5e0e8f23?w=400', 50, 'approved'),

(@vendor_id, 'Wireless Charging Pad 15W', 'Fast wireless charging pad 15W output. Works with Qi-compatible phones. LED indicator. Sleek design. Brand new.', 1800.00, 4, 'new', 'Generic', 'Wireless Charger 15W', 'https://images.unsplash.com/photo-1586816879360-004f5e0e8f23?w=400', 35, 'approved'),

(@vendor_id, 'Car Charger Dual Port 3.4A', 'Dual USB car charger with 3.4A total output. Fast charging for two devices simultaneously. LED indicators. Good condition.', 800.00, 4, 'good', 'Generic', 'Car Charger Dual', 'https://images.unsplash.com/photo-1586816879360-004f5e0e8f23?w=400', 28, 'approved'),

(@vendor_id, 'Power Bank 20000mAh Fast Charge', 'High capacity 20000mAh power bank with fast charging. Can charge iPhone 6-7 times. USB-C and USB-A ports. LED battery indicator. Like new.', 3500.00, 4, 'like_new', 'Generic', 'Power Bank 20000mAh', 'https://images.unsplash.com/photo-1609091839311-d5365f9ff1c8?w=400', 22, 'approved'),

(@vendor_id, 'USB-C to USB-C Cable 1.5m', 'Premium USB-C to USB-C cable 1.5 meters. Supports fast charging and data transfer. Durable braided design. New condition.', 900.00, 4, 'new', 'Generic', 'USB-C Cable 1.5m', 'https://images.unsplash.com/photo-1586816879360-004f5e0e8f23?w=400', 45, 'approved'),

-- Headphones (category_id = 5)
(@vendor_id, 'AirPods Pro 2nd Generation', 'Apple AirPods Pro 2nd gen with active noise cancellation. Excellent sound quality. Like new condition with original case and box.', 22000.00, 5, 'like_new', 'Apple', 'AirPods Pro 2', 'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb?w=400', 8, 'approved'),

(@vendor_id, 'Sony WH-1000XM4 Headphones', 'Premium noise-cancelling headphones. Excellent sound quality and battery life. Good condition with minor wear on headband. All functions perfect.', 28000.00, 5, 'good', 'Sony', 'WH-1000XM4', 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400', 5, 'approved'),

(@vendor_id, 'Samsung Galaxy Buds Pro', 'Samsung Galaxy Buds Pro wireless earbuds. Active noise cancellation and great sound. Like new condition with charging case. Original box.', 15000.00, 5, 'like_new', 'Samsung', 'Galaxy Buds Pro', 'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb?w=400', 12, 'approved'),

(@vendor_id, 'JBL Tune 750BTNC Headphones', 'JBL wireless headphones with noise cancellation. Good sound quality and comfort. Fair condition with some wear but fully functional.', 4500.00, 5, 'fair', 'JBL', 'Tune 750BTNC', 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400', 15, 'approved'),

(@vendor_id, 'OnePlus Buds Z Wireless', 'OnePlus Buds Z wireless earbuds. Good sound and battery life. Comfortable fit. Like new condition with charging case.', 3500.00, 5, 'like_new', 'OnePlus', 'Buds Z', 'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb?w=400', 18, 'approved'),

(@vendor_id, 'AirPods 3rd Generation', 'Apple AirPods 3rd gen with spatial audio. Excellent condition, barely used. Original charging case and box included. Perfect working condition.', 18000.00, 5, 'like_new', 'Apple', 'AirPods 3', 'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb?w=400', 10, 'approved'),

-- Screen Protectors (category_id = 6)
(@vendor_id, 'Tempered Glass iPhone 13 Pro Max', 'Premium tempered glass screen protector for iPhone 13 Pro Max. 9H hardness, anti-fingerprint, bubble-free installation. Pack of 2. Brand new.', 1500.00, 6, 'new', 'Generic', 'Tempered Glass iPhone 13PM', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 50, 'approved'),

(@vendor_id, 'Samsung Galaxy S21 Screen Protector', 'High-quality screen protector for Galaxy S21. Full coverage, anti-glare, easy installation. Pack of 3. New condition.', 1200.00, 6, 'new', 'Generic', 'Screen Protector S21', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 60, 'approved'),

(@vendor_id, 'Universal Screen Protector 6.5 inch', 'Universal screen protector for phones up to 6.5 inches. Flexible film with self-healing properties. Pack of 5. New.', 800.00, 6, 'new', 'Generic', 'Universal Screen Protector', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 80, 'approved'),

(@vendor_id, 'Privacy Screen Protector iPhone 12', 'Privacy screen protector for iPhone 12. Prevents side-viewing, maintains screen clarity. Easy installation kit included. Brand new.', 1800.00, 6, 'new', 'Generic', 'Privacy Protector iPhone 12', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 35, 'approved'),

(@vendor_id, 'Blue Light Filter Screen Protector', 'Blue light filtering screen protector for eye protection. Reduces eye strain during long usage. Universal fit for 6-6.7 inch phones. Pack of 2.', 1400.00, 6, 'new', 'Generic', 'Blue Light Filter', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 45, 'approved'),

-- Phone Accessories (category_id = 2)
(@vendor_id, 'Phone Ring Stand Grip', 'Multi-functional phone ring stand. Can be used as grip, stand, and car mount. Rotating 360 degrees. Strong adhesive. New condition.', 600.00, 2, 'new', 'Generic', 'Ring Stand Grip', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 100, 'approved'),

(@vendor_id, 'Car Mount Magnetic Phone Holder', 'Strong magnetic car mount for phones. Works with magnetic case or metal plate. 360-degree rotation. Easy installation. New.', 1500.00, 2, 'new', 'Generic', 'Car Mount Magnetic', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 40, 'approved'),

(@vendor_id, 'Selfie Stick with Tripod', 'Extendable selfie stick with detachable tripod. Bluetooth remote included. Compatible with all smartphones. Good condition.', 1800.00, 2, 'good', 'Generic', 'Selfie Stick Tripod', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 25, 'approved'),

(@vendor_id, 'Phone Lens Kit Wide Angle Macro', 'Professional phone lens kit with wide angle and macro lenses. Clip-on design works with all phones. Excellent for photography. New.', 2500.00, 2, 'new', 'Generic', 'Lens Kit', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 30, 'approved'),

(@vendor_id, 'Phone Cooling Fan for Gaming', 'USB-powered cooling fan for phones. Prevents overheating during gaming or charging. Adjustable speed. Good condition.', 1200.00, 2, 'good', 'Generic', 'Cooling Fan', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 35, 'approved'),

(@vendor_id, 'Phone Stylus Pen Universal', 'Universal stylus pen for touchscreen phones. Precision tip, works on all touchscreens. Good for drawing and note-taking. New.', 800.00, 2, 'new', 'Generic', 'Stylus Pen', 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400', 55, 'approved'),

-- Batteries (category_id = 7)
(@vendor_id, 'iPhone Battery Replacement Kit', 'Original quality iPhone battery replacement kit. Includes battery, tools, and instructions. For iPhone 11, 12, 13 series. Brand new.', 4500.00, 7, 'new', 'Generic', 'iPhone Battery Kit', 'https://images.unsplash.com/photo-1609091839311-d5365f9ff1c8?w=400', 20, 'approved'),

(@vendor_id, 'Samsung Galaxy Battery Pack', 'High-capacity battery pack for Samsung Galaxy phones. Original quality, long-lasting. Includes installation tools. New condition.', 3500.00, 7, 'new', 'Generic', 'Samsung Battery Pack', 'https://images.unsplash.com/photo-1609091839311-d5365f9ff1c8?w=400', 25, 'approved'),

(@vendor_id, 'Universal Phone Battery 5000mAh', 'High-capacity universal phone battery. Compatible with many phone models. Extended battery life. Good condition.', 2800.00, 7, 'good', 'Generic', 'Universal Battery 5000mAh', 'https://images.unsplash.com/photo-1609091839311-d5365f9ff1c8?w=400', 30, 'approved'),

-- More Smartphones
(@vendor_id, 'Samsung Galaxy Note 20 Ultra 256GB', 'Excellent condition Note 20 Ultra with S Pen. Large beautiful screen, great camera. Minor scratches on back, screen perfect. Original box.', 60000.00, 1, 'like_new', 'Samsung', 'Galaxy Note 20 Ultra', 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400', 2, 'approved'),

(@vendor_id, 'iPhone 11 Pro 256GB', 'Good condition iPhone 11 Pro. Some scratches on body, screen is perfect. All cameras working great. Battery health 88%. Original charger.', 52000.00, 1, 'good', 'Apple', 'iPhone 11 Pro', 'https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?w=400', 3, 'approved'),

(@vendor_id, 'Xiaomi Redmi Note 11 Pro 128GB', 'Like new Redmi Note 11 Pro. Great value phone with excellent camera. Perfect condition, barely used. Original box and charger included.', 25000.00, 1, 'like_new', 'Xiaomi', 'Redmi Note 11 Pro', 'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=400', 6, 'approved'),

(@vendor_id, 'OnePlus 10 Pro 256GB', 'Excellent condition OnePlus 10 Pro. No scratches, perfect screen. Fast charging works perfectly. Original box and charger included.', 55000.00, 1, 'like_new', 'OnePlus', 'OnePlus 10 Pro', 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400', 2, 'approved'),

(@vendor_id, 'Samsung Galaxy Z Flip 3 256GB', 'Good condition Galaxy Z Flip 3. Unique foldable design. Minor wear on hinge (normal for foldables). Screen perfect. Original box.', 65000.00, 1, 'good', 'Samsung', 'Galaxy Z Flip 3', 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400', 1, 'approved'),

(@vendor_id, 'Vivo X70 Pro 256GB', 'Like new Vivo X70 Pro. Excellent camera system with gimbal stabilization. Perfect condition, barely used. Original box and accessories.', 48000.00, 1, 'like_new', 'Vivo', 'X70 Pro', 'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=400', 3, 'approved'),

(@vendor_id, 'Motorola Edge 30 Pro 128GB', 'Good condition Motorola Edge 30 Pro. Great performance and display. Some scratches on back, screen perfect. Fast charging works great.', 38000.00, 1, 'good', 'Motorola', 'Edge 30 Pro', 'https://images.unsplash.com/photo-1601972602236-8c23525d7545?w=400', 4, 'approved'),

(@vendor_id, 'Nothing Phone (1) 128GB', 'Fair condition Nothing Phone (1). Unique transparent design with glyph interface. Some scratches, screen perfect. All functions working.', 35000.00, 1, 'fair', 'Nothing', 'Phone (1)', 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400', 2, 'approved'),

(@vendor_id, 'iPhone XS Max 256GB', 'Fair condition iPhone XS Max. Older model but still great performance. Screen has minor scratches, all functions work. Battery health 78%.', 35000.00, 1, 'fair', 'Apple', 'iPhone XS Max', 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400', 5, 'approved'),

(@vendor_id, 'Samsung Galaxy A73 5G 128GB', 'Brand new Samsung Galaxy A73 5G. Sealed in box, never opened. Great mid-range phone with excellent camera. Perfect condition.', 38000.00, 1, 'new', 'Samsung', 'Galaxy A73 5G', 'https://images.unsplash.com/photo-1601972602236-8c23525d7545?w=400', 8, 'approved');

-- Note: Make sure to have at least one vendor user in the database
-- If you don't have a vendor, the products will be assigned to the admin user (user_id = 1)

