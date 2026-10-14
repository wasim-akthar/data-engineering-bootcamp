-- Subqueries study

CREATE DATABASE study_db;
USE study_db;

CREATE TABLE employees (
	employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary INT,
    CONSTRAINT department_fk FOREIGN KEY (department) REFERENCES departments(department)
);

CREATE TABLE departments (
department VARCHAR(50) PRIMARY KEY,
salary INT
);

INSERT INTO departments VALUES
('IT',1000000),
('HR',60000),
('Sales',80000);

INSERT INTO employees (employee_name, department, salary)
VALUES
('Asha', 'IT', 60000),
('Bala', 'HR', 45000),
('Charan', 'IT', 75000),
('Divya', 'Sales', 50000);

/*
SINGLE ROW SUBQUERY

A single row Subquery returns value consisting of one row only 
Here, This query returns employees where salary is greater than bala's salary
*/

SELECT employee_name, salary
FROM employees
WHERE salary > (
	SELECT salary
    FROM employees
    WHERE employee_name = 'Bala'
);

/*
Multiple Row Subquery

The Inner query returns multiple values which can be used for comparing in operators such as IN, ANY, etc

This query returns all the employees whose budget is or above 80000
*/

ALTER TABLE departments RENAME COLUMN salary TO budget;

SELECT * FROM employees
WHERE department IN (
SELECT department FROM departments WHERE budget >= 80000
);

/*
Correlated Subquery

A correlated subquery is a subquery that depends on values from the outer query. 
It references a column from the outer query and is logically evaluated for each row 
processed by the outer query.

Unlike a regular subquery, which can run independently, 
a correlated subquery uses the current row's values from the outer query to determine its result.

This query returns the employees whose salary is greater than the average salary of their own department.
*/

SELECT e.employee_name, e.department, e.salary
FROM employees AS e
WHERE e.salary > (
	SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department = e.department
);

/*EXISTS 


*/


SELECT d.department
FROM departments d
WHERE EXISTS (
	SELECT 1
    FROM employees e
    WHERE e.department = d.department
);
