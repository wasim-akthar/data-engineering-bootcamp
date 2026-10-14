/*
============================================================
SQL MINI PROJECT — COLLEGE STUDENT MARKS MANAGEMENT SYSTEM
============================================================

Scenario:
A college wants to maintain student information and subject marks
using MySQL. You are asked to create the database, store student
records, and generate reports for the college management team.

Topics covered:
- Database and table creation with constraints
- Arithmetic operations and aliases
- Aggregate functions: COUNT(), SUM(), AVG(), MIN(), MAX()
- GROUP BY and HAVING
- CASE (including conditional aggregation)
- Filters: WHERE, AND, OR, IN, BETWEEN, LIKE, IS NULL, NOT
- Sorting, Top-N, Nth highest, LIMIT / OFFSET, pagination
- JOINs: INNER, LEFT, RIGHT (including finding unmatched rows)
- UNION, UNION ALL
- UPPER LOWER
- DML: INSERT, UPDATE, DELETE (including multi-table)
- DDL: ALTER, DROP, TRUNCATE, RENAME
- Mix and Match

IMPORTANT:
- Try answering all 100 questions WITHOUT looking anything up.
- Run Q1 to Q20 first. Q21 adds two new students (who have no
  marks), and Q98 removes them again. Q90 to Q100 change data and
  structure, so run those last.
- No solutions are included in this file.
- Expected outputs are shown for some questions so you can
  check your own results.
*/

-- ==========================================================
-- REFERENCE DATA (use this to write your INSERT statements)
-- ==========================================================

/*
Table 1: students
+------------+--------------+------------+------------+-----+
| student_id | student_name | department | city       | age |
+------------+--------------+------------+------------+-----+
| 1          | Arun         | Python     | Chennai    | 20  |
| 2          | Priya        | Java       | Madurai    | 21  |
| 3          | Kumar        | Python     | Chennai    | 19  |
| 4          | Divya        | Java       | Coimbatore | 22  |
| 5          | Ravi         | Python     | Salem      | 20  |
| 6          | Meena        | Testing    | Chennai    | 23  |
| 7          | Suresh       | Testing    | Trichy     | 18  |
| 8          | Anu          | Java       | Chennai    | 21  |
+------------+--------------+------------+------------+-----+

Note: The students table in Q2 also has an email column (UNIQUE),
but no email values are given above. Leave email out of your
INSERT (it will be NULL) or add your own unique values.

Table 2: marks
+---------+------------+--------------+-----------+----------------+
| mark_id | student_id | python_marks | sql_marks | aptitude_marks |
+---------+------------+--------------+-----------+----------------+
| 101     | 1          | 85           | 90        | 80             |
| 102     | 2          | 75           | 80        | 70             |
| 103     | 3          | 90           | 95        | 85             |
| 104     | 4          | 60           | 65        | 70             |
| 105     | 5          | 45           | 55        | 50             |
| 106     | 6          | 80           | 75        | 85             |
| 107     | 7          | 35           | 40        | 45             |
| 108     | 8          | 95           | 90        | 100            |
+---------+------------+--------------+-----------+----------------+
*/

-- ==========================================================
-- PART A: DATABASE AND CONSTRAINTS
-- ==========================================================

-- Q1. Create a database named college_db and select it.
CREATE DATABASE college_db;
USE college_db;

-- Q2. Create the students table with student_id as the primary
--     key, student_name as NOT NULL, email as UNIQUE, age with a
--     CHECK constraint of at least 17, and city with a default
--     value of Chennai.
CREATE TABLE students (
	student_id INT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    department VARCHAR(30),
    email VARCHAR(100) UNIQUE,
    age INT CHECK(age > 17),
    city VARCHAR(50) DEFAULT 'Chennai'
);

-- Q3. Create the marks table with a primary key, a foreign key
--     referencing students, and CHECK constraints ensuring all
--     three subject marks are between 0 and 100.
CREATE TABLE marks (
 mark_id INT PRIMARY KEY,
 student_id INT NOT NULL,
 python_marks INT NOT NULL CHECK (python_marks BETWEEN 0 AND 100),
 sql_marks INT NOT NULL CHECK (sql_marks BETWEEN 0 AND 100),
 aptitude_marks INT NOT NULL CHECK (aptitude_marks BETWEEN 0 AND 100),
 CONSTRAINT student_id_fk FOREIGN KEY (student_id) REFERENCES students(student_id) 
);


-- Q4. Insert the given student and marks records into the tables.
-- A. Insert records into `students`
INSERT INTO students (student_id, student_name, email, department, city, age) VALUES
(1, 'Arun', 'arun.pytmaa@techie.com', 'Python', 'Chennai', 20),
(2, 'Priya', 'priya.javixm@techie.com', 'Java', 'Madurai', 21),
(3, 'Kumar', 'kumar.pytmaa@techie.com', 'Python', 'Chennai', 19),
(4, 'Divya', 'divya.javcjb@techie.com', 'Java', 'Coimbatore', 22),
(5, 'Ravi', 'ravi.pytsxv@techie.com', 'Python', 'Salem', 20),
(6, 'Meena', 'meena.tesmaa@techie.com', 'Testing', 'Chennai', 23),
(7, 'Suresh', 'suresh.testrz@techie.com', 'Testing', 'Trichy', 18),
(8, 'Anu', 'anu.javmaa@techie.com', 'Java', 'Chennai', 21);

-- B. Insert records into `marks`
INSERT INTO marks (mark_id, student_id, python_marks, sql_marks, aptitude_marks) VALUES
(101, 1, 85, 90, 80),
(102, 2, 75, 80, 70),
(103, 3, 90, 95, 85),
(104, 4, 60, 65, 70),
(105, 5, 45, 55, 50),
(106, 6, 80, 75, 85),
(107, 7, 35, 40, 45),
(108, 8, 95, 90, 100);


-- ==========================================================
-- PART B: ARITHMETIC OPERATIONS AND ALIASES
-- ==========================================================

-- Q5. The college wants to know the total marks scored by each
--     student in all three subjects. Write a query to display
--     the student ID and total marks.
--
--     Expected output format:
--     student_id | total_marks
--     1          | 255
--     2          | 225
--     3          | 270
--     ...        | ...
SELECT s.student_name as 'Name', CONCAT((m.python_marks + m.sql_marks + m.aptitude_marks),'/300') AS 'Total Marks' FROM students AS s JOIN marks AS m
ON s.student_id = m.student_id;


-- Q6. The college wants to calculate the average marks of every
--     student.
--
--     Expected output format:
--     student_id | average_marks
--     1          | 85.00
--     2          | 75.00
--     3          | 90.00
--     ...        | ...
SELECT s.student_name AS 'Name', ROUND(AVG(m.python_marks + m.sql_marks + m.aptitude_marks), 2) AS 'Average Marks' FROM students AS s JOIN marks AS M 
ON s.student_id = m.student_id GROUP BY s.student_id;

-- Q7. Display the student ID, Python marks, SQL marks, and the
--     difference between Python and SQL marks.
SELECT s.student_id AS 'Student ID', m.python_marks AS 'Python Marks', m.sql_marks AS 'SQL Marks', ABS(m.python_marks - m.sql_marks) AS 'Difference'
FROM students AS s LEFT JOIN marks AS m ON m.student_id = s.student_id;

-- ==========================================================
-- PART C: AGGREGATE FUNCTIONS
-- ==========================================================

-- Q8. The Python trainer wants to know the highest and lowest
--     Python marks.
--
--     Expected output:
--     highest_marks | lowest_marks
--     95            | 35
SELECT 'Python' AS 'Subject', MAX(python_marks) AS 'Highest Marks', MIN(python_marks) AS 'Lowest Marks' FROM marks;

-- Q9. Find the average SQL marks of all students.
SELECT 'SQL' AS 'Subject', ROUND(AVG(sql_marks),2) AS 'Average Marks' FROM marks;

-- Q10. Find the total number of students enrolled in the college.
SELECT COUNT(*) AS 'No of Students' FROM students;

-- Q11. Find the total marks scored by all students in the
--      Python subject.
SELECT 'Python' AS 'Subject', SUM(python_marks) AS 'Total Marks' FROM marks;

-- ==========================================================
-- PART D: GROUP BY
-- ==========================================================

-- Q12. The management wants to know how many students belong
--      to each department.
--
--      Expected output:
--      department | student_count
--      Python     | 3
--      Java       | 3
--      Testing    | 2
SELECT department AS 'Department', COUNT(*) AS 'Student Count' FROM students
GROUP BY department;

-- Q13. Calculate the average age of students in each department.
SELECT department AS 'Department', ROUND(AVG(age),2) AS 'Average Student Age' FROM students
GROUP BY department;

-- Q14. Find the total Python marks scored by students in each
--      department.
SELECT s.department AS 'Department', 'Python' AS 'Subject', SUM(m.python_marks) AS 'Total Marks' 
FROM students AS s LEFT JOIN marks as m ON m.student_id = s.student_id
GROUP BY s.department;

-- ==========================================================
-- PART E: HAVING
-- ==========================================================

-- Q15. Display only those departments that have more than two
--      students.
--
--      Expected output:
--      department | student_count
--      Python     | 3
--      Java       | 3
SELECT department AS 'Department', COUNT(*) AS 'Student Count' FROM students
GROUP BY department HAVING COUNT(*) > 2;

-- Q16. Display departments whose average age is greater than 20.
SELECT department AS 'Department', ROUND(AVG(age),2) AS 'Average Student Age' FROM students
GROUP BY department HAVING AVG(age) > 20;

-- Q17. Find departments whose total Python marks are greater
--      than 200.
SELECT s.department AS 'Department', 'Python' AS 'Subject', SUM(m.python_marks) AS 'Total Marks' 
FROM students AS s LEFT JOIN marks as m ON m.student_id = s.student_id
GROUP BY s.department HAVING SUM(m.python_marks) > 200;

-- ==========================================================
-- PART F: CASE STATEMENT
-- ==========================================================

-- Q18. The college wants to classify students based on their
--      total marks:
--      250 and above  -> Excellent
--      200 to 249     -> Good
--      150 to 199     -> Average
--      Below 150      -> Needs Improvement
--      Write a query to display each student's ID, total marks,
--      and performance category.
--
--      Expected output format:
--      student_id | total_marks | performance
--      1          | 255         | Excellent
--      2          | 225         | Good
--      3          | 270         | Excellent
--      ...        | ...         | ...
WITH student_marks AS (
SELECT 
	student_id,
    CONCAT((python_marks + sql_marks + aptitude_marks),'/300') AS total_marks
FROM marks    
)
SELECT student_id AS 'Student ID', total_marks AS 'Total Marks',
CASE
	WHEN total_marks >= 250 THEN 'Excellent'
    WHEN total_marks BETWEEN 200 AND 249 THEN 'Good'
    WHEN total_marks BETWEEN 150 AND 199 THEN 'Average'
    ELSE 'Needs Improvement'
END AS 'Performance'
FROM student_marks;

-- Q19. Display the student ID and result using the following
--      condition: total marks of 150 or above means Pass;
--      otherwise, Fail.
WITH student_marks AS (
SELECT 
	student_id,
    CONCAT((python_marks + sql_marks + aptitude_marks),'/300') AS total_marks
FROM marks    
)
SELECT student_id AS 'Student ID', total_marks AS 'Total Marks',
CASE
	WHEN total_marks >= 150 THEN 'Pass'
    ELSE 'Fail'
END AS 'Progress'
FROM student_marks;

-- Q20. Categorize students based on Python marks:
--      90 and above -> Excellent
--      70 and above -> Good
--      50 and above -> Average
--      Otherwise    -> Needs Improvement
SELECT s.student_id AS 'Student ID', s.student_name AS 'Student Name', m.python_marks AS 'Python Marks',
CASE
	WHEN m.python_marks >= 90 THEN 'Excellent'
    WHEN m.python_marks >= 70 THEN 'Good'
    WHEN m.python_marks >= 50 THEN 'Average'
    ELSE 'Needs Improvement'
END AS 'Status' 
FROM students AS s JOIN marks as m ON m.student_id = s.student_id;

-- ==========================================================
-- PART G: UNMATCHED INSERTION & ARITHMETIC / ALIASES EXTENSION
-- ==========================================================

-- Q21. Insert two new students into the students table without
--      any marks records:
--      (9, 'Kavitha', 'Python', 'Chennai', 20)
--      (10, 'Ganesh', 'Testing', 'Madurai', 22)
INSERT INTO students (student_id, student_name, department, city, age) VALUES 
    (9, 'Kavitha', 'Python', 'Chennai', 20),
    (10, 'Ganesh', 'Testing', 'Madurai', 22);

-- Q22. Calculate each student's overall percentage using arithmetic
--      division on total marks (out of 300) with alias percentage_marks.
SELECT s.student_id AS 'Student ID', s.student_name AS 'Name', CONCAT(ROUND(((m.python_marks + m.sql_marks + m.aptitude_marks)/300) * 100, 0), '%') AS 'Overall Percentage'
FROM students AS s JOIN marks AS m ON s.student_id = m.student_id;

-- Q23. Display student_id, aptitude_marks, and what the aptitude mark
--      would be if scaled out of 50 instead of 100.
SELECT s.student_id AS 'Student ID', s.student_name AS 'Name', m.aptitude_marks AS 'Aptitude Marks', ROUND(m.aptitude_marks/2,2) AS 'Scaled Marks'
FROM students AS s JOIN marks AS m ON s.student_id = m.student_id;

-- Q24. Calculate the difference between highest subject mark and lowest
--      subject mark for each student using arithmetic expressions.
WITH students_marks AS (
	SELECT student_id, (python_marks + sql_marks + aptitude_marks) AS total_marks, 
    python_marks , sql_marks , aptitude_marks
    FROM marks
)
SELECT student_id AS 'Student ID',
total_marks AS 'Total Marks',
GREATEST(python_marks, sql_marks, aptitude_marks) AS 'Highest Mark',
LEAST(python_marks, sql_marks, aptitude_marks) AS 'Lowest Mark',
GREATEST(python_marks, sql_marks, aptitude_marks) - LEAST(python_marks, sql_marks, aptitude_marks) AS 'Difference'
FROM students_marks;

-- ==========================================================
-- PART H: AGGREGATE FUNCTIONS EXTENSION
-- ==========================================================

-- Q25. Find the minimum and maximum SQL marks across all students.
SELECT 'SQL' AS 'Subject', MAX(sql_marks) AS 'Maximum Marks', MIN(sql_marks) AS 'Minimum Marks' FROM marks; 

-- Q26. Find the average Aptitude marks across all students.
SELECT 'Aptitude' AS 'Subject', AVG(aptitude_marks) AS 'Average Marks' FROM marks; 

-- Q27. Find the total marks scored across all students in SQL.
SELECT 'SQL' AS 'Subject', SUM(sql_marks) AS 'Total Marks' FROM marks;

-- Q28. Find the total marks scored across all students in Aptitude.
SELECT 'Aptitude' AS 'Subject', SUM(aptitude_marks) AS 'Total Marks' FROM marks;

-- Q29. Count the number of students who scored 80 or above in Python.
SELECT COUNT(student_id) AS 'No of Students' FROM marks WHERE python_marks >=80; 

-- Q30. Count the number of students who scored strictly less than 50 in SQL.
SELECT COUNT(student_id) AS 'No of Students' FROM marks WHERE sql_marks < 50; 

-- ==========================================================
-- PART I: FILTERS (WHERE, AND, OR, NOT)
-- ==========================================================

-- Q31. Display all students from the 'Python' department whose age is at least 20.
SELECT * FROM students WHERE department = 'Python' AND age >= 20;

-- Q32. Find students who belong to 'Chennai' OR belong to the 'Java' department.
SELECT * FROM students WHERE department = 'Java' OR city >= 'Chennai';

-- Q33. Retrieve all students whose department is NOT 'Testing'.
SELECT * FROM students WHERE department != 'Testing';

-- Q34. Find marks of students whose python_marks >= 80 AND sql_marks >= 80.
SELECT * FROM marks WHERE python_marks >= 80 AND sql_marks >= 80;

-- Q35. Find marks where aptitude_marks < 60 OR python_marks < 50.
SELECT * FROM marks WHERE aptitude_marks < 60 OR python_marks < 50;

-- Q36. Retrieve students who are NOT from 'Chennai' AND whose age is greater than 20.
SELECT * FROM students WHERE city != 'Chennai';

-- ==========================================================
-- PART J: FILTERS (IN, NOT IN, BETWEEN, NOT BETWEEN)
-- ==========================================================

-- Q37. Find all students residing in Chennai, Madurai and Salem.
SELECT * FROM students WHERE city IN ('Chennai', 'Madurai', 'Salem');

-- Q38. Find all students whose department is not Java or Testing.
SELECT * FROM students WHERE department NOT IN ('Java', 'Testing');

-- Q39. Find marks where sql_marks are BETWEEN 70 AND 90.


-- Q40. Find marks where aptitude_marks are NOT BETWEEN 60 AND 80.


-- Q41. Find students whose age is BETWEEN 19 AND 21.


-- ==========================================================
-- PART K: FILTERS (LIKE PATTERNS)
-- ==========================================================

-- Q42. Find all students whose student_name starts with the letter 'A'.


-- Q43. Find all students whose student_name ends with the letter 'a'.


-- Q44. Find all students whose student_name contains 'uv' or 'um'.


-- Q45. Find all students whose student_name has exactly 4 characters.


-- Q46. Find all students whose student_name has 'r' as the second character.


-- Q47. Find all students whose city starts with 'C'.


-- ==========================================================
-- PART L: FILTERS (IS NULL, IS NOT NULL)
-- ==========================================================

-- Q48. Find all students whose email IS NULL.


-- Q49. Find all students whose email IS NOT NULL.


-- ==========================================================
-- PART M: UPPER & LOWER
-- ==========================================================

-- Q50. Display all student names converted to UPPER case.


-- Q51. Display all department names converted to LOWER case.


-- Q52. Display student_name in UPPER case and city in LOWER case with aliases.


-- Q53. Filter students whose UPPER(city) equals 'CHENNAI'.


-- Q54. Filter students whose LOWER(department) equals 'java'.


-- ==========================================================
-- PART N: SORTING, TOP-N, LIMIT, OFFSET & PAGINATION
-- ==========================================================

-- Q55. Display all students sorted by student_name in ascending alphabetical order.


-- Q56. Display all students sorted by age descending; if age is equal, sort by student_name ascending.


-- Q57. Display the marks table sorted by total marks descending.


-- Q58. Find the top 3 highest scorers in Python marks using LIMIT.


-- Q59. Find the 2nd highest mark in SQL using LIMIT and OFFSET.


-- Q60. Find the 3rd lowest mark in Aptitude using ORDER BY, LIMIT, and OFFSET.


-- Q61. Pagination: Retrieve the first page of 3 students (rows 1 to 3).


-- Q62. Pagination: Retrieve the second page of 3 students (rows 4 to 6).


-- Q63. Pagination: Retrieve the third page of 3 students (rows 7 to 9).


-- ==========================================================
-- PART O: GROUP BY & HAVING EXTENSION
-- ==========================================================

-- Q64. Find the average SQL marks grouped by department.


-- Q65. Find the maximum and minimum Aptitude marks in each department.


-- Q66. Count the number of students from each city.


-- Q67. Display only those cities that have more than 1 student.


-- Q68. Display departments where the average Python marks are 70 or above.


-- Q69. Display departments where the maximum Aptitude marks reached 100.


-- ==========================================================
-- PART P: CASE & CONDITIONAL AGGREGATION
-- ==========================================================

-- Q70. Using CASE, count how many students scored >= 80 in Python in a single summary row.


-- Q71. Using SUM and CASE, display the count of students who passed (total >= 150) and failed (total < 150).


-- Q72. For each student, classify Aptitude performance: >= 80 'Advanced', >= 60 'Intermediate', else 'Beginner'.


-- Q73. Display department and count of students aged >= 21 vs < 21 using CASE inside SUM().


-- ==========================================================
-- PART Q: JOINS (INNER, LEFT, RIGHT)
-- ==========================================================

-- Q74. Display student_name, department, and python_marks using an INNER JOIN.


-- Q75. Display student_name, city, and total marks using an INNER JOIN.


-- Q76. Display all students and their marks using a LEFT JOIN so students without marks are included.


-- Q77. Find students who have NO marks recorded using a LEFT JOIN and IS NULL check.


-- Q78. Display marks records joined with students using a RIGHT JOIN.


-- Q79. Display student_name, department, and sql_marks for students in 'Python' or 'Java' department using INNER JOIN.


-- ==========================================================
-- PART R: UNION & UNION ALL
-- ==========================================================

-- Q80. Combine distinct cities from the students table with a list of cities ('Chennai', 'Madurai', 'Bangalore') using UNION.


-- Q81. Combine student names from the 'Python' department and student names from 'Chennai' using UNION ALL.


-- Q82. Select student_id and 'Passed' for total >= 150 UNION SELECT student_id and 'Failed' for total < 150.


-- ==========================================================
-- PART S: MIX AND MATCH
-- ==========================================================

-- Q83. Find the student_name and department of the student with the highest total marks using JOIN, ORDER BY, and LIMIT.


-- Q84. Display department, average total marks per department, sorted by average total marks descending.


-- Q85. Display student_name, city, and total marks for students living in 'Chennai' scoring total marks > 240.


-- Q86. For students with marks, display UPPER(student_name), department, and their performance category (from Q18).


-- Q87. Find the department with the highest average SQL marks using GROUP BY, ORDER BY, and LIMIT 1.


-- Q88. Display student_name and subject marks for students whose name contains 'a' and total marks >= 200.


-- Q89. Display each department, total students enrolled, and total students who actually have marks recorded.


-- ==========================================================
-- PART T: DML (INSERT, UPDATE, DELETE)
-- ==========================================================

-- Q90. Insert a new student: student_id 11, 'Kiran', department 'Java', city 'Chennai', age 20.


-- Q91. Insert a corresponding mark record for student_id 11: mark_id 109, python 70, sql 75, aptitude 80.


-- Q92. Update the city of student 'Arun' to 'Bangalore'.


-- Q93. Increase sql_marks by 5 for all students whose sql_marks are below 60.


-- Q94. Multi-table UPDATE: Update the city of all students in the 'Testing' department to 'Trichy' using a JOIN update or subquery.


-- Q95. Multi-table UPDATE: Add 5 bonus marks to aptitude_marks for all students belonging to the 'Java' department.


-- Q96. Delete the marks record for student_id 11.


-- Q97. Delete the student record for student_id 11.


-- Q98. Delete the two students without marks added in Q21 (student_id 9 and 10).


-- ==========================================================
-- PART U: DDL (ALTER, RENAME, TRUNCATE, DROP)
-- ==========================================================

-- Q99. Alter the students table to add a column named contact_no VARCHAR(15), then rename it to phone_no, and then drop it.


-- Q100. Rename table marks to student_marks, rename it back to marks, TRUNCATE marks, DROP marks, DROP students, and DROP DATABASE college_db.
