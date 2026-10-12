-- ============================================================
-- SQL PRACTICE ASSIGNMENT
-- Scenario: Online Shopping Application (MySQL)
-- Total: 30 Questions
-- Topics: Constraints, INNER JOIN, LEFT JOIN, RIGHT JOIN,
--         filters, aggregate functions, GROUP BY, HAVING
-- ============================================================

CREATE DATABASE IF NOT EXISTS online_shopping_db;
USE online_shopping_db;
-- CONSTRAINTS & TABLE DESIGN
-- Q1. Create a Customers table with customer_id as PRIMARY KEY,
--     customer_name as NOT NULL, and email as UNIQUE.

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE
);
-- Q2. Create a Products table where price must be greater than zero
--     using a CHECK constraint.

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_products_price CHECK (price > 0)
);
-- Q3. Create an Orders table with order_id as PRIMARY KEY and
--     customer_id as a FOREIGN KEY referencing Customers.

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    order_date DATE NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT fk_orders_product
        FOREIGN KEY (product_id) REFERENCES Products(product_id),
    CONSTRAINT chk_orders_quantity CHECK (quantity > 0)
);

-- SAMPLE DATA
INSERT INTO Customers (customer_id, customer_name, email) VALUES
(1, 'Arun Kumar', 'arun@example.com'),
(2, 'Priya Sharma', 'priya@example.com'),
(3, 'Karthik Raj', 'karthik@example.com'),
(4, 'Divya Menon', 'divya@example.com'),
(5, 'Rahul Verma', 'rahul@example.com'),
(6, 'Sneha Iyer', 'sneha@example.com'),
(7, 'Vijay Anand', 'vijay@example.com'),
(8, 'Meena Das', 'meena@example.com'),
(9, 'Naveen Kumar', 'naveen@example.com'),
(10, 'Aisha Khan', 'aisha@example.com');

INSERT INTO Products (product_id, product_name, price) VALUES
(101, 'Laptop', 65000.00),
(102, 'Smartphone', 28000.00),
(103, 'Headphones', 2500.00),
(104, 'Keyboard', 1800.00),
(105, 'Monitor', 12500.00),
(106, 'Smartwatch', 7500.00),
(107, 'USB-C Hub', 2200.00),
(108, 'Tablet', 32000.00),
(109, 'Webcam', 4000.00),
(110, 'Wireless Mouse', 1200.00);

INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date) VALUES
(1001, 1, 101, 1, '2026-01-05'),
(1002, 2, 103, 2, '2026-01-07'),
(1003, 1, 104, 2, '2026-01-10'),
(1004, 3, 102, 1, '2026-01-12'),
(1005, 4, 105, 1, '2026-01-15'),
(1006, 5, 110, 3, '2026-01-18'),
(1007, 2, 106, 1, '2026-02-01'),
(1008, 6, 108, 1, '2026-02-04'),
(1009, 7, 107, 2, '2026-02-10'),
(1010, 3, 109, 2, '2026-02-12'),
(1011, 8, 102, 1, '2026-02-16'),
(1012, 1, 106, 2, '2026-02-20'),
(1013, 4, 103, 3, '2026-03-02'),
(1014, 5, 105, 2, '2026-03-05'),
(1015, 9, 110, 1, '2026-03-08');

-- ============================================================
-- QUESTIONS: 30 TOTAL
-- ============================================================

-- Q4. Display customer name, product name, and amount for all orders.
--     Amount = product price * quantity.
SELECT c.customer_name AS 'Customer Name', p.product_name AS 'Product Name', p.price * o.quantity AS 'Amount'
FROM Customers AS c JOIN Orders AS o ON o.customer_id = c.customer_id
JOIN Products AS p ON p.product_id = o.product_id; 

-- Q5. Display customers who purchased products worth more than ₹5,000.
--     Use each order's amount (price * quantity).
SELECT c.customer_name AS 'Customer Name', p.product_name AS 'Product Name', p.price * o.quantity AS 'Amount'
FROM Customers AS c JOIN Orders AS o ON o.customer_id = c.customer_id
JOIN Products AS p ON p.product_id = o.product_id
WHERE p.price * o.quantity > 5000; 

-- Q6. Display customer names and their order details using INNER JOIN.
SELECT c.customer_name AS 'Customer Name', o.*
FROM Customers AS c INNER JOIN Orders AS o ON o.customer_id = c.customer_id;

-- Q7. Display each order ID, customer name, product name, and order date.
SELECT o.order_id AS 'Order ID', c.customer_name AS 'Customer Name', p.product_name AS 'Product Name', o.order_date AS 'Order Date'
FROM Customers AS c JOIN Orders AS o ON o.customer_id = c.customer_id
JOIN Products AS p ON p.product_id = o.product_id
ORDER BY o.order_id;

-- Q8. Display customers who purchased a Laptop.
SELECT c.* 
FROM Customers AS c JOIN Orders AS o ON o.customer_id = c.customer_id
JOIN Products AS p ON p.product_id = o.product_id
WHERE p.product_name = 'Laptop';

-- Q9. Display customer names and product names for orders placed in February 2026.
SELECT c.customer_name AS 'Customer Name', p.product_name AS 'Product Name'
FROM Customers AS c JOIN Orders AS o ON o.customer_id = c.customer_id
JOIN Products AS p ON p.product_id = o.product_id
WHERE o.order_date > '2026-02-01';

-- Q10. Display orders where the order amount (price * quantity) is above ₹10,000.
SELECT o.*, p.price * o.quantity AS Amount FROM Products AS p JOIN Orders AS o ON o.product_id = p.product_id
WHERE  p.price * o.quantity > 10000;

-- Q11. Display all customers and their order details, including customers
--      who have not placed any orders.
SELECT * FROM customers AS c LEFT JOIN Orders AS o ON c.customer_id = o.customer_id;

-- Q12. Find customers who have never placed an order.
SELECT c.* FROM customers AS c LEFT JOIN Orders AS o ON c.customer_id = o.customer_id WHERE o.customer_id IS NULL;

-- Q13. Display all products and any orders containing them, including
--      products that have never been ordered.
SELECT * FROM Orders AS o LEFT JOIN Products AS p ON p.product_id = o.product_id;

-- Q14. Find products that have never been ordered.
SELECT * FROM Products AS p LEFT JOIN Orders AS o ON p.product_id = o.product_id WHERE o.product_id IS NULL;

-- Q15. Display every customer and the total number of orders they placed,
--      including customers with zero orders.
SELECT c.*, COUNT(*) AS 'Total Orders' FROM customers AS c JOIN orders AS o ON c.customer_id = o.customer_id GROUP BY c.customer_id;

-- Q16. Display all orders along with their corresponding customer names.
SELECT * FROM Orders AS o RIGHT JOIN Customers AS c ON c.customer_id = o.customer_id;

-- Q17. Display all products and their matching orders using RIGHT JOIN.
SELECT * FROM Products AS p RIGHT JOIN Orders AS o ON p.product_id = o.product_id;

-- Q18. Display all customers and their orders using RIGHT JOIN.
--      Arrange the tables so every customer is included.
SELECT * FROM Orders AS O RIGHT JOIN Customers AS c ON o.customer_id = c.customer_id;

-- Q19. Display customers and products for all orders.
SELECT c.*, p.* FROM Orders AS o RIGHT JOIN Customers AS c ON c.customer_id = o.customer_id
RIGHT JOIN Products as p ON p.product_id = o.product_id;

-- Q20. Display all products, including those without matching orders,
--      using.
SELECT p.*, o.* FROM Orders AS o RIGHT JOIN Products as p ON p.product_id = o.product_id;

-- AGGREGATES, GROUP BY & HAVING
-- Q21. Find the total number of orders.
SELECT COUNT(*) AS 'Total Number of Orders' FROM Orders;

-- Q22. Calculate the total sales amount across all orders.
SELECT SUM(p.price * o.quantity) AS 'Total Sales Amount' FROM Orders AS o LEFT JOIN Products as p ON p.product_id = o.product_id;

-- Q23. Display each customer and their total spending, including customers
--      who have not placed any orders.
SELECT c.customer_name AS 'Customer Name', SUM(p.price * o.quantity) AS 'Total Amount' FROM Customers AS c LEFT JOIN Orders AS o ON c.customer_id = o.customer_id
LEFT JOIN Products AS p ON p.product_id = o.product_id GROUP BY c.customer_name; 

-- Q24. Find customers whose total spending is greater than ₹20,000.
SELECT c.customer_name AS 'Customer Name', SUM(p.price * o.quantity) AS 'Total Amount' FROM Customers AS c LEFT JOIN Orders AS o ON c.customer_id = o.customer_id
LEFT JOIN Products AS p ON p.product_id = o.product_id GROUP BY c.customer_name HAVING SUM(p.price * o.quantity) > 20000; 

-- Q25. Display the number of orders placed by each customer, sorted from
--      highest to lowest order count.
SELECT c.customer_name AS 'Customer Name', COUNT(*) AS 'No of Orders' FROM Customers AS C LEFT JOIN Orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_name ORDER BY COUNT(*) DESC;

-- Q26. Find the average product price.
SELECT ROUND(AVG(price),2) AS 'Average Price' FROM Products;

-- Q27. Display each product and the total quantity sold for that product.
SELECT p.product_name AS 'Product', SUM(o.quantity) AS 'Total Quantity' FROM Orders AS o LEFT JOIN Products AS p ON p.product_id = o.product_id
GROUP BY p.product_name;

-- Q28. Find products with a total quantity sold greater than 2.
SELECT p.product_name AS 'Product', SUM(o.quantity) AS 'Total Quantity' FROM Orders AS o LEFT JOIN Products AS p ON p.product_id = o.product_id
GROUP BY p.product_name HAVING SUM(o.quantity) > 2;

-- Q29. Display monthly sales totals for 2026.
SELECT EXTRACT(MONTH FROM order_date) AS 'Month', SUM(p.price * o.quantity) AS 'Total Sales' FROM Orders AS o JOIN Products AS p ON p.product_id = o.product_id
WHERE o.order_date >= '2026-01-01' AND o.order_date <= '2026-12-31'
GROUP BY EXTRACT(MONTH FROM order_date) ORDER BY Month ASC;

-- Q30. Display customers who have placed more than one order and show
--      their order count.
SELECT c.customer_name AS 'Customer Name', COUNT(*) AS 'Total Orders' FROM Orders AS o JOIN Customers AS c ON c.customer_id = o.customer_id
GROUP BY c.customer_name HAVING COUNT(*) > 1;

-- OPTIONAL: Inspect the data before solving
-- SELECT * FROM Customers;
-- SELECT * FROM Products;
-- SELECT * FROM Orders;
