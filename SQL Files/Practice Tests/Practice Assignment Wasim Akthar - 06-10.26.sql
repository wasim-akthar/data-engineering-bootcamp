/*
============================================================
SQL PRACTICE ASSIGNMENT — EMPLOYEE (emp) TABLE
============================================================

Topics covered:
- SELECT / Aliases / Arithmetic
- Filters (WHERE, AND, OR, IN, BETWEEN, IS NULL)
- Aggregate Functions
- GROUP BY
- ORDER BY / LIMIT / OFFSET (Top-N, Nth Highest, Pagination)

IMPORTANT:
- Table name: emp
- Try answering all 30 questions WITHOUT looking anything up.
- No solutions are included in this file.
*/

-- ==========================================================
-- QUESTIONS
-- ==========================================================

-- Q1. Display the employee name, job title, and salary of all
--     employees.
SELECT employee_name AS Name, job_title AS "Profession", salary AS Salary FROM emp;

-- Q2. Display employee name as Employee_Name and city as
--     Work_Location.
SELECT employee_name AS Employee_Name, city AS "Work_Location" FROM emp;

-- Q3. Display employee name and calculate the annual salary
--     using the monthly salary.
SELECT employee_name AS Name, salary AS 'Monthly Salary', salary * 12 AS "Annual Salary" FROM emp;

-- Q4. Find all employees who work in Chennai.
SELECT * FROM emp WHERE city = 'Chennai';

-- Q5. Find employees whose salary is greater than ₹60,000.
SELECT * FROM emp WHERE salary > 60000;

-- Q6. Find all female employees whose salary is greater than
--     ₹50,000.
SELECT * FROM emp WHERE gender = 'Female' AND salary > 50000;

-- Q7. Display employees from highest salary to lowest salary.
SELECT * FROM emp ORDER BY salary DESC;

-- Q8. Find the top 5 highest-paid employees.
SELECT * FROM emp ORDER BY salary DESC LIMIT 5;

-- Q9. Find the 3 lowest-paid employees.
SELECT * FROM emp ORDER BY salary ASC LIMIT 3;

-- Q10. Find the total number of employees in the company.
SELECT COUNT(*) AS 'Total Employees' FROM emp;

-- Q11. Find the total salary paid to all employees.
SELECT SUM(salary) AS 'Total Salary' FROM emp;

-- Q12. Find the average salary of all employees.
SELECT AVG(salary) AS 'Average Salary' FROM emp;

-- Q13. Find the highest salary and display it as Highest_Salary.
SELECT MAX(salary) AS 'Highest_Salary' FROM emp;

-- Q14. Find the lowest salary and display it as Lowest_Salary.
SELECT MIN(salary) AS 'Lowest_Salary' FROM emp;

-- Q15. Find the number of employees in each department.
SELECT department_id, COUNT(*) FROM emp GROUP BY department_id;

-- Q16. Find the average salary of each department.
SELECT department_id, AVG(salary) FROM emp GROUP BY department_id;

-- Q17. Find the total salary paid by each department and display
--      the result from highest total salary to lowest.
SELECT department_id, SUM(salary) FROM emp GROUP BY department_id ORDER BY SUM(salary) DESC;

-- Q18. Find the maximum salary in each department and sort the
--      result from highest to lowest.
SELECT department_id, MAX(salary) FROM emp GROUP BY department_id ORDER BY MAX(salary) DESC;

-- Q19. Find the number of employees in each city.
SELECT COUNT(*) FROM emp GROUP BY city;

-- Q20. Find employees whose salary is between ₹50,000 and ₹80,000.
SELECT * FROM emp WHERE salary BETWEEN 50000 AND 80000;

-- Q21. Find employees who work in Chennai or Bangalore.
SELECT * FROM emp WHERE city IN ('Chennai', 'Bangalore');

-- Q22. Find employees who do not have a manager.
SELECT * FROM emp WHERE manager_id IS NULL;

-- Q23. Find employees whose age is greater than 30 and salary is
--      greater than ₹70,000.
SELECT * FROM emp WHERE age > 30 AND salary > 70000;

-- Q24. Display employee name, salary, and annual salary, where
--      annual salary is calculated as salary × 12.
SELECT employee_name AS Name, salary AS 'Salary', salary * 12 AS "Annual Salary" FROM emp;

-- Q25. Find the top 3 highest-paid employees in Chennai.
SELECT * FROM emp WHERE city = 'Chennai' ORDER BY salary DESC LIMIT 3;

-- Q26. Find the top 2 highest-paid female employees.
SELECT * FROM emp WHERE gender = 'Female' ORDER BY salary DESC LIMIT 2;

-- Q27. Find the average salary of employees earning more than
--      ₹50,000, grouped by city.
SELECT AVG(salary) FROM emp WHERE salary > 50000 GROUP BY city;

-- Q28. Find the number of employees in each department, and
--      display departments from the highest employee count to
--      the lowest.
SELECT department_id, COUNT(*) FROM emp GROUP BY department_id ORDER BY COUNT(*) DESC;

-- Q29. Skip the first 5 highest-paid employees and display the
--      next 5 employees.
SELECT * FROM emp ORDER BY salary DESC LIMIT 5 OFFSET 5;

-- Q30. Find the 3rd highest-paid employee using ORDER BY, LIMIT,
--      and OFFSET.
SELECT * FROM emp ORDER BY salary DESC LIMIT 1 OFFSET 2;