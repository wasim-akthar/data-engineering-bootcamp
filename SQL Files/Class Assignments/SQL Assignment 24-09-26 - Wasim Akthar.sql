/*
============================================================
SQL PRACTICE ASSIGNMENT — EMPLOYEE DETAILS
============================================================

Topics covered:
- SELECT / Column Selection
- Aliases (AS)
- Arithmetic Operations (+, -, *, /)

IMPORTANT:
- Table name: employee_details
- Sample records are provided so the arithmetic questions have
  real numbers to work with.
- Try answering all 25 questions WITHOUT looking anything up.
- No solutions are included in this file.
*/
show databases;
use company_db;
-- ==========================================================
-- SECTION 1: TABLE SETUP
-- ==========================================================

CREATE TABLE employee_details (
    employee_id     INT AUTO_INCREMENT PRIMARY KEY,
    employee_name   VARCHAR(50),
    department      VARCHAR(50),
    city            VARCHAR(50),
    salary          DECIMAL(10,2)
);

-- ==========================================================
-- SECTION 2: SAMPLE DATA
-- ==========================================================

INSERT INTO employee_details
(employee_name, department, city, salary)
VALUES
('Rohan Mehta', 'Sales', 'Mumbai', 35000.00),
('Aisha Khan', 'IT', 'Bangalore', 62000.00),
('Vikram Nair', 'Finance', 'Chennai', 48000.00),
('Sara Thomas', 'HR', 'Delhi', 30000.00),
('Amit Verma', 'IT', 'Pune', 71000.00),
('Neha Kapoor', 'Marketing', 'Mumbai', 42000.00),
('Rajesh Kumar', 'Sales', 'Hyderabad', 38000.00),
('Fatima Ali', 'Finance', 'Chennai', 55000.00),
('Suresh Iyer', 'IT', 'Bangalore', 68000.00),
('Priya Singh', 'HR', 'Delhi', 32000.00);

-- ==========================================================
-- SECTION 3: SELECTION, ALIAS & ARITHMETIC QUESTIONS
-- ==========================================================

-- Q1. Display all employee details from the employee_details table.
SELECT * FROM employee_details;

-- Q2. Display only employee_id and employee_name.
SELECT employee_id AS "ID" , employee_name AS "Employee Name" FROM employee_details;

-- Q3. Display employee_name, department, and salary.
SELECT employee_name AS "Employee Name", department AS "Department", salary AS "Current Salary" FROM employee_details;

-- Q4. Display employee_name with the alias Employee_Name.
SELECT employee_name AS "Employee_Name" FROM employee_details;

-- Q5. Display department with the alias Dept.
SELECT department AS "Dept" FROM employee_details;

-- Q6. Display salary with the alias Monthly_Salary.
SELECT salary AS "Monthly_Salary" FROM employee_details;

-- Q7. Display employee_name and city with suitable aliases.
SELECT employee_name AS "Employee_Name", city AS "City" FROM employee_details;

-- Q8. Display employee name and salary, and calculate salary + ₹5,000.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", salary+5000 AS "Revised Salary" FROM employee_details;

-- Q9. Display employee name and salary, and calculate salary - ₹2,000.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", salary-2000 AS "Revised Salary" FROM employee_details;

-- Q10. Display employee name and calculate their annual salary.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", salary*12 AS "Annual Salary" FROM employee_details;

-- Q11. Display employee name and calculate 10% of their salary as bonus.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", "10%" AS "Bonus", salary*0.1 AS "Bonus Amount" FROM employee_details;

-- Q12. Display employee name and calculate 15% of their salary as bonus.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", "15%" AS "Bonus", salary*0.15 AS "Bonus Amount" FROM employee_details;

-- Q13. Display employee name and calculate salary after adding a 10% bonus.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", "10%" AS "Bonus", salary*0.1 AS "Bonus Amount", (salary+salary*0.1) AS "Updated Salary" FROM employee_details;

-- Q14. Display employee name and calculate salary after a 5% deduction.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", "5%" AS "Deduction", salary*0.05 AS "Deduction Amount" FROM employee_details;

-- Q15. Display employee name and calculate salary after adding ₹3,000.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", salary+3000 AS "Updated Salary" FROM employee_details;

-- Q16. Display employee name and calculate salary after deducting ₹1,500.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", salary-1500 AS "Updated Salary" FROM employee_details;

-- Q17. Display employee name and convert their monthly salary into
--      salary in thousands.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", salary/1000 AS "Salary in Thousands" FROM employee_details;

-- Q18. Display employee name and calculate their annual salary in lakhs.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", (salary*12)/100000 AS "Annual Salary in Lakhs" FROM employee_details;

-- Q19. Display employee name and calculate 12 months' salary + ₹10,000.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", salary*12 AS "Annual Salary", 10000 AS "Bonus", salary*12+10000 as "Bonus Salary" FROM employee_details;

-- Q20. Display employee name, monthly salary, and annual salary
--      using aliases.
SELECT employee_name AS "Employee Name", salary AS "Monthly Salary", salary*12 AS "Annual Salary" FROM employee_details;

-- Q21. Display employee name, salary, and 20% bonus amount
--      using aliases.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", "20%" AS "Bonus", salary*0.2 AS "Bonus Amount" FROM employee_details;

-- Q22. Display employee name, salary, 5% deduction, and salary
--      after deduction.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", "5%" AS "Deduction", salary*0.05 AS "Deduction Amount", (salary-salary*0.05) AS "Salary After Deduction" FROM employee_details;

-- Q23. Display employee name, salary, 10% bonus, and final salary
--      including the bonus.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", "10%" AS "Bonus", salary*0.1 AS "Bonus Amount", (salary+salary*0.1) AS "Final Salary" FROM employee_details;

-- Q24. Display employee name and calculate the salary after
--      ₹5,000 increase and 5% bonus.
SELECT employee_name AS "Employee Name", salary AS "Base Salary", salary+5000 AS "Salary After Increase", "5%" AS "Bonus", (salary+5000)*0.05 AS "Bonus Amount", ((salary+5000)+(salary+5000)*0.05) AS "Final Salary" FROM employee_details;

-- Q25. Display employee_name, department, salary, annual salary,
--      10% bonus, and final annual salary including bonus,
--      with proper aliases.
SELECT employee_name AS "Employee Name", department AS "Department", salary AS "Monthly Salary", salary*12 AS "Annual Salary", "10%" AS "Bonus", salary*12*0.1 AS "Bonus Amount", (salary*12 + salary*12*0.1) AS "Final Annual Salary" FROM employee_details;

# Note your game ID: gYbY6eFZDu