-- View Existing databases
SHOW DATABASES;
-- Create new database
CREATE DATABASE company_db;
-- Use that database
USE company_db;
-- Create a new table
CREATE TABLE employees(
	id int AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100),
	dept VARCHAR(50),
	city VARCHAR(100),
	salary DECIMAL(10,3)
);
-- Insert few values in table
INSERT INTO employees (name, dept, city, salary) VALUES
('Arun Kumar', 'IT', 'Chennai', 65000.000),
('Priya Sharma', 'HR', 'Bangalore', 58000.000),
('Rahul Verma', 'Finance', 'Mumbai', 72000.000),
('Sneha Iyer', 'IT', 'Hyderabad', 81000.000),
('Karthik Raj', 'Sales', 'Chennai', 55000.000),
('Meena Das', 'Marketing', 'Pune', 63000.000),
('Vijay Anand', 'IT', 'Coimbatore' , 74000.000),
('Divya Nair', 'Finance', 'Kochi', 69000.000),
('Suresh Babu', 'Sales', 'Bangalore', 52000.000),
('Anjali Menon', 'HR', 'Chennai', 61000.000);
-- Select all columns of table and show 
SELECT * FROM employees;
-- Select specific column from the table
SELECT name FROM employees;
-- Show distinct departments of table using DISTINCT. Usage below
SELECT DISTINCT dept from employees;
-- Show limited number of columns using LIMIT, Usage below
SELECT * FROM employees LIMIT 5;
-- Set a specific word as alias for easy handling of columns, table by giving a temp name. Usage below
SELECT name as "EMPLOYEE NAME" from employees;
SELECT c.name from employees as c;

SELECT DISTINCT dept from employees limit 2;