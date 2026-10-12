-- 1. Display customer names with their products using INNER JOIN.
SELECT c.customer_id, c.customer_name, o.product_id FROM Customers AS c JOIN Orders AS o ON o.customer_id = c.customer_id;

-- 2. Display all customers and their orders using LEFT JOIN.
SELECT * FROM Customers AS c LEFT JOIN Orders AS o ON o.customer_id = c.customer_id; 

-- 3. Display all orders with customer names using RIGHT JOIN.
SELECT c.customer_name, o.* FROM Customers AS c RIGHT JOIN Orders AS o ON o.customer_id = c.customer_id; 

-- 4. Find customers who have not placed any orders.
SELECT * FROM Customers AS c LEFT JOIN Orders AS o ON o.customer_id = c.customer_id WHERE o.order_id IS NULL; 

-- 5. Display the customer name, product, and amount for orders above ₹10,000.
SELECT c.customer_name AS 'Customer Name', p.product_name AS 'Product', SUM(o.quantity * p.price) AS 'Total Amount'
FROM Customers AS c LEFT JOIN Orders AS o ON o.customer_id = c.customer_id
LEFT JOIN Products AS p ON o.product_id = p.product_id
GROUP BY c.customer_name, p.product_name
HAVING SUM(o.quantity * p.price) > 10000;

-- 6. Count how many orders each customer has placed.
SELECT c.customer_name AS 'Customer Name', COUNT(o.order_id) AS 'Total No of Orders' FROM Customers AS c LEFT JOIN Orders AS o 
ON c.customer_id = o.customer_id GROUP BY c.customer_name;

