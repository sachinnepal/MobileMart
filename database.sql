CREATE TABLE orders (
 id INT AUTO_INCREMENT PRIMARY KEY,
 order_id VARCHAR(100) UNIQUE,
 amount INT NOT NULL,
 payment_method ENUM('KHALTI','COD'),
 payment_status ENUM('PENDING','PAID','FAILED'),
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE payments (
 id INT AUTO_INCREMENT PRIMARY KEY,
 order_id VARCHAR(100),
 khalti_token VARCHAR(255),
 khalti_idx VARCHAR(255),
 amount INT,
 status VARCHAR(50),
 raw_response JSON,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);