-- ecommerce_db.sql

CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- Users table
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products table
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Categories table
CREATE TABLE Categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Product_Categories table (many-to-many)
CREATE TABLE Product_Categories (
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY(product_id, category_id),
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(id) ON DELETE CASCADE
);

-- Orders table
CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- Order_Items table
CREATE TABLE Order_Items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_purchase DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE
);

-- ======================================
-- Sample Data
-- ======================================

-- Sample Users
INSERT INTO Users (name, email, password) VALUES
('Adeyemi Ayorinde', 'adeyemi@example.com', 'password123'),
('Jane Doe', 'jane@example.com', 'password456');

-- Sample Products
INSERT INTO Products (name, description, price, stock_quantity) VALUES
('Laptop', 'Gaming Laptop 16GB RAM', 1500.00, 10),
('Smartphone', 'Android Phone 128GB', 700.00, 25);

-- Sample Categories
INSERT INTO Categories (name, description) VALUES
('Electronics', 'Electronic Devices'),
('Computers', 'Laptops and Accessories');

-- Sample Product_Categories
INSERT INTO Product_Categories (product_id, category_id) VALUES
(1, 1),
(1, 2),
(2, 1);

-- Sample Orders
INSERT INTO Orders (user_id, total_amount) VALUES
(1, 1500.00),
(2, 700.00);

-- Sample Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 1, 1, 1500.00),
(2, 2, 1, 700.00);
