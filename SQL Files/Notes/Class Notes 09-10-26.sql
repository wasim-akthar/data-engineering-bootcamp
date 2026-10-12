-- Constraints lesson
CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) DEFAULT 'Chennai'
);

INSERT INTO customers (customer_id, customer_name, city)
VALUES
-- (1, 'Arun Kumar', 'Chennai'),
-- (2, 'Priya Sharma', 'Bangalore'), 
(3, 'Karthik Kumar', 'Pondicherry');

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100),
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES 
(500, 1, 'Mobile', 50000.98),
(501, 2, 'Laptop', 48000.98),
(502, 3, 'Fridge', 17890.54);

SELECT * FROM customers;