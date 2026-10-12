/*
============================================================
SQL PRACTICE ASSIGNMENT — EMPLOYEE (emp) TABLE
============================================================

Topics covered:
- DDL: CREATE, ALTER, DROP, TRUNCATE
- DML: INSERT, UPDATE, DELETE
- DQL: SELECT
- Column Selection / Aliases
- Arithmetic Operations: +, -, *, /
- Filters: WHERE, AND, OR, IN, BETWEEN, LIKE, IS NULL
- ORDER BY / DISTINCT
- Aggregate Functions
- GROUP BY
- Self JOIN
- CASE expressions

IMPORTANT:
- Main table name: emp
- 15 sample records are provided.
- Try answering all 100 questions WITHOUT looking up solutions.
- No solutions are included in this file.
- Some DDL/DML questions intentionally modify data/schema.
- If you want to preserve the original data, recreate/reset the table
  before continuing with later questions.
*/

-- ==========================================================
-- SECTION 1: TABLE SETUP
-- ==========================================================

CREATE TABLE emp (
    employee_id     INT PRIMARY KEY,
    employee_name   VARCHAR(100),
    gender          VARCHAR(10),
    age             INT,
    department_id   INT,
    job_title       VARCHAR(50),
    salary          DECIMAL(10,2),
    joining_date    DATE,
    manager_id      INT,
    city            VARCHAR(50),
    email           VARCHAR(100)
);

-- ==========================================================
-- SECTION 2: SAMPLE DATA
-- ==========================================================

INSERT INTO emp VALUES
(101, 'Arun Kumar', 'Male', 28, 1, 'Data Analyst', 55000, '2022-06-15', 105, 'Chennai', 'arun@gmail.com'),
(102, 'Priya Sharma', 'Female', 26, 1, 'Software Developer', 60000, '2023-01-10', 105, 'Chennai', 'priya@gmail.com'),
(103, 'Rahul Raj', 'Male', 32, 2, 'HR Executive', 45000, '2021-03-20', 108, 'Bangalore', 'rahul@gmail.com'),
(104, 'Sneha Devi', 'Female', 29, 3, 'Financial Analyst', 65000, '2020-08-12', 109, 'Chennai', 'sneha@gmail.com'),
(105, 'Vijay Kumar', 'Male', 38, 1, 'IT Manager', 95000, '2018-05-25', NULL, 'Chennai', 'vijay@gmail.com'),
(106, 'Divya Raj', 'Female', 27, 4, 'Marketing Executive', 48000, '2022-11-18', 110, 'Hyderabad', 'divya@gmail.com'),
(107, 'Karthik S', 'Male', 35, 5, 'Sales Manager', 85000, '2019-07-30', NULL, 'Bangalore', 'karthik@gmail.com'),
(108, 'Meena Lakshmi', 'Female', 40, 2, 'HR Manager', 80000, '2017-04-15', NULL, 'Bangalore', 'meena@gmail.com'),
(109, 'Suresh Babu', 'Male', 42, 3, 'Finance Manager', 90000, '2016-09-05', NULL, 'Chennai', 'suresh@gmail.com'),
(110, 'Anitha R', 'Female', 31, 4, 'Marketing Manager', 75000, '2020-02-10', NULL, 'Hyderabad', 'anitha@gmail.com'),
(111, 'Manoj Kumar', 'Male', 25, 1, 'Junior Developer', 40000, '2024-01-15', 105, 'Chennai', 'manoj@gmail.com'),
(112, 'Lakshmi Priya', 'Female', 30, 5, 'Sales Executive', 52000, '2022-05-20', 107, 'Bangalore', 'lakshmi@gmail.com'),
(113, 'Ravi Shankar', 'Male', 29, 1, 'Data Engineer', 70000, '2021-12-01', 105, 'Chennai', 'ravi@gmail.com'),
(114, 'Pooja Devi', 'Female', 27, 3, 'Accountant', 50000, '2023-06-10', 109, 'Chennai', 'pooja@gmail.com'),
(115, 'Ajay Kumar', 'Male', 33, 5, 'Sales Executive', 55000, '2020-10-25', 107, 'Bangalore', 'ajay@gmail.com');

-- ==========================================================
-- SECTION 3: DDL — CREATE / ALTER / DROP / TRUNCATE
-- QUESTIONS 1–20
-- ==========================================================

-- Q1. Create a database named company_db.
CREATE DATABASE company_db;

-- Q2. Create a table named departments with department_id and
--     department_name columns.
CREATE TABLE departments (
department_id INT PRIMARY KEY AUTO_INCREMENT,
department_name VARCHAR(50)
);

-- Q3. Create a table named employee_backup with the same basic
--     columns as emp.
CREATE TABLE employee_backup (
    employee_id     INT PRIMARY KEY,
    employee_name   VARCHAR(100),
    gender          VARCHAR(10),
    age             INT,
    department_id   INT,
    job_title       VARCHAR(50),
    salary          DECIMAL(10,2),
    joining_date    DATE,
    manager_id      INT,
    city            VARCHAR(50),
    email           VARCHAR(100)
);

-- Q4. Create a table named project with project_id,
--     project_name, start_date, and department_id columns.
CREATE TABLE project (
project_id INT PRIMARY KEY AUTO_INCREMENT,
start_date DATE,
department_id INT,
FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- Q5. Add a new column phone_number to the emp table.
ALTER TABLE emp ADD COLUMN phone_number VARCHAR(10);

-- Q6. Add a new column bonus to the emp table with a suitable
--     numeric data type.
ALTER TABLE emp ADD COLUMN bonus INT;

-- Q7. Add a new column status to the emp table.
ALTER TABLE emp ADD COLUMN status VARCHAR(50);

-- Q8. Modify the phone_number column so that it can store
--     up to 15 characters.
ALTER TABLE emp MODIFY COLUMN phone_number VARCHAR(15);

-- Q9. Modify the job_title column so that it can store up to
--     100 characters.
ALTER TABLE emp MODIFY COLUMN job_title VARCHAR(100);

-- Q10. Rename the column city to work_city.
ALTER TABLE emp RENAME COLUMN city TO work_city;

-- Q11. Rename the column email to email_address.
ALTER TABLE emp RENAME COLUMN email TO email_address;

-- Q12. Rename the table employee_backup to emp_backup.
RENAME TABLE emp TO employee_backup;

-- Q13. Create a table named test_employee with at least
--     three columns of your choice.
CREATE TABLE test_employee (
	emp_name VARCHAR(100),
    emp_id INT AUTO_INCREMENT,
    emp_salary DECIMAL(10,3),
    emp_job_title VARCHAR(100),
    emp_city TEXT,
    emp_gender CHAR(100)
)AUTO_INCREMENT = 1000;

-- Q14. Add a PRIMARY KEY to the employee_id column of a
--     newly created employee_test table.
ALTER TABLE emp ADD CONSTRAINT emp_id PRIMARY KEY (emp_id);

-- Q15. Add a NOT NULL constraint to a suitable column while
--     creating a new table.
CREATE TABLE test_emp (
	emp_name VARCHAR(100) NOT NULL
);

-- Q16. Create a table named department_test with a UNIQUE
--     department_name column.
CREATE TABLE department_test(
	department_name VARCHAR(100) UNIQUE
);

-- Q17. Remove the bonus column from emp.
ALTER TABLE emp DROP COLUMN bonus;

-- Q18. Remove the status column from emp.
ALTER TABLE emp DROP COLUMN status;

-- Q19. Empty all records from a practice table using TRUNCATE
--     without deleting the table itself.
TRUNCATE TABLE emp;

-- Q20. Drop the practice table created for the previous
--     DDL exercises.
DROP TABLE department_test;
DROP TABLE project;
DROP TABLE test_employee;
DROP TABLE test_emp;

-- ==========================================================
-- SECTION 4: DML — INSERT / UPDATE / DELETE
-- QUESTIONS 21–40
-- ==========================================================

-- Q21. Insert a new employee into emp with employee_id 116.
INSERT INTO emp VALUES 
(116, 'Vasanth Kumar', 'Male', 24, 1, 'Data Engineer', 85000, '2023-06-15', 103, 'Chennai', 'vasanth@gmail.com');

-- Q22. Insert another employee by specifying column names
--     explicitly instead of relying on column order.
INSERT INTO emp (employee_id, employee_name, gender , age, department_id, job_title, salary, joining_date, manager_id, city, email) VALUES
(117, 'Hari Kumar', 'Male', 25, 1, 'Data Scientist', 65000, '2023-07-19', 103, 'Chennai', 'hari@gmail.com');

-- Q23. Insert two new employees into emp using a single
--     INSERT statement.
INSERT INTO emp (employee_id, employee_name, gender , age, department_id, job_title, salary, joining_date, manager_id, city, email) VALUES
(118, 'Vikram Raj', 'Male', 29, 2, 'Data Engineer', 72000, '2022-05-14', 108, 'Bangalore', 'vikram@gmail.com'),
(119, 'Ayesha Khan', 'Female', 27, 3, 'Business Analyst', 58000, '2024-02-21', 109, 'Hyderabad', 'ayesha@gmail.com');

-- Q24. Insert an employee whose manager_id is NULL.
INSERT INTO emp (employee_id, employee_name, gender , age, department_id, job_title, salary, joining_date, manager_id, city, email) VALUES
(120, 'Sekar Babu', 'Male', 22, 2, 'Database Engineer', 45000, '2022-09-19', NULL, 'Mumbai', 'sekar@gmail.com');

-- Q25. Insert an employee from Chennai with a salary of 65000.
INSERT INTO emp (employee_id, employee_name, gender, age, department_id, job_title, salary, joining_date, manager_id, city, email) VALUES
(121, 'Naveen Kumar', 'Male', 28, 3, 'Software Engineer', 65000, '2023-04-12', 109, 'Chennai', 'naveen@gmail.com');

-- Q26. Update the salary of employee_id 101 to 58000.
UPDATE emp SET salary=58000 WHERE employee_id = 101;

-- Q27. Increase the salary of employee_id 102 by 5000.
UPDATE emp SET salary=salary+5000 WHERE employee_id = 102;

-- Q28. Increase the salary of all employees by 10%.
UPDATE emp SET salary= salary+(salary*0.1);

-- Q29. Increase the salary by 5000 for employees in
--     department_id 1.
UPDATE emp SET salary = salary+5000 WHERE department_id = 1;

-- Q30. Change the city of employee_id 106 to Chennai.
UPDATE emp SET city = "Chennai" WHERE employee_id = 106;

-- Q31. Change the job_title of employee_id 111 to
--     'Software Developer'.
UPDATE emp SET job_title = 'Software Developer' WHERE employee_id = 111;

-- Q32. Update the manager_id of a selected employee.
UPDATE emp SET manager_id = 109 WHERE employee_id = 120;

-- Q33. Set the manager_id to NULL for an employee who currently
--     has a manager.
UPDATE emp SET manager_id = NULL WHERE employee_id = 120;

-- Q34. Update the city to Bangalore for all employees in
--     department_id 5.
UPDATE emp SET city="Bangalore" WHERE department_id = 5;

-- Q35. Update the salary of employees earning less than 50000
--     by adding 3000.
UPDATE emp SET salary=salary+3000 WHERE salary < 50000;

-- Q36. Update the job title of employees whose current title
--     contains 'Executive'.
UPDATE emp SET job_title = "Senior Staff of Department" WHERE job_title LIKE '%Executive';

-- Q37. Delete the employee with employee_id 116.
DELETE FROM emp WHERE employee_id = 116;

-- Q38. Delete all employees from a selected city.
DELETE FROM emp WHERE city = "Delhi";

-- Q39. Delete employees whose salary is below 45000.
DELETE FROM emp WHERE salary < 45000;

-- Q40. Delete employees from a selected department using
--     department_id.
DELETE FROM emp WHERE department_id = 199;

-- ==========================================================
-- SECTION 5: DQL — SELECT / COLUMN SELECTION / ALIASES
-- QUESTIONS 41–55
-- ==========================================================

-- Q41. Display all columns and all employee records.
SELECT * FROM emp;

-- Q42. Display only employee_name and salary.
SELECT employee_name AS Name, salary AS Salary FROM emp;

-- Q43. Display employee_name, gender, age, and city.
SELECT employee_name AS Name, gender AS Gender, age AS Age, city AS City FROM emp;
-- Q44. Display employee_name as Employee_Name.
SELECT employee_name AS Employee_Name FROM emp;
-- Q45. Display city as Work_Location.
SELECT city AS Work_Location FROM emp;

-- Q46. Display salary as Monthly_Salary.
SELECT salary AS Monthly_Salary FROM emp;

-- Q47. Display employee_name, job_title, and salary using
--     meaningful aliases.
SELECT employee_name AS Name, job_title AS Profession, salary AS Salary FROM emp;

-- Q48. Display employee_name and annual salary.
SELECT employee_name AS Name, salary AS Monthly_Salary, salary*12 AS Annual_Salary;

-- Q49. Display employee_name, salary, and salary after adding
--     a 10% increment.
SELECT employee_name AS Name, salary AS Base_Salary, salary+(salary*0.1) AS Incremented_Salary FROM emp;

-- Q50. Display employee_name and age after 5 years.
SELECT employee_name AS Name, age AS Age, age+5 AS Age_in_5_Years FROM emp;

-- Q51. Display employee_name and calculate monthly salary
--     divided by 30 as daily salary.
SELECT employee_name AS Name, salary AS Monthly_Salary, salary/30 AS Daily_Salary FROM emp;

-- Q52. Display employee_name and calculate annual salary
--     divided by 12.
SELECT employee_name AS Name, salary*12 AS Annual_Salary FROM emp;

-- Q53. Display employee_name, salary, annual salary, and
--     daily salary in one query.
SELECT employee_name AS Name,  salary/30 AS Daily_Salary, salary AS Monthly_Salary, salary*12 AS Annual_Salary FROM emp;

-- Q54. Display employee_name and calculate the salary remaining
--     after deducting 10% from the monthly salary.
SELECT employee_name AS Name, salary AS Salary, salary - (salary*0.1) AS Deducted_Salary FROM emp;
-- Q55. Display employee_name and calculate annual salary after
--     adding a yearly bonus of 12000.
SELECT employee_name AS Name, salary AS Salary, salary*12 AS Annual_Salary, salary*12 AS Annual_Salary, 12000 AS Bonus, (salary*12)+12000 AS Bonus_PA FROM emp;
-- ==========================================================
-- SECTION 6: DQL — FILTERS
-- QUESTIONS 56–75
-- ==========================================================

-- Q56. Display employees older than 30.
SELECT * FROM emp WHERE age > 30;

-- Q57. Display employees younger than 30.
SELECT * FROM emp WHERE age < 30;

-- Q58. Display employees whose age is exactly 30.
SELECT * FROM emp WHERE age = 30;

-- Q59. Display employees whose salary is greater than 60000.
SELECT * FROM emp WHERE salary > 60000;

-- Q60. Display employees whose salary is less than 50000.
SELECT * FROM emp WHERE salary < 50000;

-- Q61. Display employees whose salary is greater than 60000
--      AND who work in Chennai.
SELECT * FROM emp WHERE salary > 60000 AND city = "Chennai";

-- Q62. Display employees whose salary is greater than 60000
--      OR whose age is greater than 40.
SELECT * FROM emp WHERE salary > 60000 AND city = "Chennai";

-- Q63. Display employees who work in Chennai or Bangalore
--      using OR.
SELECT * FROM emp WHERE city = "Chennai" OR city = "Bangalore";

-- Q64. Display employees who work in Chennai or Bangalore
--      using IN.
SELECT * FROM emp WHERE city IN ("Chennai", "Bangalore");

-- Q65. Display employees whose department_id is 1, 3, or 5.
SELECT * FROM emp WHERE department_id IN (1,3,5);

-- Q66. Display employees whose salary is between 50000 and
--      80000.
SELECT * FROM emp WHERE salary BETWEEN 50000 AND 80000;

-- Q67. Display employees whose age is between 25 and 30.
SELECT * FROM emp WHERE age BETWEEN 25 AND 30;

-- Q68. Display employees whose job_title contains 'Manager'.
SELECT * FROM emp WHERE job_title LIKE '%Manager%';

-- Q69. Display employees whose job_title starts with 'Sales'.
SELECT * FROM emp WHERE job_title LIKE 'Sales%';

-- Q70. Display employees whose employee_name starts with 'A'.
SELECT * FROM emp WHERE employee_name LIKE 'A%';

-- Q71. Display employees whose employee_name ends with 'Kumar'.
SELECT * FROM emp WHERE employee_name LIKE '%Kumar';

-- Q72. Display employees whose email ends with '@gmail.com'.
SELECT * FROM emp WHERE email LIKE '%@gmail.com';

-- Q73. Display employees who do not have a manager.
SELECT * from EMP WHERE manager_id IS NULL;

-- Q74. Display employees who have a manager.
SELECT * from EMP WHERE manager_id IS NOT NULL;

-- Q75. Display employees who are Female AND whose salary is
--      greater than 50000.
SELECT * from EMP WHERE gender="Female" AND salary > 50000;

-- ==========================================================
-- SECTION 7: DQL — COMBINED FILTERS / DISTINCT / ORDER BY
-- QUESTIONS 76–82
-- ==========================================================

-- Q76. Display employees from Chennai whose salary is between
--      50000 and 90000.
SELECT * FROM emp WHERE city = "Chennai" AND salary BETWEEN 50000 AND 90000;

-- Q77. Display employees from Chennai or Bangalore whose age
--      is greater than 30
SELECT * FROM emp WHERE city IN ('Chennai', 'Bangalore') AND age > 30; 

-- Q78. Display employees whose department_id is 1 or 5 AND
--      whose salary is greater than 50000.
SELECT * FROM emp WHERE department_id IN (1,5) AND salary > 50000;

-- Q79. Display distinct cities in the company.
SELECT DISTINCT city FROM emp;

-- Q80. Display distinct department_id values.
SELECT DISTINCT department_id FROM emp;

-- Q81. Display employees sorted by salary from highest to lowest.
SELECT employee_name AS Name, salary AS Salary FROM emp ORDER BY salary DESC; 

-- Q82. Display employees sorted by joining_date from earliest
--      to latest.
SELECT employee_name AS Name, joining_date AS Joining_Date FROM emp ORDER BY joining_date ASC; 

-- ==========================================================
-- SECTION 8: ARITHMETIC OPERATIONS
-- QUESTIONS 83–87
-- ==========================================================

-- Q83. Display employee_name and salary increased by 5000
--      using the + operator.
SELECT employee_name AS Name, salary AS Salary, 5000 AS Amount, salary+5000 AS Extra_Salary FROM emp;

-- Q84. Display employee_name and salary after deducting 2000
--      using the - operator.
SELECT employee_name AS Name, salary AS Salary, 2000 AS Deduction, salary-2000 AS Deducted_Salary FROM emp;

-- Q85. Display employee_name and annual salary using *.
SELECT employee_name AS Name, salary AS Salary, salary*12 AS Annual_Salary FROM emp;

-- Q86. Display employee_name and daily salary using /,
--      assuming 30 days per month.
SELECT employee_name AS Name, salary/30 AS Daily_Salary FROM emp;

-- Q87. Display employee_name, original salary, salary + 5000,
--      salary - 2000, salary * 12, and salary / 30 in one query.
SELECT employee_name AS Name,
salary AS Original_Salary,
salary+5000 AS Incremented_Salary,
salary-2000 AS Decremented_Salary,
salary*12 AS Annual_Salary,
salary/30 AS Daily_Salary
FROM emp;

-- ==========================================================
-- SECTION 9: AGGREGATE FUNCTIONS
-- QUESTIONS 88–93
-- ==========================================================

-- Q88. Display the total number of employees.
SELECT COUNT(*) FROM emp;

-- Q89. Display the total salary paid to all employees.
SELECT SUM(salary) FROM emp;

-- Q90. Display the average salary of all employees.
SELECT AVG(salary) FROM emp;

-- Q91. Display the highest salary in the company.
SELECT MAX(salary) FROM emp;

-- Q92. Display the lowest salary in the company.
SELECT MIN(salary) FROM emp;

-- Q93. Display the total, average, highest, and lowest salary
--      in a single query using aliases.
SELECT
COUNT(*),
SUM(salary),
AVG(salary),
MAX(salary),
MIN(salary)
FROM emp;

-- ==========================================================
-- SECTION 10: GROUP BY
-- QUESTIONS 94–98
-- ==========================================================

-- Q94. Display the number of employees in each department.
SELECT department_id AS Dept_ID, COUNT(*) AS Number_Of_Employees FROM emp GROUP BY department_id;

-- Q95. Display the average salary for each department.
SELECT department_id AS Dept_ID, AVG(salary) AS Average_Salary FROM emp GROUP BY department_id;

-- Q96. Display the total salary paid for each department.
SELECT department_id AS Dept_ID, SUM(salary) AS Total_Salary FROM emp GROUP BY department_id;

-- Q97. Display the number of employees in each city.
SELECT city AS City, COUNT(*) AS Number_Of_Employees FROM emp GROUP BY city;

-- Q98. Display the average salary for each city.
SELECT city AS City, AVG(salary) AS Average_Salary FROM emp GROUP BY city;

-- ==========================================================
-- SECTION 11: SELF JOIN / CASE / COMBINED PRACTICE
-- QUESTIONS 99–100
-- ==========================================================

-- Q99. Display each employee's name along with their manager's
--      name using a self JOIN on manager_id and employee_id.
SELECT e.employee_name AS Employee_Name, m.employee_name AS Manager_Name
FROM emp AS e
JOIN emp as m
ON e.manager_id = m.employee_id;

-- Q100. Display employee_name, salary, and Salary_Grade using CASE:
--       High   -> salary greater than 70000
--       Medium -> salary between 50000 and 70000
--       Low    -> otherwise.
SELECT employee_name AS Name, salary AS Salary,
CASE 
    WHEN salary > 70000 THEN 'High' 
    WHEN salary BETWEEN 50000 AND 70000 THEN 'Medium'
    ELSE 'Low'
END AS "Salary Grade"
FROM emp;
-- ==========================================================
-- END OF ASSIGNMENT
-- ==========================================================

/*
SELF-CHECK:
- Questions 1–20   : DDL
- Questions 21–40  : DML
- Questions 41–82  : DQL / SELECT / Filters / Aliases / Sorting
- Questions 83–87  : Arithmetic
- Questions 88–93  : Aggregate Functions
- Questions 94–98  : GROUP BY
- Questions 99–100 : Self JOIN / CASE

No solutions are intentionally provided.
*/
