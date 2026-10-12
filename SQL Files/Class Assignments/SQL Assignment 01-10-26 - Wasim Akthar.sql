/*
============================================================
SQL PRACTICE ASSIGNMENT — EMPLOYEE (emp) TABLE
============================================================

Topic: Sorting, Ranking & Pagination
(ORDER BY, LIMIT, OFFSET, Top-N, Nth Highest/Lowest, Pagination)

IMPORTANT:
- Table name: emp
- 15 sample records are provided.
- Try answering all 50 questions WITHOUT looking anything up.
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
-- SECTION 3: TOP-N / BOTTOM-N
-- ==========================================================

-- Q1. Find the top 5 highest-paid employees.
SELECT * FROM emp ORDER BY salary DESC LIMIT 5;

-- Q2. Find the 3 lowest-paid employees.
SELECT * FROM emp ORDER BY salary ASC LIMIT 3;

-- Q3. Display only the first 10 employees.
SELECT * FROM emp ORDER BY employee_id ASC LIMIT 10;

-- Q4. Display the 6th to 10th highest-paid employees.
SELECT * FROM emp ORDER BY salary DESC LIMIT 5 OFFSET 5;

-- Q5. Skip the first 5 employees and display the next 5 employees.
SELECT * FROM emp LIMIT 5 OFFSET 5;

-- Q6. Find the 6th highest salary.
SELECT * FROM emp ORDER BY salary DESC LIMIT 1 OFFSET 5;

-- Q7. Find the 3rd highest-paid employee.
SELECT * FROM emp ORDER BY salary DESC LIMIT 1 OFFSET 2;

-- Q8. Find the top 3 highest-paid employees from Chennai.
SELECT * FROM emp WHERE city = 'Chennai' ORDER BY salary DESC LIMIT 3;

-- Q9. Find the top 2 highest-paid female employees.
SELECT * FROM emp WHERE gender = 'Female' ORDER BY salary DESC LIMIT 2;

-- Q10. Find the second page of employees, where each page contains
--      5 employees, sorted by salary from highest to lowest.
SELECT * FROM emp ORDER BY salary DESC LIMIT 5 OFFSET 5;

-- Q11. Find the third page of employees, where each page contains
--      5 employees.
SELECT * FROM emp ORDER BY salary DESC LIMIT 5 OFFSET 10;

-- ==========================================================
-- SECTION 4: SORTING — ORDER BY / ASC / DESC
-- ==========================================================

-- Q12. Display employees by city alphabetically and salary from
--      highest to lowest within each city.
SELECT * FROM emp ORDER BY city ASC, salary DESC; 

-- Q13. Display employees alphabetically by name.
SELECT * FROM emp ORDER BY employee_name;

-- Q14. Display employees from oldest to youngest.
SELECT * FROM emp ORDER BY age DESC;

-- Q15. Display employees from youngest to oldest.
SELECT * FROM emp ORDER BY age;

-- Q16. Display employees from lowest salary to highest salary.
SELECT * FROM emp ORDER BY salary;

-- Q17. Display employees from highest salary to lowest salary.
SELECT * FROM emp ORDER BY salary DESC;

-- ==========================================================
-- SECTION 5: MORE TOP-N / BOTTOM-N VARIATIONS
-- ==========================================================

-- Q18. Find the top 5 highest-paid male employees.
SELECT * FROM emp WHERE gender='Male' ORDER BY salary DESC LIMIT 5;

-- Q19. Find the top 3 highest-paid employees from Bangalore.
SELECT * FROM emp WHERE city='Bangalore' ORDER BY salary DESC LIMIT 3;

-- Q20. Find the 4th highest salary.
SELECT * FROM emp ORDER BY salary DESC LIMIT 1 OFFSET 3;

-- Q21. Find the 2nd lowest-paid employee.
SELECT * FROM emp ORDER BY salary LIMIT 1 OFFSET 1;

-- Q22. Find the top 3 oldest employees.
SELECT * FROM emp ORDER BY age DESC LIMIT 3;

-- Q23. Find the top 3 youngest employees.
SELECT * FROM emp ORDER BY age LIMIT 3;

-- Q24. Display the first 5 employees who joined the company
--      (earliest joining_date).
SELECT * FROM emp ORDER BY joining_date LIMIT 5;

-- Q25. Display the last 5 employees who joined the company
--      (most recent joining_date).
SELECT * FROM emp ORDER BY joining_date DESC LIMIT 5;

-- Q26. Find the top 5 highest-paid employees, excluding the top 2
--      (i.e. ranks 3 to 7).
SELECT * FROM emp ORDER BY salary DESC LIMIT 5 OFFSET 2;

-- Q27. Find the top 2 highest-paid employees in the IT department
--      (department_id = 1).
SELECT * FROM emp WHERE department_id = 1 ORDER BY salary DESC LIMIT 2;

-- Q28. Find the top 2 highest-paid employees in the Sales
--      department (department_id = 5).
SELECT * FROM emp WHERE department_id = 5 ORDER BY salary DESC LIMIT 2;

-- ==========================================================
-- SECTION 6: MULTI-COLUMN SORTING
-- ==========================================================

-- Q29. Display employees sorted by department_id, then by salary
--      (highest to lowest) within each department.
SELECT * FROM emp ORDER BY department_id DESC, salary DESC; 

-- Q30. Display employees sorted by age ascending, and for employees
--      with the same age, sort by name alphabetically.
SELECT * FROM emp ORDER BY age, employee_name; 

-- Q31. Display employees sorted by city, and within each city
--      sorted by employee_name alphabetically.
SELECT * FROM emp ORDER BY city, employee_name; 

-- Q32. Display employees sorted alphabetically by city in
--      descending order (Z to A).
SELECT * FROM emp ORDER BY city DESC;

-- Q33. Display all employees sorted by salary descending, and for
--      ties, sort by employee_name alphabetically.
SELECT * FROM emp ORDER BY salary DESC, employee_name;

-- ==========================================================
-- SECTION 7: PAGINATION
-- ==========================================================

-- Q34. Find the first page of employees, where each page contains
--      4 employees, sorted by employee_name alphabetically.
SELECT * FROM emp ORDER BY employee_name LIMIT 4;

-- Q35. Find the second page of employees, where each page contains
--      4 employees, sorted by employee_name alphabetically.
SELECT * FROM emp ORDER BY employee_name LIMIT 4 OFFSET 4;

-- Q36. Skip the first 3 employees and display the next 4, sorted
--      by salary descending.
SELECT * FROM emp ORDER BY salary DESC LIMIT 4 OFFSET 3;

-- Q37. Find the middle 5 employees when sorted by salary
--      (ranks 6 to 10, highest to lowest).
SELECT * FROM emp ORDER BY salary DESC LIMIT 5 OFFSET 5;

-- ==========================================================
-- SECTION 8: FILTERED TOP-N / NTH VALUE
-- ==========================================================

-- Q38. Find the top 1 highest-paid employee overall.
SELECT * FROM emp ORDER BY salary DESC LIMIT 1;

-- Q39. Find the bottom 1 lowest-paid employee overall.
SELECT * FROM emp ORDER BY salary LIMIT 1;

-- Q40. Display the 5 most recently joined employees.
SELECT * FROM emp ORDER BY joining_date DESC LIMIT 5;

-- Q41. Display the 5 earliest joined employees.
SELECT * FROM emp ORDER BY joining_date LIMIT 5;

-- Q42. Find the 3rd most recently joined employee.
SELECT * FROM emp ORDER BY joining_date DESC LIMIT 1 OFFSET 2;

-- Q43. Find the top 3 highest-paid employees who do not have a
--      manager.
SELECT * FROM emp WHERE manager_id IS NULL ORDER BY salary DESC LIMIT 3;

-- Q44. Find the top 4 highest-paid employees among those older
--      than 30.
SELECT * FROM emp WHERE age > 30 ORDER BY salary DESC LIMIT 4;

-- Q45. Find the 2nd highest salary among female employees.
SELECT * FROM emp WHERE gender = 'Female' ORDER BY salary DESC LIMIT 1 OFFSET 1;

-- Q46. Find the top 3 highest-paid employees who joined after
--      2021-01-01.
SELECT * FROM emp WHERE joining_date > '2021-01-01' ORDER BY salary DESC LIMIT 3;

-- Q47. Find the 7th highest-paid employee.
SELECT * FROM emp ORDER by salary DESC LIMIT 1 OFFSET 6;

-- ==========================================================
-- SECTION 9: SELECTIVE COLUMNS WITH TOP-N
-- ==========================================================

-- Q48. Find the top 5 highest-paid employees, showing only
--      employee_name and salary.
SELECT employee_name AS Name, salary AS Salary FROM emp ORDER BY salary DESC LIMIT 5;

-- Q49. Find the lowest 5 paid employees, showing only
--      employee_name, department_id, and salary.
SELECT employee_name AS Name, department_id as ID, salary AS Salary FROM emp ORDER BY salary LIMIT 5;

-- Q50. Find the top 3 highest-paid employees in each of the
--      Chennai and Bangalore offices combined, showing
--      employee_name, city, and salary.
(SELECT employee_name AS Name, city AS City, salary AS Salary FROM emp
 WHERE city = 'Chennai' ORDER BY salary DESC LIMIT 3)
UNION ALL
(SELECT employee_name AS Name, city AS City, salary AS Salary FROM emp
 WHERE city = 'Bangalore' ORDER BY salary DESC LIMIT 3);

