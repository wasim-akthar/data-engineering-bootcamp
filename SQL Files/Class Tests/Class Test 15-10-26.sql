-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Insert records into Customers table
INSERT INTO Customers (customer_id, name)
VALUES
(1, 'Arun'),
(2, 'Priya'),
(3, 'Karthik');


-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT
);

-- Insert records into Orders table
INSERT INTO Orders (order_id, customer_id, amount)
VALUES
(101, 1, 500),
(102, 1, 300),
(103, 2, 700),
(104, 9, 400);

-- Joins
SELECT * FROM customers LEFT JOIN orders ON customers.customer_id = orders.customer_id;

-- Find Customers Who placed orders
SELECT * FROM customers AS c JOIN orders AS o ON c.customer_id = o.customer_id;

-- Find all customers including those without orders
SELECT * FROM customers AS c LEFT JOIN orders AS o ON c.customer_id = o.customer_id;

-- Find All orders including those without customers
SELECT o.*, c.* FROM customers AS c RIGHT JOIN orders AS o ON c.customer_id = o.customer_id;

-- Find customers who have not placed any orders
SELECT c.* FROM customers AS c LEFT JOIN orders AS o ON c.customer_id = o.customer_id WHERE o.order_id IS NULL;

-- Find orders without matching customers
SELECT o.* FROM customers AS c RIGHT JOIN orders AS o ON c.customer_id = o.customer_id WHERE c.customer_id IS NULL;

-- Calculate the total amount spent by each customer
SELECT c.name AS 'Customer Name', SUM(o.amount) AS 'Total Amount' FROM customers 
AS c JOIN orders AS o ON c.customer_id = o.customer_id GROUP BY c.name;

-- Find the customer whose total order amount is greater than 500
SELECT c.name AS 'Customer Name', SUM(o.amount) AS 'Total Amount' FROM customers 
AS c JOIN orders AS o ON c.customer_id = o.customer_id GROUP BY c.name HAVING SUM(o.amount) > 500;

-- Subqueries

-- Find the customers who have placed atleast one order
SELECT * FROM customers AS c WHERE EXISTS (SELECT * FROM orders AS o WHERE o.customer_id = c.customer_id);

-- Find the customers who have not placed an order
SELECT * FROM customers AS c WHERE NOT EXISTS (SELECT * FROM orders AS o WHERE o.customer_id = c.customer_id);

-- Find orders whose amount is greater than the average order amount
SELECT * FROM orders WHERE amount > (SELECT AVG(amount) FROM orders);

-- Find customers who have placed the highest value order
SELECT * FROM customers AS c JOIN orders AS o ON o.customer_id = c.customer_id WHERE o.amount = (SELECT MAX(amount) FROM orders);

-- Find the customers whose total spending is greater than 500
SELECT * FROM customers AS c WHERE (SELECT SUM(amount) FROM orders AS o WHERE o.customer_id = c.customer_id ) > 500;

-- Find the orders greater than arun's highest order amount
SELECT * FROM customers AS c JOIN orders AS o ON o.customer_id = c.customer_id 
WHERE o.amount > (
SELECT MAX(amount) FROM orders WHERE 
o.customer_id = (SELECT customer_id FROM customers WHERE name = 'Arun' )
);

-- FInd the customers who places orders worth more than 400
SELECT c.* FROM customers AS c 
WHERE c.customer_id = ANY (SELECT customer_id FROM orders AS o WHERE o.customer_id = c.customer_id AND o.amount > 400);