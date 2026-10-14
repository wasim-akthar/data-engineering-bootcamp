/*
============================================================
SQL PRACTICE ASSIGNMENT — EMPLOYEE, DEPARTMENT & PROJECT
============================================================

Topic: SQL JOINS

Tables:
- Departments
- Employees
- Projects

IMPORTANT:
- Try answering all 15 questions WITHOUT looking anything up.
- No solutions are included in this file.
- Use the JOIN syntax provided at the end as a reference.
*/

-- ==========================================================
-- SECTION 1: TABLE SETUP
-- ==========================================================

CREATE TABLE Departments (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50)
);

CREATE TABLE Employees_Info (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Dept_ID INT,
    Salary INT
);

CREATE TABLE Projects (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100),
    Dept_ID INT
);

-- ==========================================================
-- SECTION 2: SAMPLE DATA
-- ==========================================================

INSERT INTO Departments (Dept_ID, Dept_Name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations'),
(6, 'Sales');

INSERT INTO Employees_Info (Emp_ID, Emp_Name, Dept_ID, Salary)
VALUES
(101, 'Arun', 1, 40000),
(102, 'Priya', 2, 45000),
(103, 'Karthik', 1, 50000),
(104, 'Divya', 3, 55000),
(105, 'Rahul', NULL, 35000),
(106, 'Sneha', 5, 48000),
(107, 'Vijay', 2, 42000),
(108, 'Meena', 8, 60000);

INSERT INTO Projects (Project_ID, Project_Name, Dept_ID)
VALUES
(201, 'Banking Analytics', 1),
(202, 'Employee Portal', 2),
(203, 'Financial Dashboard', 3),
(204, 'Marketing Analysis', 4),
(205, 'Inventory System', 5),
(206, 'Sales Dashboard', 6),
(207, 'AI Automation', 8);

SELECT * FROM departments;

-- ==========================================================
-- SECTION 3: INNER JOIN
-- ==========================================================

-- Q1. Display the employee name and department name for
--     employees who have a matching department.
SELECT e.Emp_Name AS "Employee Name", d.Dept_Name AS 'Department Name' FROM Departments AS d 
INNER JOIN Employees_Info AS e ON d.Dept_ID = e.Dept_ID;

-- Q2. Display Emp_ID, Emp_Name, Salary, and Dept_Name
--     for all employees who have a matching department.
SELECT e.Emp_ID AS "Employee ID", e.Emp_Name AS "Employee Name",e.Salary AS 'Salary', d.Dept_Name AS 'Department' FROM Departments AS d 
INNER JOIN Employees_Info AS e ON d.Dept_ID = e.Dept_ID;


-- Q3. Using INNER JOIN, display employees who belong to
--     the IT or HR department.

SELECT * FROM Departments AS d 
INNER JOIN Employees_Info AS e ON d.Dept_ID = e.Dept_ID
WHERE d.Dept_Name IN ('IT', 'HR');
-- ==========================================================
-- SECTION 4: LEFT JOIN
-- ==========================================================

-- Q4. Display all employees along with their department names.
--     Employees without a matching department should also
--     be displayed.
SELECT * FROM Employees_Info AS e 
LEFT JOIN Departments AS d ON e.Dept_ID = d.Dept_ID;

-- Q5. Find the employees who do not have a matching department.
SELECT e.* FROM Employees_Info AS e 
LEFT JOIN Departments AS d ON e.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- Q6. Display all employees and their assigned project names,
--     including employees who are not assigned to any project.
SELECT e.Emp_Name, p.Project_Name FROM Employees_Info AS e 
LEFT JOIN Projects AS p ON e.Dept_ID = p.Dept_ID;

-- Q7. Using LEFT JOIN, display employees whose department
--     information is missing.
SELECT e.* FROM Employees_Info AS e 
LEFT JOIN Departments AS d ON e.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- Q8. Find employees who belong to a department but do not
--     have a project associated with their department.
SELECT e.* FROM Employees_Info AS e 
JOIN Departments AS d ON e.Dept_ID = d.Dept_ID
LEFT JOIN Projects AS p ON p.Dept_ID = d.Dept_ID
WHERE p.Project_ID IS NULL;

-- ==========================================================
-- SECTION 5: RIGHT JOIN
-- ==========================================================

-- Q9. Display all departments along with the employees
--     working in each department.
SELECT * FROM Employees_Info AS e
RIGHT JOIN Departments AS d ON d.Dept_ID = e.Dept_ID;

-- Q10. Using RIGHT JOIN, display departments that have
--      no employees.
SELECT * FROM Employees_Info AS e
RIGHT JOIN Departments AS d ON d.Dept_ID = e.Dept_ID
WHERE e.Emp_ID IS NULL;

-- Q11. Display all departments and their corresponding
--      project names, including departments that do not
--      have any project.
SELECT * FROM Projects AS p
RIGHT JOIN Departments AS d ON d.Dept_ID = p.Dept_ID;

-- ==========================================================
-- SECTION 6: MULTIPLE JOINS
-- ==========================================================

-- Q12. Display Emp_Name, Dept_Name, and Project_Name
--      by joining all three tables.
SELECT e.Emp_Name, d.Dept_Name, p.Project_Name FROM Employees_Info as e
JOIN Departments AS d ON e.Dept_ID = d.Dept_ID
JOIN Projects AS p on d.Dept_ID = p.Dept_ID;

-- Q13. Display all projects along with the employee details
--      associated with their department.
SELECT  * FROM Projects as p
LEFT JOIN Employees_Info AS e ON e.Dept_ID = p.Dept_ID
LEFT JOIN Departments AS d on d.Dept_ID = e.Dept_ID;

-- ==========================================================
-- SECTION 7: FULL OUTER JOIN
-- ==========================================================

-- Q14. Using FULL OUTER JOIN, display all employees and
--      all departments, including both matching and
--      non-matching records.
SELECT e.*, d.* FROM Employees_Info AS e LEFT JOIN Departments AS d ON d.Dept_ID = e.Dept_ID
UNION
SELECT e.*, d.* FROM Employees_Info AS e RIGHT JOIN Departments AS d ON d.Dept_ID = e.Dept_ID;

-- ==========================================================
-- SECTION 8: COMBINED JOIN CHALLENGE
-- ==========================================================

-- Q15. Display employee name, department name, project name,
--      and salary for employees whose department has a
--      matching project.
SELECT e.Emp_Name, d.Dept_Name, p.Project_Name, e.Salary FROM Employees_Info AS e
LEFT JOIN Departments as d ON d.Dept_ID = e.Dept_ID
INNER JOIN Projects as p ON d.Dept_ID = p.Dept_ID;

-- ==========================================================
-- SECTION 9: JOIN + FILTERING
-- ==========================================================

-- Q16. Display employees and their department names where
--      the salary is greater than 45000.
SELECT * FROM Employees_Info AS e
INNER JOIN Departments AS d ON e.Dept_ID = d.Dept_ID
WHERE e.salary > 45000; 
-- Q17. Display employees who work in the IT department,
--      along with their department name.
SELECT * FROM Employees_Info AS e
INNER JOIN Departments AS d ON e.Dept_ID = d.Dept_ID
WHERE e.Dept_ID = 1; 

-- Q18. Display employees who work in either the HR or Finance
--      department, along with their department names.
SELECT * FROM Employees_Info AS e
INNER JOIN Departments AS d ON e.Dept_ID = d.Dept_ID
WHERE e.Dept_ID IN (2, 3);

-- Q19. Display employees whose salary is between 40000 and
--      55000, along with their department names.
SELECT e.Emp_Name AS Name, e.Emp_ID AS "Emp ID", e.Salary AS Salary, d.Dept_Name as "Department Name"
FROM Employees_Info AS e 
JOIN Departments AS d ON e.Dept_ID = d.Dept_ID
WHERE e.Salary BETWEEN 40000 AND 55000;  
  
-- Q20. Display employees who have a matching department and
--      whose department also has a project.
SELECT * FROM Employees_Info AS e
JOIN Departments as d ON e.Dept_ID = d.Dept_ID
JOIN Projects as p ON p.Dept_ID = d.Dept_ID; 


-- ==========================================================
-- SECTION 10: JOIN + AGGREGATE FUNCTIONS
-- ==========================================================

-- Q21. Find the number of employees in each department.
--      Display department name and employee count.
SELECT d.Dept_Name AS Department, COUNT(*) AS 'Number of Employees'
FROM Employees_Info AS e
JOIN Departments AS d ON e.Dept_ID = d.Dept_ID
GROUP BY d.Dept_Name;

-- Q22. Find the average salary of employees in each department.
--      Display department name and average salary.
SELECT d.Dept_Name AS Department, ROUND(AVG(e.Salary),2) AS 'Average Salary'
FROM Employees_Info AS e
JOIN Departments AS d ON e.Dept_ID = d.Dept_ID
GROUP BY d.Dept_Name;

-- Q23. Find the highest salary in each department.
--      Display department name and highest salary.
SELECT d.Dept_Name AS Department, ROUND(MAX(e.Salary),2) AS 'Highest Salary'
FROM Employees_Info AS e
JOIN Departments AS d ON e.Dept_ID = d.Dept_ID
GROUP BY d.Dept_Name;

-- Q24. Find the lowest salary in each department.
--      Display department name and lowest salary.
SELECT d.Dept_Name AS Department, ROUND(MIN(e.Salary),2) AS 'Lowest Salary'
FROM Employees_Info AS e
JOIN Departments AS d ON e.Dept_ID = d.Dept_ID
GROUP BY d.Dept_Name;

-- Q25. Display each department name and the total number
--      of projects associated with that department.
SELECT d.Dept_Name AS Department, COUNT(*) AS 'No of Projects' 
FROM Departments AS d JOIN Projects AS p ON p.Dept_ID = d.Dept_ID
GROUP BY d.Dept_Name;

-- ==========================================================
-- SECTION 11: JOIN + GROUP BY / HAVING
-- ==========================================================

-- Q26. Display departments having more than one employee.
SELECT d.Dept_Name AS 'Department', COUNT(*) AS 'No of Employees' FROM Departments AS d 
JOIN Employees_Info as e ON e.Dept_ID = d.Dept_ID
GROUP BY d.Dept_Name
HAVING COUNT(*) > 1;

-- Q27. Display departments whose average employee salary
--      is greater than 45000.
SELECT d.Dept_Name AS 'Department', COALESCE(ROUND(AVG(e.Salary),2),0) AS 'Average Salary' FROM Departments AS d 
JOIN Employees_Info as e ON e.Dept_ID = d.Dept_ID
GROUP BY d.Dept_Name
HAVING AVG(e.Salary) > 45000;

-- Q28. Display departments that have at least one employee
--      and at least one project.
SELECT d.Dept_Name AS 'Department' FROM Departments AS d
JOIN Employees_Info AS e ON d.Dept_ID = e.Dept_ID
JOIN Projects AS p ON p.Dept_ID = d.Dept_ID
GROUP BY d.Dept_Name
HAVING COUNT(DISTINCT e.Emp_ID) >= 1 AND COUNT(DISTINCT p.Project_ID) >= 1;

-- ==========================================================
-- SECTION 12: JOIN CHALLENGES
-- ==========================================================

-- Q29. Display Emp_ID, Emp_Name, Dept_Name, Project_Name,
--      and Salary for all employees whose department has
--      a project. Sort the result by salary in descending order.
SELECT e.Emp_ID AS 'Employee ID', e.Emp_Name AS 'Employee Name', d.Dept_Name AS 'Department Name',
p.Project_Name AS 'Project Name', e.Salary AS 'Salary' 
FROM Employees_Info AS e 
JOIN Departments AS d ON e.Dept_ID = d.Dept_ID
JOIN Projects AS p ON p.Dept_ID = d.Dept_ID
ORDER BY e.Salary DESC;

-- Q30. Display all department names, employee names, project
--      names, and salaries, including departments with no
--      employees and departments with no projects.
SELECT d.Dept_Name, e.Emp_Name, p.Project_Name, e.Salary
FROM Departments AS d
LEFT JOIN Employees_Info AS e ON d.Dept_ID = e.Dept_ID
LEFT JOIN Projects AS p ON d.Dept_ID = p.Dept_ID;

-- ==========================================================
-- MULTIPLE JOIN SYNTAX REFERENCE
-- ==========================================================

/*
SELECT column1, column2, column3
FROM table1
JOIN table2
    ON table1.common_column = table2.common_column
JOIN table3
    ON table2.common_column = table3.common_column;
*/

SELECT Dept_ID FROM Departments AS d JOIN Employees_Info AS e ON d.Dept_ID = e.Emp_ID;