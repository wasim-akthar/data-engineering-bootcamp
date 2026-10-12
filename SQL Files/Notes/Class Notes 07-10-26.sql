CREATE DATABASE swiggy_db;
USE swiggy_db;
CREATE TABLE order_info (
order_id INT PRIMARY KEY,
customer_name VARCHAR(100),
restaurant_name VARCHAR(100),
food_item VARCHAR(100),
amount INT
);

INSERT INTO order_info
(order_id, customer_name, restaurant_name, food_item, amount)
VALUES
(1, 'Arun', 'SS Hyderabad', 'Biryani', 250),
(2, 'Priya', 'SS Hyderabad', 'Chicken Rice', 180),
(3, 'Karthik', 'A2B', 'Dosa', 120),
(4, 'Meena', 'SS Hyderabad', 'Biryani', 300),
(5, 'Rahul', 'A2B', 'Idli', 80),
(6, 'Divya', 'Burger King', 'Burger', 220),
(7, 'Arun', 'A2B', 'Parotta', 150),
(8, 'Priya', 'Burger King', 'Burger', 250),
(9, 'Karthik', 'SS Hyderabad', 'Biryani', 280);

SELECT * FROM order_info;

SELECT restaurant_name AS "Restaurant Name", COUNT(*) AS 'Total Orders' FROM order_info GROUP BY restaurant_name;

SELECT restaurant_name AS "Restaurant Name", COUNT(*) AS 'Total Orders' FROM order_info GROUP BY restaurant_name HAVING COUNT(*) > 2;

SELECT customer_name AS 'Customer Name', restaurant_name AS "Restaurant Name",
CASE
	WHEN amount >=200 THEN 'High'
    WHEN amount >=150 THEN 'Medium'
    WHEN amount >=100 THEN 'Low'
    ELSE 'Very low'
END AS 'Price Category'
FROM order_info;

SELECT ROUND(AVG(amount), 2) AS 'Average Amount',
CASE
	WHEN amount >=200 THEN 'High'
    WHEN amount >=150 THEN 'Medium'
	WHEN amount >=100 THEN 'Low'
END AS 'Order Category'
FROM order_info 
GROUP BY 
	CASE
		WHEN amount >=200 THEN 'High'
		WHEN amount >=150 THEN 'Medium'
		WHEN amount >=100 THEN 'Low'
	END;
