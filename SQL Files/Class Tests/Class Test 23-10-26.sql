/* =====================================================================
   SQL TEST  -  Aggregates, GROUP BY, HAVING, Joins, Subqueries,
                Views, Window Functions, CTEs
   Total Questions : 30   (Beginner 1-10 | Intermediate 11-30)
   Instructions    : 1. Run the SETUP section once to create and load the tables.
                     2. Write your query below each question (replace the
                        "-- Your answer here" line).
                     3. Use only the four tables provided.
   Compatible with : MySQL 8+, PostgreSQL, SQL Server (minor syntax changes)
   ===================================================================== */


/* =====================================================================
   SETUP  -  Tables and Sample Data
   ===================================================================== */

CREATE DATABASE test_db;
USE test_db;

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- 1. Customers table
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city          VARCHAR(50)
);

INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Arun',  'Chennai'),
(2, 'Priya', 'Bangalore'),
(3, 'Kavin', 'Chennai'),
(4, 'Divya', 'Hyderabad'),
(5, 'Ravi',  'Bangalore');

-- 2. Orders table
CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    customer_id INT,
    amount      INT,
    status      VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO orders (order_id, customer_id, amount, status) VALUES
(101, 1, 2500, 'Delivered'),
(102, 2, 1500, 'Delivered'),
(103, 1, 3000, 'Pending'),
(104, 3, 4000, 'Delivered'),
(105, 4, 2000, 'Cancelled'),
(106, 2, 3500, 'Delivered'),
(107, 5, 1000, 'Pending'),
(108, 3, 2500, 'Delivered');

-- 3. Employees table
CREATE TABLE employees (
    employee_id   INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary        INT
);

INSERT INTO employees (employee_id, employee_name, department_id, salary) VALUES
(1, 'Anu',    10, 30000),
(2, 'Bala',   20, 45000),
(3, 'Charan', 10, 40000),
(4, 'Devi',   20, 50000),
(5, 'Ezhil',  30, 35000),
(6, 'Farah',  10, 40000);

-- 4. Departments table
CREATE TABLE departments (
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name) VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Sales'),
(40, 'Finance');


CREATE OR REPLACE VIEW customer_orders AS 
SELECT c.*, order_id, amount, status 
FROM customers AS c JOIN orders AS o ON c.customer_id = o.customer_id;

CREATE OR REPLACE VIEW department_customers AS
SELECT e.*, department_name 
FROM employees AS e JOIN departments AS d ON d.department_id = e.department_id;

/* =====================================================================
   PART 1  -  QUESTIONS ONLY
   ===================================================================== */


/* =====================================================================
   BEGINNER LEVEL  (Questions 1-10)
   ===================================================================== */

/* ---------------------------------------------------------------------
   Q1  [Aggregate functions]
   An online shopping company wants to know the total revenue from all
   orders. Write a query to calculate the total order amount using SUM().
   --------------------------------------------------------------------- */
-- Your answer here

SELECT SUM(amount) AS 'Total Order Amount' FROM orders;


/* ---------------------------------------------------------------------
   Q2  [Aggregate functions]
   The manager wants to know the average order value. Write a query
   using AVG().
   --------------------------------------------------------------------- */
-- Your answer here

SELECT AVG(amount) AS 'Average Order Value' FROM orders;

/* ---------------------------------------------------------------------
   Q3  [Aggregate functions]
   The company wants to count how many orders are present in the Orders
   table. Write a query using COUNT().
   --------------------------------------------------------------------- */
-- Your answer here

SELECT COUNT(*) AS 'Total Orders' FROM orders;

/* ---------------------------------------------------------------------
   Q4  [GROUP BY]
   The sales manager wants to know the total order amount for each
   customer. Display customer_id and total amount.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT customer_id AS 'Customer ID', SUM(amount) AS 'Total Amount'
FROM customer_orders GROUP BY customer_id;

/* ---------------------------------------------------------------------
   Q5  [GROUP BY]
   The HR manager wants to calculate the average salary for each
   department. Display department_id and average salary.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT department_id AS 'Department ID', ROUND(AVG(salary),2) AS 'Average Salary'
FROM department_customers GROUP BY department_id;

SELECT * FROM department_customers;

/* ---------------------------------------------------------------------
   Q6  [HAVING]
   Find customers whose total order amount is greater than 4,000.
   Display customer_id and total amount.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT customer_id AS 'Customer ID', SUM(amount) AS 'Total Order Amount'
FROM customer_orders GROUP BY customer_id HAVING SUM(amount) > 4000;

/* ---------------------------------------------------------------------
   Q7  [Joins]
   Display each order_id along with the customer_name who placed the
   order.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT order_id AS 'Order ID', customer_name AS 'Customer Name' FROM
customers AS c JOIN orders AS o ON c.customer_id = o.customer_id ORDER BY c.customer_id;

/* ---------------------------------------------------------------------
   Q8  [Joins]
   The company wants a list of all customers, including those who have
   never placed an order. Display customer names and their order IDs.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT * FROM customers AS c LEFT JOIN orders AS o ON c.customer_id = o.customer_id;

/* ---------------------------------------------------------------------
   Q9  [Subquery]
   Find employees whose salary is greater than the overall average
   salary of all employees.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT * FROM employees WHERE salary > ( SELECT AVG(salary) FROM employees);

/* ---------------------------------------------------------------------
   Q10  [Views]
   Create a view named Delivered_Orders that displays only orders whose
   status is Delivered.
   --------------------------------------------------------------------- */
-- Your answer here

CREATE OR REPLACE VIEW Delivered_Orders AS
SELECT * FROM orders WHERE status = 'Delivered';

/* =====================================================================
   INTERMEDIATE LEVEL  (Questions 11-20)
   ===================================================================== */

/* ---------------------------------------------------------------------
   Q11  [HAVING + GROUP BY]
   Find departments whose average salary is greater than 35,000.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT department_id AS 'Department ID', department_name AS 'Department', AVG(salary) AS 'Average Salary'
FROM department_customers GROUP BY department_id HAVING AVG(salary) > 35000; 

/* ---------------------------------------------------------------------
   Q12  [JOIN + GROUP BY]
   Display each customer name and their total order amount. Include
   customers who have no orders.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT c.customer_name AS 'Customer Name', SUM(o.amount) AS 'Total Order Amount'
FROM customers AS c LEFT JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY customer_name; 

/* ---------------------------------------------------------------------
   Q13  [Subquery]
   Find employees who earn the second-highest distinct salary.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT MAX(salary) AS 'Highest Salary' FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);

/* ---------------------------------------------------------------------
   Q14  [Window functions]
   Assign a unique row number to each employee, ordered by salary from
   highest to lowest.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT ROW_NUMBER() OVER ( ORDER BY salary DESC) AS 'S.No', e.* FROM employees AS e;

/* ---------------------------------------------------------------------
   Q15  [PARTITION BY]
   Rank employees by salary within each department, with the highest
   salary ranked first.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT RANK() OVER ( PARTITION BY department_id ORDER BY salary DESC) AS 'Department Rank',
e.* FROM employees AS e; 

/* ---------------------------------------------------------------------
   Q16  [RANK vs DENSE_RANK]
   Rank employees by salary across the entire company. Show the
   difference between RANK() and DENSE_RANK() when salaries are tied.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT RANK() OVER (ORDER BY salary) AS 'Rank Num', e.* FROM employees;
SELECT DENSE_RANK() OVER (ORDER BY salary) AS 'Rank Num', e.* FROM employees;

/* ---------------------------------------------------------------------
   Q17  [CTE]
   Use a CTE to calculate the total order amount for each customer and
   display customers whose total exceeds 4,000.
   --------------------------------------------------------------------- */
-- Your answer here

WITH total_order_amount_per_customer AS (
	SELECT c.customer_id, SUM(o.amount) AS total_amount
    FROM customers AS c JOIN orders AS o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
) 
SELECT customer_id AS 'Customer ID', total_amount AS 'Total Amount'
FROM total_order_amount_per_customer WHERE total_amount > 4000;

/* ---------------------------------------------------------------------
   Q18  [JOIN]
   Display every department name and its employees. Departments without
   employees must also appear.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT d.department_name AS 'Department Name', e.*
FROM departments AS d LEFT JOIN employees AS e ON e.department_id = d.department_id;

/* ---------------------------------------------------------------------
   Q19  [Subquery + Aggregate]
   Find customers whose total order amount is greater than the average
   of the total order amounts of customers who have orders.
   --------------------------------------------------------------------- */
-- Your answer here


/* ---------------------------------------------------------------------
   Q20  [Views]
   Create a view named Employee_Details that displays employee name,
   department name and salary.
   --------------------------------------------------------------------- */
-- Your answer here

CREATE OR REPLACE VIEW Employee_Details AS
SELECT e.employee_name, d.department_name, e.salary 
FROM employees AS e JOIN departments AS d ON e.department_id = d.department_id;


/* =====================================================================
   INTERMEDIATE LEVEL  (Questions 21-30)
   ===================================================================== */

/* ---------------------------------------------------------------------
   Q21  [PARTITION BY + SUM]
   Calculate each order's amount and the cumulative order amount for
   that customer, ordered by order_id.
   --------------------------------------------------------------------- */
-- Your answer here

SELECT  o.order_id AS 'Order ID', 
SUM(o.amount) OVER (PARTITION BY c.customer_id ORDER BY o.order_id ASC) AS 'Order Total', c.*
FROM customers AS c JOIN orders AS o ON c.customer_id = o.customer_id;

/* ---------------------------------------------------------------------
   Q22  [LAG()]
   For each employee, display their salary and the previous employee's
   salary when employees are ordered by employee_id.
   --------------------------------------------------------------------- */
-- Your answer here



/* ---------------------------------------------------------------------
   Q23  [LEAD()]
   For each employee, display their salary and the next employee's
   salary when employees are ordered by employee_id.
   --------------------------------------------------------------------- */
-- Your answer here



/* ---------------------------------------------------------------------
   Q24  [CTE + JOIN]
   Use a CTE to calculate each customer's total spending, then display
   the customer name and total spending.
   --------------------------------------------------------------------- */
-- Your answer here



/* ---------------------------------------------------------------------
   Q25  [Multiple JOINs]
   Display each order's order_id, customer name, order amount and order
   status.
   --------------------------------------------------------------------- */
-- Your answer here



/* ---------------------------------------------------------------------
   Q26  [GROUP BY + HAVING]
   Find order statuses that have more than one order. Display status
   and order count.
   --------------------------------------------------------------------- */
-- Your answer here



/* ---------------------------------------------------------------------
   Q27  [Subquery + MAX]
   Find all employees whose salary equals the highest salary in the
   company.
   --------------------------------------------------------------------- */
-- Your answer here



/* ---------------------------------------------------------------------
   Q28  [PARTITION BY + MAX]
   Find the highest-paid employee or employees in each department.
   --------------------------------------------------------------------- */
-- Your answer here



/* ---------------------------------------------------------------------
   Q29  [CTE + Window function]
   Use a CTE and ROW_NUMBER() to find the highest-paid employee in each
   department. Return one employee per department.
   --------------------------------------------------------------------- */
-- Your answer here



/* ---------------------------------------------------------------------
   Q30  [Combined SQL challenge]
   Find customers whose delivered-order total exceeds 3,000. Display
   customer name and delivered total using a CTE, JOIN, GROUP BY and
   HAVING.
   --------------------------------------------------------------------- */
-- Your answer here



/* ===================== END OF TEST ===================== */