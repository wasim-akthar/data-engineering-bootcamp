/*
============================================================
SQL PRACTICE ASSIGNMENT — EMPLOYEE (emp) TABLE
============================================================

Topic: Filters — WHERE / AND / OR / IN / BETWEEN / NOT

Instructions:
- Table name: emp
- Write SQL queries for all 10 questions.
- No solutions are included.
*/

SELECT * FROM emp;

-- ==========================================================
-- QUESTIONS
-- ==========================================================

-- Q1. Find all employees who report to employee 105.
SELECT * FROM emp WHERE manager_id = 105;

-- Q2. Find employees who belong to IT, Finance, or Sales departments.
SELECT * FROM emp WHERE department_id IN (4,5,1);

-- Q3. Find employees whose salary is not between ₹50,000 and ₹80,000.
SELECT * FROM emp WHERE NOT salary BETWEEN 50000 AND 80000;

-- Q4. Find employees who work in Chennai or Hyderabad and are below 35 years old.
SELECT * FROM emp WHERE city IN ('Chennai', 'Hyderabad') AND age < 35;

-- Q5. Find employees who joined before 2020 and earn more than ₹70,000.
SELECT * FROM emp WHERE joining_date < '2020-01-01' AND salary > 70000;

-- Q6. Find employees who work in the IT department and whose salary is between ₹50,000 and ₹80,000.
SELECT * FROM emp WHERE department_id IN (1) AND salary BETWEEN 50000 AND 80000;

-- Q7. Find female employees who work either in Chennai or Bangalore.
SELECT * FROM emp WHERE gender = 'Female' AND city IN ('Chennai', 'Bangalore');

-- Q8. Find employees who are above 30 years old and earn less than ₹80,000.
SELECT * FROM emp WHERE age > 30 AND salary < 80000;

-- Q9. Find employees who joined between January 1, 2020 and December 31, 2022.
SELECT * FROM emp WHERE joining_date BETWEEN '2020-01-01' AND '2022-12-31';

-- Q10. Find employees who do not work in Chennai and earn more than ₹50,000.
SELECT * FROM emp WHERE city NOT IN ('Chennai') AND salary > 50000;

