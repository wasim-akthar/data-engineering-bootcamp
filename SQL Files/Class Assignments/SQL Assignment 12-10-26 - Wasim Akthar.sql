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

-- Q39. Find students who scored between 70 and 90 in sql.
SELECT * FROM students WHERE sql_marks BETWEEN 70 AND 90;

-- Q40. Find marks where aptitude_marks are NOT BETWEEN 60 AND 80.
SELECT * FROM students WHERE aptitude_marks NOT BETWEEN 60 AND 80;

-- Q41. Find students whose age is BETWEEN 19 AND 21.
SELECT * FROM students WHERE age BETWEEN 19 AND 21;

-- ==========================================================
-- PART K: FILTERS (LIKE PATTERNS)
-- ==========================================================

-- Q42. Find all students whose student_name starts with the letter 'A'.
SELECT * FROM students WHERE student_name LIKE 'A%';

-- Q43. Find all students whose student_name ends with the letter 'a'.
SELECT * FROM students WHERE student_name LIKE '%a';

-- Q44. Find all students whose student_name contains 'uv' or 'um'.
SELECT * FROM students WHERE student_name LIKE '%uv%' OR student_name LIKE '%um%';
-- OR
SELECT * FROM students WHERE student_name REGEXP 'um|uv';
-- Q45. Find all students whose student_name has exactly 4 characters.
SELECT * FROM students WHERE LENGTH(student_name) = 4;

-- Q46. Find all students whose student_name has 'r' as the second character.
SELECT * FROM students WHERE student_name LIKE '_r%';

-- Q47. Find all students whose city starts with 'C'.
SELECT * FROM students WHERE city LIKE 'C%';

-- ==========================================================
-- PART L: FILTERS (IS NULL, IS NOT NULL)
-- ==========================================================

-- Q48. Find all students whose email IS NULL.
SELECT * FROM students WHERE email IS NULL;

-- Q49. Find all students whose email IS NOT NULL.
SELECT * FROM students WHERE email IS NOT NULL;

-- ==========================================================
-- PART M: UPPER & LOWER
-- ==========================================================

-- Q50. Display all student names converted to UPPER case.
SELECT UPPER(student_name) AS 'Student Name' FROM students;

-- Q51. Display all department names converted to LOWER case.
SELECT LOWER(department) AS 'Department' FROM students;

-- Q52. Display student_name in UPPER case and city in LOWER case with aliases.
SELECT UPPER(student_name) AS 'Student Name', LOWER(department) AS 'Department' FROM students;

-- Q53. Filter students whose UPPER(city) equals 'CHENNAI'.
SELECT * FROM students WHERE UPPER(city) = 'CHENNAI';

-- Q54. Filter students whose LOWER(department) equals 'java'.
SELECT * FROM students WHERE LOWER(department) = 'java';

-- ==========================================================
-- PART N: SORTING, TOP-N, LIMIT, OFFSET & PAGINATION
-- ==========================================================

-- Q55. Display all students sorted by student_name in ascending alphabetical order.
SELECT * FROM students ORDER BY student_name ASC;

-- Q56. Display all students sorted by age descending; if age is equal, sort by student_name ascending.
SELECT * FROM students ORDER BY age DESC, student_name ASC;

-- Q57. Display the marks table sorted by total marks descending.
SELECT *, (python_marks + sql_marks + aptitude_marks) AS 'Total Marks' FROM marks ORDER BY (python_marks + sql_marks + aptitude_marks) DESC;

-- Q58. Find the top 3 highest scorers in Python marks.
SELECT * FROM marks ORDER BY python_marks LIMIT 3;

-- Q59. Find the 2nd highest mark in SQL.
SELECT * FROM marks ORDER BY sql_marks LIMIT 1 OFFSET 1;

-- Q60. Find the 3rd lowest mark in Aptitude.
SELECT * FROM marks ORDER BY aptitude_marks LIMIT 1 OFFSET 2;

-- Q61. Pagination: Retrieve the first page of 3 students (rows 1 to 3).
SELECT * FROM marks LIMIT 3;

-- Q62. Pagination: Retrieve the second page of 3 students (rows 4 to 6).
SELECT * FROM marks LIMIT 3 OFFSET 3;

-- Q63. Pagination: Retrieve the third page of 3 students (rows 7 to 9).
SELECT * FROM marks LIMIT 3 OFFSET 6;

-- ==========================================================
-- PART O: GROUP BY & HAVING EXTENSION
-- ==========================================================

-- Q64. Find the average SQL marks grouped by department.
SELECT s.department AS 'Department','SQL' AS 'Subject',
ROUND(AVG(m.sql_marks),2) AS 'Average SQL Marks' FROM students AS s
JOIN marks AS m GROUP BY s.department;
 
-- Q65. Find the maximum and minimum Aptitude marks in each department.
SELECT s.department AS 'Department', 'Aptitude' AS 'Subject', 
MAX(m.aptitude_marks) AS 'Maximum Marks', MIN(m.aptitude_marks) AS 'Maximum Marks' FROM students AS s
JOIN marks AS m GROUP BY s.department;

-- Q66. Count the number of students from each city.
SELECT city AS 'City', COUNT(*) AS 'No of Students'
FROM students GROUP BY city;

-- Q67. Display only those cities that have more than 1 student.
SELECT city AS 'City', COUNT(*) AS 'No of Students'
FROM students GROUP BY city HAVING COUNT(*) > 1;

-- Q68. Display departments where the average Python marks are 70 or above.
SELECT s.department AS 'Department', 'Python' AS 'Subject', ROUND(AVG(m.python_marks),2) AS 'Average Marks' FROM students AS s
JOIN marks AS m ON m.student_id = s.student_id GROUP BY s.department HAVING AVG(m.python_marks) >= 70;

-- Q69. Display departments where the maximum Aptitude marks reached 100.
SELECT s.department AS 'Department', 'Aptitude' AS 'Subject', MAX(aptitude_marks) AS 'Maximum Marks' FROM students AS s
JOIN marks AS m ON m.student_id = s.student_id GROUP BY s.department HAVING MAX(aptitude_marks) = 100;

-- ==========================================================
-- PART P: CASE & CONDITIONAL AGGREGATION
-- ==========================================================

-- Q70. Using CASE, count how many students scored >= 80 in Python in a single summary row.
SELECT 'Python' AS 'Subject',
SUM(CASE
	WHEN m.python_marks >= 80 THEN 1 ELSE 0
END) AS 'Eligible People'
FROM marks AS m;

-- Q71. Using SUM and CASE, display the count of students who passed (total >= 150) and failed (total < 150).
SELECT 
'All' AS 'Subject',
SUM(CASE WHEN (python_marks + sql_marks + aptitude_marks) >= 150 THEN 1 ELSE 0 END) AS 'Total Passed',
SUM(CASE WHEN (python_marks + sql_marks + aptitude_marks) < 150 THEN 1 ELSE 0 END) AS 'Total Failed'
FROM marks;

-- Q72. For each student, classify Aptitude performance: >= 80 'Advanced', >= 60 'Intermediate', else 'Beginner'.
SELECT s.student_name AS 'Student Name', 'Aptitude' AS 'Subject', 
CASE
	WHEN m.aptitude_marks >= 80 THEN 'Advanced'
    WHEN m.aptitude_marks >= 60 THEN 'Intermediate'
    ELSE 'Begineer'
END AS 'Performance'
FROM students AS s JOIN marks AS m ON s.student_id = m.student_id;

-- Q73. Display department and count of students aged >= 21 vs < 21 using CASE inside SUM().
SELECT s.department AS 'Department',
SUM(CASE WHEN s.age >=21 THEN 1 ELSE 0 END) AS '21 & Above',
SUM(CASE WHEN s.age < 21 THEN 1 ELSE 0 END) AS 'Below 21'
FROM students AS s GROUP BY s.department;

-- ==========================================================
-- PART Q: JOINS (INNER, LEFT, RIGHT)
-- ==========================================================

-- Q74. Display student_name, department, and python_marks using an INNER JOIN.
SELECT s.student_name AS 'Student Name', s.department AS 'Department', m.python_marks AS 'Python marks' FROM students AS s JOIN marks AS m;

-- Q75. Display student_name, city, and total marks using an INNER JOIN.
SELECT s.student_name AS 'Student Name', s.city AS 'City', CONCAT((python_marks + sql_marks + aptitude_marks),'/300') AS total_marks 
FROM sudents AS s JOIN marks AS m ON s.student_id = m.student_id;

-- Q76. Display all students and their marks using a LEFT JOIN so students without marks are included.
SELECT * FROM students AS s LEFT JOIN marks AS m ON m.student_id = s.student_id;

-- Q77. Find students who have NO marks recorded using a LEFT JOIN and IS NULL check.
SELECT * FROM students AS s LEFT JOIN marks AS m ON m.student_id = s.student_id WHERE m.mark_id IS NULL;

-- Q78. Display marks records joined with students using a RIGHT JOIN.
SELECT * FROM students AS s RIGHT JOIN marks AS m ON m.student_id = s.student_id;

-- Q79. Display student_name, department, and sql_marks for students in 'Python' or 'Java' department using INNER JOIN.
SELECT s.student_name AS 'Name', s.department AS 'Department', m.sql_marks AS 'SQL Marks' FROM students AS s JOIN marks AS m
WHERE s.department IN ('Python', 'Java');

-- ==========================================================
-- PART R: UNION & UNION ALL
-- ==========================================================

-- Q80. Combine distinct cities from the students table with a list of cities ('Chennai', 'Madurai', 'Bangalore') using UNION.
SELECT DISTINCT city FROM students
UNION
SELECT 'Chennai'
UNION
SELECT 'Madurai'
UNION
SELECT 'Bangalore';
-- Q81. Combine student names from the 'Python' department and student names from 'Chennai' using UNION ALL.
SELECT * FROM students WHERE department = 'Python'
UNION ALL
SELECT * FROM students WHERE city = 'Chennai';

-- Q82. Select student_id and 'Passed' for total >= 150 UNION SELECT student_id and 'Failed' for total < 150.
SELECT student_id, 'Passed' AS status
FROM marks
WHERE (python_marks + sql_marks + aptitude_marks) >= 150
UNION
SELECT student_id, 'Failed' AS status
FROM marks
WHERE (python_marks + sql_marks + aptitude_marks) < 150;

-- ==========================================================
-- PART S: MIX AND MATCH
-- ==========================================================

-- Q83. Find the student_name and department of the student with the highest total marks.
SELECT s.student_name AS 'Student Name', s.department AS 'Department', 
CONCAT((m.python_marks + m.sql_marks + m.aptitude_marks),'/300') AS 'Total Marks'
FROM students AS s JOIN marks AS m ON s.student_id = m.student_id ORDER BY (m.python_marks + m.sql_marks + m.aptitude_marks) DESC LIMIT 1;

-- Q84. Display department, average total marks per department, sorted by average total marks descending.
SELECT s.department AS 'Department', AVG(CONCAT((m.python_marks + m.sql_marks + m.aptitude_marks),'/300')) AS 'Average Total Marks'
FROM students AS s JOIN marks AS m ON s.student_id = m.student_id GROUP BY s.department ORDER BY AVG(m.python_marks + m.sql_marks + m.aptitude_marks) DESC;

-- Q85. Display student_name, city, and total marks for students living in 'Chennai' scoring total marks > 240.
SELECT s.student_name AS 'Name', s.city AS 'City', CONCAT((m.python_marks + m.sql_marks + m.aptitude_marks),'/300') AS 'Total Marks'
FROM students AS s JOIN marks AS m ON s.student_id = m.student_id WHERE s.city = 'Chennai' AND (m.python_marks + m.sql_marks + m.aptitude_marks) > 240;

-- Q86. For students with marks, display UPPER(student_name), department, and their performance category (from Q18).
WITH student_marks AS (
SELECT 
	s.student_name,
	s.student_id,
    CONCAT((m.python_marks + m.sql_marks + m.aptitude_marks),'/300') AS total_marks
FROM students AS s JOIN marks AS m ON s.student_id = m.student_id    
)
SELECT student_id AS 'Student ID', student_name AS 'Student Name', total_marks AS 'Total Marks',
CASE
	WHEN total_marks >= 250 THEN 'Excellent'
    WHEN total_marks BETWEEN 200 AND 249 THEN 'Good'
    WHEN total_marks BETWEEN 150 AND 199 THEN 'Average'
    ELSE 'Needs Improvement'
END AS 'Performance'
FROM student_marks;

-- Q87. Find the department with the highest average SQL marks.
SELECT s.department AS 'Department', 'SQL' AS 'Subject', ROUND(AVG(m.sql_marks),2) AS 'Average marks' 
FROM students AS s JOIN marks AS m ON m.student_id = s.student_id GROUP BY s.department ORDER BY AVG(m.sql_marks) DESC LIMIT 1;

-- Q88. Display student_name and subject marks for students whose name contains 'a' and total marks >= 200.
SELECT s.student_name AS 'Name', m.* FROM students AS s JOIN marks AS m ON m.student_id = s.student_id 
WHERE s.student_name LIKE '%a%' AND(m.python_marks + m.sql_marks + m.aptitude_marks) >=200;

-- Q89. Display each department, total students enrolled, and total students who actually have marks recorded.
SELECT s.department AS 'Department', COUNT(s.student_id) AS 'Total Students Enrolled', COUNT(m.student_id) AS 'Total Student Marks Recorded'
FROM students AS s JOIN marks AS m ON m.student_id = s.student_id GROUP BY s.department;

-- ==========================================================
-- PART T: DML (INSERT, UPDATE, DELETE)
-- ==========================================================

-- Q90. Insert a new student: student_id 11, 'Kiran', department 'Java', city 'Chennai', age 20.
INSERT INTO students (student_id, student_name, department, city, age) VALUES
(11, 'Kiran', 'Java',  'Chennai', 20);

-- Q91. Insert a corresponding mark record for student_id 11: mark_id 109, python 70, sql 75, aptitude 80.
INSERT INTO marks (student_id, mark_id, python_marks, sql_marks, aptitude_marks) VALUES
(11, 109, 70, 75, 80);

-- Q92. Update the city of student 'Arun' to 'Bangalore'.
UPDATE students SET city = 'Bangalore' WHERE student_name = 'Arun';

-- Q93. Increase sql_marks by 5 for all students whose sql_marks are below 60.
UPDATE students SET sql_marks = sql_marks + 5 WHERE sql_marks < 60;

-- Q94. Multi-table UPDATE: Update the city of all students in the 'Testing' department to 'Trichy' using a JOIN update or subquery.
UPDATE students SET city = 'Trichy' WHERE department IN (SELECT s.department FROM students AS s WHERE department = 'Testing');

-- Q95. Multi-table UPDATE: Add 5 bonus marks to aptitude_marks for all students belonging to the 'Java' department.
UPDATE marks SET aptitude_marks = aptitude_marks + 5 WHERE department IN (SELECT s.department FROM students AS s WHERE department = 'JAVA');

-- Q96. Delete the marks record for student_id 11.
DELETE FROM marks WHERE student_id = 11;

-- Q97. Delete the student record for student_id 11.
DELETE FROM student WHERE student_id = 11;

-- Q98. Delete the two students without marks added in Q21 (student_id 9 and 10).
DELETE FROM student WHERE student_id IN (9,10);

-- ==========================================================
-- PART U: DDL (ALTER, RENAME, TRUNCATE, DROP)
-- ==========================================================

-- Q99. Alter the students table to add a column named contact_no VARCHAR(15), then rename it to phone_no, and then drop it.
ALTER TABLE students ADD COLUMN contact_no VARCHAR(15);
ALTER TABLE students RENAME COLUMN contact_no TO phone_no;
ALTER TABLE students DROP COLUMN contact_no;

-- Q100. Rename table marks to student_marks, rename it back to marks, TRUNCATE marks, DROP marks, DROP students, and DROP DATABASE college_db.
RENAME TABLE marks TO student_marks;
RENAME TABLE student_marks TO marks;
TRUNCATE marks;
DROP TABLE marks;
DROP TABLE students;
DROP DATABASE college_db;
