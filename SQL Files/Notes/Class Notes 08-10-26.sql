SELECT 
	department_id AS Dept_ID, 
	MAX(salary) AS "Maximum Salary", 
	MIN(salary) AS "Minimum Salary" 
FROM emp
GROUP BY department_id
HAVING MAX(salary) > 70000
LIMIT 1 OFFSET 3;

SELECT 
	CASE
		WHEN department_id = 1 THEN 'IT'
        WHEN department_id = 2 THEN 'HR'
        WHEN department_id = 3 THEN 'Finance'
        WHEN department_id = 4 THEN 'Marketing'
        WHEN department_id = 5 THEN 'Sales'
        END AS Department, 
    COUNT(*) AS 'No of Employees',
	ROUND(AVG(salary),2) AS "Average Salary"
FROM emp
GROUP BY Department
HAVING COUNT(*) > 2
ORDER BY AVG(salary) DESC;

-- IT, HR, Finance, Marketing, Sales
SELECT * FROM emp;

WITH RankedEmployees AS (
    SELECT 
        salary,
        CASE 
            WHEN department_id = 1 THEN 'IT' 
            WHEN department_id = 2 THEN 'HR' 
            WHEN department_id = 3 THEN 'Finance' 
            WHEN department_id = 4 THEN 'Marketing' 
            WHEN department_id = 5 THEN 'Sales' 
        END AS DEPARTMENT
    FROM emp
)
SELECT 
    DEPARTMENT, 
    COUNT(*) AS "No of Employees", 
    ROUND(AVG(salary), 2) AS "Average Salary" 
FROM RankedEmployees
GROUP BY DEPARTMENT 
HAVING COUNT(*) > 2 
ORDER BY AVG(salary) DESC;


/*
(INNER) JOIN: Returns only rows that have matching values in both tables
LEFT (OUTER) JOIN: Returns all rows from the left table, and only the matched rows from the right table
RIGHT (OUTER) JOIN: Returns all rows from the right table, and only the matched rows from the left table
FULL (OUTER) JOIN: Returns all rows when there is a match in either the left or right table
*/
