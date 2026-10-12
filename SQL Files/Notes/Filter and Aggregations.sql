-- View all the databases to check whether the DB we're about to create is already available
SHOW DATABASES;

-- Create a database for Swiggy
CREATE DATABASE swiggy_db;

-- Use Swiggy DB for working further on it
USE swiggy_db;

-- Create order table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(150),
    restaurant_name VARCHAR(150),
    city VARCHAR(100),
    amount DECIMAL(7,2),
    status VARCHAR(20)
) AUTO_INCREMENT=1;

-- Insert values inside orders
INSERT INTO orders 
(customer_name, restaurant_name, city, amount, status) 
VALUES
('Arun Kumar', 'Anjappar', 'Chennai', 450.50, 'Delivered'),
('Priya Sharma', 'Saravana Bhavan', 'Chennai', 320.00, 'Delivered'),
('Rahul Verma', 'Paradise Biryani', 'Hyderabad', 580.75, 'Delivered'),
('Sneha Iyer', 'Meghana Foods', 'Bangalore', 690.00, 'Preparing'),
('Karthik Raj', 'A2B', 'Chennai', 275.50, 'Delivered'),
('Meena Das', 'Burger King', 'Mumbai', 410.25, 'Cancelled'),
('Vijay Anand', 'Empire Restaurant', 'Bangalore', 525.00, 'Out for Delivery'),
('Divya Nair', 'Malabar Parotta', 'Kochi', 360.75, 'Delivered'),
('Suresh Babu', 'Absolute Barbecues', 'Chennai', 1500.00, 'Preparing'),
('Anjali Menon', 'Behrouz Biryani', 'Pune', 475.50, 'Delivered'),
('Ravi Shankar', 'Dominos', 'Coimbatore', 340.00, 'Cancelled'),
('Neha Kapoor', 'Haldirams', 'Delhi', 620.25, 'Out for Delivery'),
('Mohammed Ali', 'Buhari Hotel', 'Chennai', 385.00, 'Delivered'),
('Lakshmi Priya', 'Theobroma', 'Mumbai', 290.50, 'Preparing'),
('Naveen Kumar', 'Nandhana Palace', 'Bangalore', 550.75, 'Delivered');

-- Delete the orders table along with all its data
-- DROP TABLE orders;

-- Check if the orders table has data
SELECT * FROM orders;

-- View all orders taken from Chennai
SELECT * FROM orders WHERE city = "Chennai";

-- View all orders where the order amount is less than 400
SELECT * FROM orders WHERE amount < 400;

-- Calculate the total amount of all orders
SELECT SUM(amount) AS total_amount 
FROM orders;

-- Find the minimum order amount
SELECT MIN(amount) AS min_amount 
FROM orders;

-- Find the maximum order amount
SELECT MAX(amount) AS max_amount 
FROM orders;

-- Calculate the average order amount
SELECT AVG(amount) AS avg_amount 
FROM orders;

-- Count the number of delivered orders
SELECT COUNT(status) AS delivered_count 
FROM orders 
WHERE status = "Delivered";

-- Calculate the total order amount from Chennai
SELECT SUM(amount) AS chennai_total_amount 
FROM orders 
WHERE city = "Chennai";

-- Calculate the total order amount for each city
SELECT 
    SUM(amount) AS total_amount, 
    city 
FROM orders 
GROUP BY city;

-- Count the number of cancelled orders for each city
SELECT 
    COUNT(status) AS cancelled_orders, 
    city 
FROM orders 
WHERE status = "Cancelled" 
GROUP BY city;

-- Calculate total, minimum, maximum, and average order amounts
SELECT 
    SUM(amount) AS total_amount, 
    MIN(amount) AS min_amount, 
    MAX(amount) AS max_amount, 
    AVG(amount) AS avg_amount
FROM orders;

-- Calculate the total orders placed for each city
SELECT 
    COUNT(*) AS order_count, 
    city 
FROM orders 
GROUP BY city;