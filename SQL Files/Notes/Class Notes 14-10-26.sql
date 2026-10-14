CREATE DATABASE myntra_db;
USE myntra_db;

CREATE TABLE products (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
	category VARCHAR(50),
    price INT
);

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    product_id INT,
    customer_name VARCHAR(50),
    quantity INT
);

INSERT INTO products (product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 65000), (102, 'Smartphone', 'Electronics', 28000),
(103, 'Headphones', 'Accessories', 2500), (104, 'Keyboard', 'Accessories', 1800),
(105, 'Monitor', 'Electronics', 12500), (106, 'Office Chair', 'Furniture', 8500),
(107, 'Desk', 'Furniture', 12000), (108, 'Smartwatch', 'Electronics', 7500),
(109, 'Mouse', 'Accessories', 1200), (110, 'Backpack', 'Bags', 2200);


-- Insert 10 records into orders
INSERT INTO orders (order_id, product_id, customer_name, quantity)
VALUES
(1001, 101, 'Arun', 1), (1002, 103, 'Priya', 2),
(1003, 102, 'Karthik', 1), (1004, 104, 'Divya', 3),
(1005, 105, 'Rahul', 1), (1006, 106, 'Sneha', 2),
(1007, 108, 'Vijay', 1), (1008, 109, 'Meena', 4),
(1009, 107, 'Naveen', 1), (1010, 110, 'Aisha', 2);

-- A. Single Row Query
-- Find the products where the price is greater than average price of all products
SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products);

-- B. Multiple Row Query
-- Find the product name, category and price of products where each category has products of price over 2000
SELECT ROW_NUMBER() OVER (ORDER BY product_name) AS 'S.no', product_name, category, price 
FROM products WHERE category = ANY (SELECT category FROM products WHERE price > 2000);	

-- C. Correlated Sub Query
-- Find products whose price is greater than the average price of their own category of product
SELECT ROW_NUMBER() OVER (ORDER BY p1.product_name) AS 'S.no', p1.* FROM products AS p1 WHERE p1.price > (
	SELECT AVG(p2.price)
    FROM products AS p2
    WHERE p1.category = p2.category 
);
-- D. ALL and ANY

-- ANY
-- Find products whose price is greater than any product
-- in the Accessories category.
SELECT product_name, category, price FROM products
WHERE price > ANY (
    SELECT price
    FROM products
    WHERE category = 'Accessories'
);

-- ALL
-- Find products whose price is greater than all products
-- in the Accessories category.
SELECT product_name, category, price FROM products
WHERE price > ALL (
    SELECT price
    FROM products
    WHERE category = 'Accessories'
);

-- E. IN, EXISTS and NOT EXISTS

-- IN
-- Find products that have been ordered.
SELECT product_name, category, price
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM orders
);

-- EXISTS
-- Find products that have been ordered at least once.
SELECT p.product_name, p.category, p.price
FROM products AS p
WHERE EXISTS (
    SELECT 1
    FROM orders AS o
    WHERE p.product_id = o.product_id
);

-- NOT EXISTS
-- Find products that have never been ordered.
SELECT p.product_name, p.category, p.price
FROM products AS p
WHERE NOT EXISTS (
    SELECT 1
    FROM orders AS o
    WHERE p.product_id = o.product_id
);