/*
============================================================
SQL PRACTICE ASSIGNMENT — STUDENT MANAGEMENT SYSTEM
============================================================

Topics covered:
- DDL (CREATE, ALTER, DROP)
- DML (INSERT, UPDATE, DELETE)
- DQL (SELECT)
- Aggregate Functions
- Filters (WHERE, AND, OR, IN, BETWEEN, LIKE)
- GROUP BY

*/

-- ==========================================================
-- SECTION 1: DATABASE SETUP — DDL
-- ==========================================================
show databases;
-- TODO 1: Create a database named student_management_db.

CREATE DATABASE student_management_db;
-- TODO 2: Select/use the database.

USE student_management_db;
-- TODO 3: Create the students table with these 10 columns:
--
-- 1.  student_id   INT AUTO_INCREMENT PRIMARY KEY
-- 2.  first_name   VARCHAR(50)
-- 3.  last_name    VARCHAR(50)
-- 4.  email        VARCHAR(150)
-- 5.  gender       VARCHAR(10)
-- 6.  age          INT
-- 7.  city         VARCHAR(100)
-- 8.  department   VARCHAR(50)
-- 9.  marks        DECIMAL(5,2)
-- 10. attendance   DECIMAL(5,2)

CREATE TABLE students (
	student_id   INT AUTO_INCREMENT PRIMARY KEY,
	first_name   VARCHAR(50),
	last_name    VARCHAR(50),
	email        VARCHAR(150),
	gender       VARCHAR(10),
	age          INT,
	city         VARCHAR(100),
	department   VARCHAR(50),
	marks        DECIMAL(5,2),
	attendance   DECIMAL(5,2)
);


-- ==========================================================
-- SECTION 2: SAMPLE DATA — DML
-- ==========================================================

-- Insert the following 20 students.
-- Do not change the values; they are designed for the questions below.

INSERT INTO students
(first_name, last_name, email, gender, age, city, department, marks, attendance)
VALUES
('Arun', 'Kumar', 'arun.kumar@email.com', 'Male', 20, 'Chennai', 'CSE', 88.00, 92.50),
('Priya', 'Sharma', 'priya.sharma@email.com', 'Female', 19, 'Bangalore', 'ECE', 76.50, 86.00),
('Rahul', 'Verma', 'rahul.verma@email.com', 'Male', 21, 'Mumbai', 'CSE', 69.00, 78.50),
('Sneha', 'Iyer', 'sneha.iyer@email.com', 'Female', 20, 'Chennai', 'IT', 91.50, 95.00),
('Karthik', 'Raj', 'karthik.raj@email.com', 'Male', 22, 'Coimbatore', 'MECH', 64.50, 72.00),
('Meena', 'Das', 'meena.das@email.com', 'Female', 21, 'Kochi', 'CIVIL', 73.00, 81.50),
('Vijay', 'Anand', 'vijay.anand@email.com', 'Male', 23, 'Hyderabad', 'CSE', 82.50, 88.00),
('Divya', 'Nair', 'divya.nair@email.com', 'Female', 20, 'Chennai', 'ECE', 58.00, 69.50),
('Suresh', 'Babu', 'suresh.babu@email.com', 'Male', 22, 'Madurai', 'IT', 87.50, 91.00),
('Anjali', 'Menon', 'anjali.menon@email.com', 'Female', 19, 'Trivandrum', 'CSE', 94.00, 97.00),
('Deepak', 'Pillai', 'deepak.pillai@email.com', 'Male', 21, 'Kochi', 'MECH', 61.00, 74.50),
('Kavya', 'Reddy', 'kavya.reddy@email.com', 'Female', 20, 'Hyderabad', 'ECE', 79.50, 84.00),
('Manoj', 'Pandey', 'manoj.pandey@email.com', 'Male', 22, 'Mumbai', 'CIVIL', 67.00, 76.00),
('Nisha', 'Joseph', 'nisha.joseph@email.com', 'Female', 19, 'Bangalore', 'IT', 85.00, 90.50),
('Ganesh', 'Shetty', 'ganesh.shetty@email.com', 'Male', 23, 'Madurai', 'CSE', 72.50, 80.00),
('Lakshmi', 'Rao', 'lakshmi.rao@email.com', 'Female', 21, 'Chennai', 'MECH', 55.50, 65.00),
('Ravi', 'Chandran', 'ravi.chandran@email.com', 'Male', 20, 'Trivandrum', 'ECE', 89.00, 93.50),
('Pooja', 'Agarwal', 'pooja.agarwal@email.com', 'Female', 22, 'Coimbatore', 'CIVIL', 70.50, 79.00),
('Sanjay', 'Mishra', 'sanjay.mishra@email.com', 'Male', 19, 'Mumbai', 'CSE', 96.00, 98.00),
('Anita', 'George', 'anita.george@email.com', 'Female', 23, 'Kochi', 'IT', 63.50, 71.50);


-- ==========================================================
-- SECTION 3: DQL — BASIC SELECT QUESTIONS
-- ==========================================================

-- Q1. Display all columns and all students.
SELECT * from students;

-- Q2. Display only first_name, last_name, department, and marks.
SELECT first_name, last_name, department, marks from students;

-- Q3. Display all unique departments.
SELECT DISTINCT department from students;

-- Q4. Display students whose marks are greater than 80.
SELECT * FROM students WHERE marks > 80;

-- Q5. Display students whose age is 20.
SELECT * FROM students WHERE age = 20;

-- Q6. Display students from Chennai.
SELECT * FROM students WHERE city = "Chennai"; 

-- Q7. Display students from either Chennai or Bangalore.
SELECT * FROM students WHERE (city = "Chennai" OR city = "Bangalore"); 

-- Q8. Display students whose marks are between 70 and 90.
SELECT * FROM students WHERE marks > 70 AND marks < 90;

-- Q9. Display students whose department is CSE, ECE, or IT.
SELECT * FROM students WHERE department IN ('CSE', 'ECE', 'IT');

-- Q10. Display students whose first_name starts with the letter 'A'.
SELECT * FROM students WHERE first_name LIKE "A%";

-- ==========================================================
-- SECTION 4: FILTERS — WHERE / AND / OR / LIKE
-- ==========================================================

-- Q11. Display students whose attendance is greater than 85
--      AND marks are greater than 80.
SELECT * FROM students WHERE (attendance > 85 AND marks > 85);

-- Q12. Display female students whose marks are greater than 80.
SELECT * FROM students WHERE (gender = 'Female' AND marks > 80);

-- Q13. Display students whose gender is NOT 'Male'.
SELECT * FROM students WHERE gender != 'Male';

-- Q14. Display students whose marks are greater than 90
--      OR attendance is greater than 95.
SELECT * FROM students WHERE (marks > 90 OR attendance > 95);

-- Q15. Display students whose last_name ends with 'r'.
SELECT * FROM students WHERE last_name LIKE "%r";

-- ==========================================================
-- SECTION 5: AGGREGATE FUNCTIONS
-- ==========================================================

-- Q16. Find the total number of students.
SELECT COUNT(*) AS "Total No of Students" FROM students;

-- Q17. Find the highest marks.
SELECT MAX(marks) AS "Highest Marks" FROM students;

-- Q18. Find the lowest marks.
SELECT MIN(marks) AS "Lowest Marks" FROM students;

-- Q19. Find the average marks of all students.
SELECT AVG(marks) AS "Average Marks" FROM students;


-- Q20. Find the total (sum) of attendance across all students.
SELECT SUM(attendance) AS "Total sum of attendance" FROM students;

-- ==========================================================
-- SECTION 6: GROUP BY
-- ==========================================================

-- Q21. Find the number of students in each department.
SELECT COUNT(*) AS "No of Students", department FROM students GROUP BY department;

-- Q22. Find the average marks for each department.
SELECT AVG(marks) AS "Average Marks", department FROM students GROUP BY department;

-- Q23. Find the highest marks in each department.
SELECT MAX(marks) AS "Highest Marks", department FROM students GROUP BY department;

-- Q24. Find the average attendance for each department.
SELECT AVG(attendance) AS "Average Attendance", department FROM students GROUP BY department;

-- Q25. Find the number of students from each city.
SELECT COUNT(*) AS "No of Students", city FROM students GROUP BY city;

-- ==========================================================
-- SECTION 7: GROUP BY + FILTERING
-- ==========================================================

-- Q26. Find the average marks for each department,
--      but display only departments whose average marks are
--      greater than 75.
SELECT department FROM students GROUP BY department HAVING (AVG(marks) > 75); 

-- Q27. Find the number of students in each department
--      who scored above 80 marks.
SELECT COUNT(*) AS "No of Students", department FROM students WHERE (marks > 80) GROUP BY department; 

-- Q28. Find the average age of students in each department.
SELECT AVG(age), department FROM students GROUP BY department;

-- Q29. Find the average attendance for each department
--      and display only departments where the average attendance
--      is greater than 80.
SELECT AVG(attendance) AS "Average Attendance", department FROM students GROUP BY department HAVING (marks > 80); 

-- Q30. Find the department with the highest average marks.
--
-- Hint:
-- You will need GROUP BY, an aggregate function, and sorting.
-- Try solving it without searching for the answer.
SELECT AVG(marks) AS "Highest Average Marks", department FROM students GROUP BY department ORDER BY AVG(marks) DESC LIMIT 1;


-- ==========================================================
-- SECTION 8: DML PRACTICE — INSERT / UPDATE / DELETE
-- ==========================================================
-- Q31. Update the marks of student_id = 5 to 70.00.
UPDATE students set marks=70.00 WHERE student_id=5;

-- Q32. Change the city of student_id = 9 to 'Salem'.
UPDATE students set city='Salem' WHERE student_id=9;

-- Q33. Delete the student whose student_id = 20.
DELETE FROM students WHERE student_Id = 20; 

-- Q34. Insert a new student named 'Kiran' 'Menon',
--      email 'kiran.menon@email.com', Male, age 21, city 'Chennai',
--      department 'CSE', marks 80.00, attendance 85.00.
INSERT INTO students
(first_name, last_name, email, gender, age, city, department, marks, attendance)
VALUES
('Kiran', 'Menon', 'kiran.menon@email.com', 'Male', 21, 'Chennai', 'CSE', 80.00, 85.00);

-- Q35. Update the department of student_id = 12 to 'IT'.
UPDATE students set department="IT" where student_id=12;

-- Q36. Increase the marks of every student in the 'MECH'
--      department by 5 (i.e. marks = marks + 5).
UPDATE students set marks=marks+5 WHERE department="MECH";


-- Q37. Delete all students whose attendance is less than 70.
DELETE FROM students WHERE attendance < 70;

-- Q38. Update the city of every student currently in 'Mumbai'
--      to 'Pune'.
UPDATE students SET city="Pune" WHERE city="Mumbai";

-- Q39. Insert a new student named 'Farah' 'Sheikh',
--      email 'farah.sheikh@email.com', Female, age 20, city 'Kochi',
--      department 'CIVIL', marks 75.00, attendance 88.00.
INSERT INTO students
(first_name, last_name, email, gender, age, city, department, marks, attendance)
VALUES
('Farah', 'Sheikh','farah.sheikh@email.com', "Female", 20, 'Kochi', 'CIVIL', 75.00, 88.00);

-- Q40. Set attendance to 100.00 for every student who currently
--      has marks greater than 90.
UPDATE students SET attendance=100.00 WHERE marks > 90.00;

-- ==========================================================
-- SECTION 9: DDL PRACTICE — ALTER / DROP / TRUNCATE
-- ==========================================================

-- Q41. Add a new column named phone VARCHAR(15).
ALTER TABLE students ADD COLUMN phone VARCHAR(15);

-- Q42. Rename the column phone to contact_number.
ALTER TABLE students RENAME COLUMN phone TO contact_number;

-- Q43. Remove the contact_number column.
ALTER TABLE students DROP COLUMN contact_number;

-- Q44. Modify the marks column so it can store values up to
--      DECIMAL(6,2) instead of DECIMAL(5,2).
ALTER TABLE students MODIFY COLUMN marks DECIMAL(6,2);

-- Q45. Add a new column named year_of_study INT with a
--      DEFAULT value of 1.
ALTER TABLE students ADD COLUMN year_of_study INT DEFAULT 1;

-- Q46. Rename the students table to student_records,
--      then rename it back to students.
ALTER TABLE students RENAME TO student_records;
ALTER TABLE student_records RENAME TO students;
-- Q47. Add a UNIQUE constraint to the email column.
ALTER TABLE students MODIFY COLUMN email VARCHAR(150) UNIQUE;

-- Q48. Create a copy of the table structure (no data) named
--      students_backup, then TRUNCATE it.
-- Step 1: Create a copy of the table structure without any data
CREATE TABLE students_backup AS 
SELECT * FROM students 
WHERE 1 = 0;

-- Step 2: Truncate the newly created backup table
TRUNCATE TABLE students_backup;

-- ==========================================================
-- FINAL CHALLENGE
-- ==========================================================

-- Q49. Write ONE query that displays:
--      department
--      total students
--      average marks
--      highest marks
--      lowest marks
--      average attendance
--
--      Group the results by department.
SELECT 
department,
COUNT(*) AS "Total Students",
AVG(marks) AS "Average Marks",
MAX(marks) AS "Highest Marks",
MIN(marks) AS "Lowest Marks",
AVG(attendance) AS "Average Attendance"
FROM students
GROUP BY department;