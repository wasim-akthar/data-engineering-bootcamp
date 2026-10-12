/*
============================================================
SQL PRACTICE ASSIGNMENT — EMPLOYEE (emp) TABLE
============================================================

Topics covered:
- SELECT / Column Selection / Aliases
- Arithmetic Operations
- Filters (WHERE, AND, OR, IN, BETWEEN, LIKE, IS NULL)
- ORDER BY / DISTINCT
- Aggregate Functions
- GROUP BY
- Self JOIN (employee-manager relationship)
- CASE expressions

IMPORTANT:
- Table name: emp
- 15 sample records are provided.
- Try answering all 30 questions WITHOUT looking anything up.
- No solutions are included in this file.
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
-- SECTION 3: SELECTION, ALIAS & ARITHMETIC
-- ==========================================================

-- Q1. Display all employee details.
SELECT * FROM emp;

-- Q2. Display only employee name and salary.
SELECT EMPLOYEE_NAME, SALARY FROM emp;

-- Q3. Display employee name, job title and city.
SELECT EMPLOYEE_NAME, JOB_TITLE, CITY FROM emp;

-- Q4. Display employee name as Employee_Name.
SELECT employee_name AS 'Employee_Name' FROM emp;

-- Q5. Display city as Work_Location.
SELECT city AS 'Work_Location' FROM emp;

-- Q6. Display employee name and calculate their annual salary.
SELECT employee_name, salary, salary*12 AS 'Annual Salary' FROM emp;

-- Q7. Display employee name, age, and calculate their age after 5 years.
SELECT employee_name AS Name,age AS Age, age+5 AS 'Age after 5 Years' FROM emp;

-- Q8. Display employee name and calculate the difference between
--     annual salary and monthly salary.
SELECT employee_name AS Name, salary AS 'Monthly Salary', 
salary*12 AS "Annual Salary", ((salary*12) - salary) AS 'Difference of Annual & Monthly' FROM emp;

-- Q9. Display employee name and calculate daily salary,
--     assuming 30 days per month.
SELECT employee_name AS Name, salary AS 'Monthly Salary', ROUND(salary/30, 0) AS 'Daily Salary' FROM emp;

-- Q10. Display employee_name, salary, and annual salary with
--      suitable aliases.
SELECT employee_name AS Name, salary AS Salary, salary*12 AS 'Annual Salary' FROM emp;

-- ==========================================================
-- SECTION 4: FILTERS — WHERE / AND / OR / IN / BETWEEN / LIKE / NULL
-- ==========================================================

-- Q11. Display employees who are older than 30.
SELECT * FROM emp WHERE age > 30;

-- Q12. Display employees who work in department_id = 1.
SELECT * FROM emp WHERE department_id = 1;

-- Q13. Display employees whose gender is Female.
SELECT * FROM emp WHERE gender='Female';

-- Q14. Display employees whose salary is greater than 60000
--      AND city is Chennai.
SELECT * FROM emp WHERE salary > 60000 AND city = 'Chennai';

-- Q15. Display employees whose city is Chennai or Bangalore.
SELECT * FROM emp WHERE city IN ('Chennai', 'Bangalore');

-- Q16. Display employees whose job_title contains the word 'Manager'.
SELECT * FROM emp WHERE job_title like '%Manager%';

-- Q17. Display employees who do not have a manager
--      (manager_id IS NULL).
SELECT * FROM emp WHERE manager_id IS NULL;

-- Q18. Display employees whose age is between 25 and 35.
SELECT * FROM emp WHERE age BETWEEN 25 AND 35;

-- Q19. Display employees whose department_id is 1, 3, or 5.
SELECT * FROM emp WHERE department_id IN (1,3,5);

-- Q20. Display employees whose email ends with '@gmail.com'
--      and whose name starts with 'A'.
SELECT * FROM emp WHERE email LIKE '%@gmail.com' AND name LIKE 'A%';


-- ==========================================================
-- SECTION 5: SORTING & DISTINCT VALUES
-- ==========================================================

-- Q21. Display employees sorted by salary in descending order.
SELECT * FROM emp ORDER BY salary DESC;


-- Q22. Display employees sorted by joining_date, earliest first.
SELECT * FROM emp ORDER BY joining_date ASC;


-- Q23. Display the distinct job titles in the company.
SELECT DISTINCT job_title AS "JOBS" FROM emp;

-- Q24. Display the distinct cities where employees work.
SELECT DISTINCT city AS "CITY" FROM emp;

-- ==========================================================
-- SECTION 6: AGGREGATE FUNCTIONS & GROUP BY
-- ==========================================================

-- Q25. Display the total number of employees.
SELECT COUNT(*) FROM emp;

-- Q26. Display the average salary of all employees.
SELECT AVG(salary) AS "Average Salary" FROM emp;

-- Q27. Display the highest and lowest salary in the company.
SELECT MIN(salary) AS "Lowest Salary", MAX(salary) AS "Highest Salary" FROM emp;

-- Q28. Display the number of employees in each department_id.
SELECT department_id as "DEPT ID", COUNT(*) as "No of Employees" FROM emp GROUP BY department_id;

-- Q29. Display the average salary for each department_id.
SELECT department_id as "DEPT ID", AVG(salary) as "Average Salary" FROM emp GROUP BY department_id;

-- Q30. Display the number of employees in each city.
SELECT city as City, COUNT(*) as "No of Employees" FROM emp GROUP BY city;

-- ==========================================================
-- SECTION 7: SELF JOIN & CASE (BONUS)
-- ==========================================================

-- Q31. Display each employee's name along with their manager's
--      name (self join emp to emp using manager_id = employee_id).
SELECT e.employee_name AS 'Employee Name', m.employee_name AS 'Manager Name'
FROM emp e, emp m
WHERE m.manager_id IS NOT NULL AND e.department_id = m.manager_id;

-- Q32. Display employee name, salary, and a column named
--      Salary_Grade using CASE: 'High' if salary > 70000,
--      'Medium' if salary is between 50000 and 70000,
--      otherwise 'Low'.
SELECT employee_name AS Name, salary AS Salary,
CASE 
    WHEN salary > 70000 THEN 'High' 
    WHEN salary BETWEEN 50000 AND 70000 THEN 'Medium'
    ELSE 'Low'
END AS "Salary Grade"
FROM emp;
/*
============================================================
SQL PRACTICE ASSIGNMENT — EMPLOYEE (emp) TABLE
============================================================

Topics covered:
- SELECT / Column Selection / Aliases
- Arithmetic Operations
- Filters (WHERE, AND, OR, IN, BETWEEN, LIKE, IS NULL)
- ORDER BY / DISTINCT
- Aggregate Functions
- GROUP BY
- Self JOIN (employee-manager relationship)
- CASE expressions

IMPORTANT:
- Table name: emp
- 15 sample records are provided.
- Try answering all 30 questions WITHOUT looking anything up.
- No solutions are included in this file.
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
-- SECTION 3: SELECTION, ALIAS & ARITHMETIC
-- ==========================================================

-- Q1. Display all employee details.
SELECT * FROM emp;

-- Q2. Display only employee name and salary.
SELECT EMPLOYEE_NAME, SALARY FROM emp;

-- Q3. Display employee name, job title and city.
SELECT EMPLOYEE_NAME, JOB_TITLE, CITY FROM emp;

-- Q4. Display employee name as Employee_Name.
SELECT employee_name AS 'Employee_Name' FROM emp;

-- Q5. Display city as Work_Location.
SELECT city AS 'Work_Location' FROM emp;

-- Q6. Display employee name and calculate their annual salary.
SELECT employee_name, salary, salary*12 AS 'Annual Salary' FROM emp;

-- Q7. Display employee name, age, and calculate their age after 5 years.
SELECT employee_name AS Name,age AS Age, age+5 AS 'Age after 5 Years' FROM emp;

-- Q8. Display employee name and calculate the difference between
--     annual salary and monthly salary.
SELECT employee_name AS Name, salary AS 'Monthly Salary', salary*12 
AS "Annual Salary", ((salary*12) - salary) AS 'Difference of Annual & Monthly' FROM emp;

-- Q9. Display employee name and calculate daily salary,
--     assuming 30 days per month.
SELECT employee_name AS Name, salary AS 'Monthly Salary', ROUND(salary/30, 0) AS 'Daily Salary' FROM emp;

-- Q10. Display employee_name, salary, and annual salary with
--      suitable aliases.
SELECT employee_name AS Name, salary AS Salary, salary*12 AS 'Annual Salary' FROM emp;

-- ==========================================================
-- SECTION 4: FILTERS — WHERE / AND / OR / IN / BETWEEN / LIKE / NULL
-- ==========================================================

-- Q11. Display employees who are older than 30.
SELECT * FROM emp WHERE age > 30;

-- Q12. Display employees who work in department_id = 1.
SELECT * FROM emp WHERE department_id = 1;

-- Q13. Display employees whose gender is Female.
SELECT * FROM emp WHERE gender='Female';

-- Q14. Display employees whose salary is greater than 60000
--      AND city is Chennai.
SELECT * FROM emp WHERE salary > 60000 AND city = 'Chennai';

-- Q15. Display employees whose city is Chennai or Bangalore.
SELECT * FROM emp WHERE city IN ('Chennai', 'Bangalore');

-- Q16. Display employees whose job_title contains the word 'Manager'.
SELECT * FROM emp WHERE job_title like '%Manager%';

-- Q17. Display employees who do not have a manager
--      (manager_id IS NULL).
SELECT * FROM emp WHERE manager_id IS NULL;

-- Q18. Display employees whose age is between 25 and 35.
SELECT * FROM emp WHERE age BETWEEN 25 AND 35;

-- Q19. Display employees whose department_id is 1, 3, or 5.
SELECT * FROM emp WHERE department_id IN (1,3,5);

-- Q20. Display employees whose email ends with '@gmail.com'
--      and whose name starts with 'A'.
SELECT * FROM emp WHERE email LIKE '%@gmail.com' ;


-- ==========================================================
-- SECTION 5: SORTING & DISTINCT VALUES
-- ==========================================================

-- Q21. Display employees sorted by salary in descending order.
SELECT * FROM emp ORDER BY salary DESC;


-- Q22. Display employees sorted by joining_date, earliest first.
SELECT * FROM emp ORDER BY joining_date ASC;


-- Q23. Display the distinct job titles in the company.
SELECT DISTINCT job_title AS "JOBS" FROM emp;

-- Q24. Display the distinct cities where employees work.
SELECT DISTINCT city AS "CITY" FROM emp;

-- ==========================================================
-- SECTION 6: AGGREGATE FUNCTIONS & GROUP BY
-- ==========================================================

-- Q25. Display the total number of employees.
SELECT COUNT(*) FROM emp;

-- Q26. Display the average salary of all employees.
SELECT AVG(salary) AS "Average Salary" FROM emp;

-- Q27. Display the highest and lowest salary in the company.
SELECT MIN(salary) AS "Lowest Salary", MAX(salary) AS "Highest Salary" FROM emp;

-- Q28. Display the number of employees in each department_id.
SELECT COUNT(*) FROM emp GROUP BY department_id;

-- Q29. Display the average salary for each department_id.
SELECT AVG(salary) FROM emp GROUP BY department_id;

-- Q30. Display the number of employees in each city.
SELECT COUNT(*) FROM emp GROUP BY city;

-- ==========================================================
-- SECTION 7: SELF JOIN & CASE (BONUS)
-- ==========================================================

-- Q31. Display each employee's name along with their manager's
--      name (self join emp to emp using manager_id = employee_id).
SELECT e.employee_name AS 'Employee Name', m.employee_name AS 'Manager Name'
FROM emp e
JOIN emp m
ON e.manager_id = m.employee_id;

-- Q32. Display employee name, salary, and a column named
--      Salary_Grade using CASE: 'High' if salary > 70000,
--      'Medium' if salary is between 50000 and 70000,
--      otherwise 'Low'.
SELECT employee_name AS Name, salary AS Salary,
CASE 
    WHEN salary > 70000 THEN 'High' 
    WHEN salary BETWEEN 50000 AND 70000 THEN 'Medium'
    ELSE 'Low'
END AS "Salary Grade"
FROM emp;
