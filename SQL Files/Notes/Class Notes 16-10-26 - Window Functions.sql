-- Find employees who 
-- earn more than the lowest salary in the HR department, 
-- but do not work in HR

SELECT * FROM employees_info AS e JOIN departments AS d ON e.dept_id = d.dept_id WHERE e.Salary > 
(SELECT MIN(e2.salary) FROM employees_info AS e2 WHERE e2.dept_id = 2)
AND e.dept_id !=2; 

-- Find employees whose salary is greater than the average salary of the Finance department, 
-- but display only employees who work in IT or Sales

SELECT * FROM employees_info AS e JOIN departments AS d ON e.dept_id = d.dept_id 
WHERE e.Salary > (SELECT AVG(e2.salary) FROM employees_info AS e2 WHERE e2.dept_id = 3)
AND e.dept_id IN (1, 6); 

-- Create Amazon_Sales table
CREATE TABLE amazon_sales (
    sale_id INT PRIMARY KEY,
    category VARCHAR(50),
    product VARCHAR(100),
    sale_date DATE,
    amount INT
);

-- Insert records into Amazon_Sales table
INSERT INTO amazon_sales (sale_id, category, product, sale_date, amount)
VALUES
(1, 'Electronics', 'iPhone 15', '2026-01-05', 80000),
(2, 'Electronics', 'Echo Dot', '2026-01-12', 5000),
(3, 'Electronics', 'Kindle', '2026-01-20', 12000),
(4, 'Electronics', 'Fire TV Stick', '2026-01-28', 5000),
(5, 'Books', 'Atomic Habits', '2026-01-03', 500),
(6, 'Books', 'Deep Work', '2026-01-15', 600),
(7, 'Books', 'Python Crash Course', '2026-01-25', 600),
(8, 'Books', 'Clean Code', '2026-02-02', 900);

-- ROW NUMBER

SELECT ROW_NUMBER() OVER (ORDER BY amount DESC, sale_id) AS 'Row Number',
product AS 'Product', Amount AS 'Amount' FROM amazon_sales;

-- RANK

SELECT RANK() OVER (ORDER BY amount DESC) AS 'Rank',
product AS 'Product', Amount AS 'Amount' FROM amazon_sales;

-- DENSE RANK

SELECT DENSE_RANK() OVER (ORDER BY amount DESC) AS 'Dense Rank',
product AS 'Product', Amount AS 'Amount' FROM amazon_sales;

-- SUM

SELECT SUM(amount) OVER () AS 'Sum',
product AS 'Product', Amount AS 'Amount' FROM amazon_sales;

-- AVG


SELECT ROUND(AVG(amount) OVER (), 2) AS 'Sum',
product AS 'Product', Amount AS 'Amount' FROM amazon_sales;

-- SUM PARTITION

SELECT product AS 'Product', amount AS 'Amount', category AS 'Category',
SUM(amount) OVER (PARTITION BY category) AS 'Category Total' 
FROM amazon_sales;

-- AVG PARTITION

SELECT product AS 'Product', amount AS 'Amount', category AS 'Category',
ROUND(AVG(amount) OVER (PARTITION BY category),2) AS 'Category Average'
FROM amazon_sales; 

-- MIN

SELECT product AS 'Product', amount AS 'Amount',
MIN(amount) OVER (PARTITION BY sale_id) AS 'Min amount'
FROM amazon_sales; 

-- MAX

SELECT product AS 'Product', amount AS 'Amount',
MAX(amount) OVER (PARTITION BY sale_id) AS 'Min amount'
FROM amazon_sales; 

-- MIN PARTITION

SELECT product AS 'Product', amount AS 'Amount',
MIN(amount) OVER (PARTITION BY category) AS 'Min category amount'
FROM amazon_sales; 

-- MAX PARTITION

SELECT product AS 'Product', amount AS 'Amount',
MAX(amount) OVER (PARTITION BY category) AS 'Max category amount'
FROM amazon_sales; 

-- FIRST_VALUE

SELECT product AS 'Product', amount AS 'Amount',
FIRST_VALUE(amount) OVER () AS 'Last amount'
FROM amazon_sales; 

-- LAST_VALUE

SELECT product AS 'Product', amount AS 'Amount',
LAST_VALUE(amount) OVER () AS 'Last amount'
FROM amazon_sales; 

-- FIRST_VALUE PARTITION

SELECT product AS 'Product', amount AS 'Amount',
FIRST_VALUE(amount) OVER (PARTITION BY category) AS 'First category amount'
FROM amazon_sales; 

-- LAST_VALUE PARTITION

SELECT product AS 'Product', amount AS 'Amount',
LAST_VALUE(amount) OVER (PARTITION BY sale_id) AS 'Last category amount'
FROM amazon_sales; 

-- NTH_VALUE

SELECT product AS 'Product', amount AS 'Amount',
NTH_VALUE(amount, 2) OVER() AS 'Second Value'
FROM amazon_sales;

-- NTH_VALUE PARTITION

SELECT product AS 'Product', amount AS 'Amount',
NTH_VALUE(amount, 2) OVER(PARTITION BY category) AS 'Second Value'
FROM amazon_sales;

-- NTILE

SELECT product AS 'Product', amount AS 'Amount',
NTILE(4) OVER (ORDER BY amount DESC) AS 'Quartile'
FROM amazon_sales;