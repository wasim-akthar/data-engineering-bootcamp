show databases;
use company_db;
show tables;
SELECT * FROM employees;

SELECT name, salary as "Base Salary", ROUND((salary + (salary*0.1)), 2) as "With Bonus" from employees;

CREATE TABLE employee_details (
    employee_id       INT PRIMARY KEY,
    employee_name     VARCHAR(100),
    department        VARCHAR(50),
    salary            DECIMAL(10,2),
    city              VARCHAR(50),
    joining_date      DATE
);
INSERT INTO employee_details
(employee_id, employee_name, department, salary, city, joining_date)
VALUES
(111, 'Arun', 'IT', 45000, 'Chennai', '2023-01-15'),
(102, 'Priya', 'HR', 38000, 'Bangalore', '2022-06-20'),
(103, 'Karthik', 'IT', 55000, 'Chennai', '2021-08-10'),
(104, 'Divya', 'Finance', 48000, 'Pondicherry', '2023-03-12'),
(105, 'Rahul', 'Sales', 35000, 'Coimbatore', '2022-11-05');

SELECT 
employee_name AS "Name",
salary AS "Base Salary",
"20%" AS "Bonus",
salary*0.2 AS "Bonus Amount",
ROUND((salary + salary*0.2), 2) AS "Bonus Salary"
FROM employee_details;

SELECT
employee_id, 
employee_name, 
department,
employee_id, 
employee_name, 
department
FROM employee_details;

SELECT
city AS "City",
salary AS "Salary",
employee_id AS "ID",
"hello" AS "Welcome Message",
10+20 AS "Onboard Days"
FROM employee_details;

SELECT
UPPER(city) AS "City",
employee_id+salary AS "Admission Amount",
city+salary AS "City + Salary"
FROM employee_details;

drop table employee_details;

