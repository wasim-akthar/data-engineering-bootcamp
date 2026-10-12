/*
============================================================
SQL PRACTICE ASSIGNMENT — EMPLOYEE (emp) TABLE
============================================================
*/

-- Q1. Find the top 3 highest-paid employees from Chennai.
SELECT * FROM emp WHERE city = 'Chennai' ORDER BY salary DESC LIMIT 3;


-- Q2. Find the top 2 highest-paid female employees.
SELECT * FROM emp WHERE gender = 'Female' ORDER BY salary DESC LIMIT 2;

-- Q3. Find the average salary of employees who earn more than
--     ₹50,000, grouped by city.
SELECT city AS City, ROUND(AVG(salary), 2) AS 'Average Salary' FROM emp WHERE salary > 50000 GROUP BY city;

-- Q4. Find the average salary of employees who earn more than
--     ₹50,000, grouped by department.
SELECT department_id AS Dept_ID, ROUND(AVG(salary), 2) AS 'Average Salary' FROM emp 
WHERE salary > 50000 GROUP BY department_id ORDER BY department_id;

-- Q5. Find the number of employees in each city and display the
--     cities with the highest employee count first.
SELECT city AS City, COUNT(*) AS 'Number of Employees' FROM emp GROUP BY city ORDER BY COUNT(*) DESC;

-- Q6. Find the top 2 cities based on average employee salary.
SELECT city AS City, ROUND(AVG(salary), 2) AS 'Average Salary' FROM emp GROUP BY city ORDER BY AVG(salary) DESC LIMIT 2;

-- Q7. Find the second page of employees, where each page contains
--     5 employees, sorted by salary from highest to lowest.
SELECT * FROM emp ORDER BY salary DESC LIMIT 5 OFFSET 5;

-- Q8. Find the third page of employees, where each page contains
--     5 employees.
SELECT * FROM emp ORDER BY salary DESC LIMIT 5 OFFSET 10;