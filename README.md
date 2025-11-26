# E-commerce Store Database Management System

## Overview

This project is a **relational database system** for an E-commerce store, implemented using **MySQL**. The database is designed to manage users, products, categories, orders, and order items, supporting typical online store functionalities.

The database includes proper constraints, relationships, and sample data to help test queries and functionality.

---

## Database Structure

### **1. Users**
Stores information about customers.

| Column      | Type          | Notes                       |
|------------|---------------|-----------------------------|
| id         | INT           | Primary Key, Auto Increment |
| name       | VARCHAR(100)  | Not NULL                    |
| email      | VARCHAR(100)  | Not NULL, UNIQUE            |
| password   | VARCHAR(255)  | Not NULL                    |
| created_at | TIMESTAMP     | Defaults to CURRENT_TIMESTAMP |

---

### **2. Products**
Stores products available for sale.

| Column         | Type         | Notes                       |
|----------------|--------------|-----------------------------|
| id             | INT          | Primary Key, Auto Increment |
| name           | VARCHAR(200) | Not NULL                    |
| description    | TEXT         |                             |
| price          | DECIMAL(10,2)| Not NULL                    |
| stock_quantity | INT          | Not NULL                    |

---

### **3. Categories**
Stores product categories.

| Column      | Type         | Notes                       |
|------------|--------------|-----------------------------|
| id         | INT          | Primary Key, Auto Increment |
| name       | VARCHAR(100) | Not NULL                    |
| description| TEXT         |                             |

---

### **4. Product_Categories**
Maps products to categories (Many-to-Many relationship).

| Column      | Type | Notes                                |
|------------|------|--------------------------------------|
| product_id | INT  | Foreign Key → Products(id)           |
| category_id| INT  | Foreign Key → Categories(id)         |
| PRIMARY KEY(product_id, category_id) | | |

---

### **5. Orders**
Stores orders placed by users.

| Column       | Type          | Notes                       |
|-------------|---------------|-----------------------------|
| id          | INT           | Primary Key, Auto Increment |
| user_id     | INT           | Foreign Key → Users(id)     |
| order_date  | TIMESTAMP     | Defaults to CURRENT_TIMESTAMP |
| total_amount| DECIMAL(10,2) | Not NULL                    |

---

### **6. Order_Items**
Stores individual items for each order.

| Column           | Type          | Notes                             |
|-----------------|---------------|-----------------------------------|
| id               | INT           | Primary Key, Auto Increment       |
| order_id         | INT           | Foreign Key → Orders(id)          |
| product_id       | INT           | Foreign Key → Products(id)        |
| quantity         | INT           | Not NULL                          |
| price_at_purchase| DECIMAL(10,2) | Not NULL                          |

---

## Relationships

- **Users → Orders:** One-to-Many (A user can have many orders)  
- **Orders → Order_Items:** One-to-Many (An order can contain multiple products)  
- **Products → Product_Categories:** Many-to-Many (Products can belong to multiple categories)

---

## Sample Data

The database includes sample entries for:

- Users
- Products
- Categories
- Product_Categories
- Orders
- Order_Items

This allows immediate testing of queries and relationships.

---

## How to Run

1. Clone or download this repository.  
2. Open **MySQL Workbench**.  
3. Open the `ecommerce_db.sql` file.  
4. Execute the entire script to create the database, tables, and populate sample data.  
5. The database `ecommerce_db` is now ready for use.  

---

## Notes

- **Database:** MySQL  
- **File:** `ecommerce_db.sql`  
- All constraints are applied: **Primary Keys, Foreign Keys, and UNIQUE constraints**.  
- Designed for a simple E-commerce application, suitable for testing and learning relational database concepts.  

---

## Author

**Adeyemi Ayorinde**  
