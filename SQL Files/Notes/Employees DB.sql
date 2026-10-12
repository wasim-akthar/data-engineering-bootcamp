/*
Objectives:
1. Create the database employee_management.
2. Select the database using USE.
3. Create the employees table.
4. Insert 10 employee records into the table.
5. Display the table structure using DESC.
6. Display all employee records using SELECT *.
*/

-- Create Database named employee_management

CREATE DATABASE employee_management;

-- Select the Database using USE

USE employee_management;

-- Create Employees Table

CREATE TABLE Employees(
emp_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
role VARCHAR(100),
exp_years INT,
age INT
);

-- Insert 10 employees records into the table

INSERT INTO Employees (name, role, exp_years, age) VALUES
('Arun Kumar', 'Software Engineer', 3, 26),
('Priya Sharma', 'Data Analyst', 2, 24),
('Rahul Verma', 'Senior Developer', 7, 32),
('Sneha Iyer', 'UI/UX Designer', 4, 28),
('Karthik Raj', 'DevOps Engineer', 5, 30),
('Meena Das', 'Project Manager', 9, 36),
('Vijay Anand', 'QA Engineer', 3, 27),
('Divya Nair', 'Business Analyst', 6, 31),
('Suresh Babu', 'Backend Developer', 8, 34),
('Anjali Menon', 'Software Tester', 1, 23);

-- Using DESC, Display the Table Structure

DESC Employees;

-- Display All records using SELECT *

SELECT * FROM Employees 

