/*
============================================================
SQL MINI PROJECT 2 — COLLEGE STUDENT MARKS MANAGEMENT SYSTEM
(WITH SUBQUERIES) — 100 QUESTIONS
============================================================

Scenario:
A college stores student details and subject marks in MySQL.
You will build the database and then answer 100 reporting and
maintenance questions that get harder level by level.

Levels (25 questions each):
- LEVEL 1: BEGINNER        (Q1   - Q25)
- LEVEL 2: INTERMEDIATE    (Q26  - Q50)
- LEVEL 3: HARD            (Q51  - Q75)
- LEVEL 4: INTERVIEW LEVEL (Q76  - Q100)

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
- Functions: UPPER, LOWER, ROUND, CONCAT, ABS
- DML: INSERT, UPDATE, DELETE (including multi-table)
- DDL: ALTER, DROP, TRUNCATE, RENAME
- Subqueries: single-row, multi-row, correlated, EXISTS,
  NOT EXISTS, ANY, ALL

IMPORTANT:
- Write your answer directly under each question.
- Use meaningful aliases for calculated columns.
- Total marks = python_marks + sql_marks + aptitude_marks.
- No solutions are included in this file.
- Run the questions in order. Every DML / DDL question in
  Levels 1 to 3 is paired with an "undo" question, so the data
  returns to its original state before the next level begins.
- Q97 to Q100 permanently change or remove data. Run them last.
*/

-- ==========================================================
-- REFERENCE DATA (use this to write your INSERT statements)
-- ==========================================================

/*
Table 1: students
+------------+--------------+------------+---------------------+-----+------------+
| student_id | student_name | department | email               | age | city       |
+------------+--------------+------------+---------------------+-----+------------+
| 1          | Arun         | Python     | arun@college.com    | 20  | Chennai    |
| 2          | Priya        | Java       | priya@college.com   | 21  | Madurai    |
| 3          | Kumar        | Python     | kumar@college.com   | 19  | Chennai    |
| 4          | Divya        | Java       | divya@college.com   | 22  | Coimbatore |
| 5          | Ravi         | Python     | ravi@college.com    | 20  | Salem      |
| 6          | Meena        | Testing    | meena@college.com   | 23  | Chennai    |
| 7          | Suresh       | Testing    | suresh@college.com  | 18  | Trichy     |
| 8          | Anu          | Java       | anu@college.com     | 21  | Chennai    |
| 9          | Kavitha      | Python     | kavitha@college.com | 20  | Chennai    |
| 10         | Ganesh       | Testing    | NULL                | 22  | Madurai    |
+------------+--------------+------------+---------------------+-----+------------+

Table 2: marks
(Students 9 and 10 have no marks record on purpose.)
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
-- LEVEL 1: BEGINNER (Q1 - Q25)
-- Setup, SELECT, aliases, arithmetic, simple filters,
-- aggregates, simple subqueries, simple DML / DDL
-- ==========================================================

-- Q1. Create a database named college_db and select it.

CREATE DATABASE college_db;
USE college_db;

-- Q2. Create the students table with student_id as the primary
--     key, student_name as NOT NULL, department, email as UNIQUE,
--     age with a CHECK constraint of at least 17, and city with
--     a default value of 'Chennai'.

CREATE TABLE students (
    student_id   INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    department   VARCHAR(30),
    email        VARCHAR(100) UNIQUE,
    age          INT CHECK (age >= 17),
    city         VARCHAR(50) DEFAULT 'Chennai'
);

-- Q3. Create the marks table with mark_id as the primary key,
--     student_id as a foreign key referencing students, and
--     CHECK constraints so python_marks, sql_marks and
--     aptitude_marks are each between 0 and 100.

CREATE TABLE marks (
    mark_id        INT PRIMARY KEY,
    student_id     INT NOT NULL,
    python_marks   INT CHECK (python_marks BETWEEN 0 AND 100),
    sql_marks      INT CHECK (sql_marks BETWEEN 0 AND 100),
    aptitude_marks INT CHECK (aptitude_marks BETWEEN 0 AND 100),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Q4. Insert the given students and marks records into the
--     tables. (Ganesh has no email, so insert NULL for it.)

INSERT INTO students (student_id, student_name, department, email, age, city) VALUES
(1,  'Arun',    'Python',  'arun@college.com',    20, 'Chennai'),
(2,  'Priya',   'Java',    'priya@college.com',   21, 'Madurai'),
(3,  'Kumar',   'Python',  'kumar@college.com',   19, 'Chennai'),
(4,  'Divya',   'Java',    'divya@college.com',   22, 'Coimbatore'),
(5,  'Ravi',    'Python',  'ravi@college.com',    20, 'Salem'),
(6,  'Meena',   'Testing', 'meena@college.com',   23, 'Chennai'),
(7,  'Suresh',  'Testing', 'suresh@college.com',  18, 'Trichy'),
(8,  'Anu',     'Java',    'anu@college.com',     21, 'Chennai'),
(9,  'Kavitha', 'Python',  'kavitha@college.com', 20, 'Chennai'),
(10, 'Ganesh',  'Testing', NULL,                  22, 'Madurai');

INSERT INTO marks (mark_id, student_id, python_marks, sql_marks, aptitude_marks) VALUES
(101, 1, 85, 90, 80),
(102, 2, 75, 80, 70),
(103, 3, 90, 95, 85),
(104, 4, 60, 65, 70),
(105, 5, 45, 55, 50),
(106, 6, 80, 75, 85),
(107, 7, 35, 40, 45),
(108, 8, 95, 90, 100);

-- Q5. Display all columns of all students.
SELECT * FROM students;

-- Q6. Display student_name and department with the aliases
--     'Student Name' and 'Department'.
SELECT student_name AS 'Student Name', department AS 'Department' FROM students;

-- Q7. Display the unique departments.
SELECT DISTINCT department AS 'Departments' FROM students;

-- Q8. Display the students who live in Chennai.
SELECT * FROM students WHERE city = 'Chennai';

-- Q9. Display the students whose age is greater than 20.
SELeCT * FROM students WHERE age > 20;

-- Q10. Display mark_id, student_id and the total marks of each
--      record with the alias 'Total Marks'.
SELECT mark_id AS 'Mark ID', (python_marks + sql_marks + aptitude_marks) AS 'Total Marks' FROM marks;

-- Q11. Display mark_id and the average of the three subject marks
--     of each record, rounded to 2 decimal places, with the alias
--     'Average Marks'.
SELECT mark_id AS 'Mark ID', ROUND(AVG(python_marks + sql_marks + aptitude_marks), 2) AS 'Average Marks' FROM marks GROUP BY mark_id;

-- Q12. Find the total number of students.
SELECT COUNT(*) AS 'Total Students' FROM students;

-- Q13. Find the highest and lowest Python marks in one query.
SELECT 'Python' AS'Subject', MAX(python_marks) AS 'Maximum Marks', MIN(python_marks) AS 'Minimum Marks' FROM marks;

-- Q14. Find the average SQL marks of all students, rounded to 2
--     decimal places.
SELECT 'SQL' AS'Subject', ROUND(AVG(sql_marks),2) AS 'Average Marks' FROM marks;

-- Q15. Display all students sorted by age from oldest to
--      youngest.
SELECT * FROM students ORDER BY age DESC;

-- Q16. Display the top 3 Python scores from the marks table
--      (student_id and python_marks), highest first.
SELECT student_id AS 'Student ID', python_marks AS 'Python Marks' FROM marks ORDER BY python_marks DESC LIMIT 3;

-- Q17. Display the number of students in each department.
SELECT department AS 'Department', COUNT(*) AS 'Total number of students' FROM students GROUP BY department;

-- Q18. Display the students whose name starts with the
--      letter 'A'.
SELECT * FROM students WHERE student_name LIKE 'A%';

-- Q19. Display the students who do not have an email.
SELECT * FROM students WHERE email IS NULL;

-- Q20. Display each student's name in UPPER case followed by their
--     department in lower case in a single column, in the format
--     'ARUN - python', with the alias 'Student Profile'.
SELECT CONCAT(UPPER(student_name), ' - ',LOWER(department)) AS 'Student Profile' FROM students;

-- Q21. Display the marks records whose python_marks is greater than
--     the average python_marks.
SELECT * FROM marks WHERE python_marks > (SELECT AVG(python_marks) FROM marks);

-- Q22. Display the oldest student(s).
SELECT * FROM students WHERE age = (SELECT MAX(age) FROM students);

-- Q23. Insert a new student (11, 'Kiran', 'Java',
--      'kiran@college.com', 20, 'Chennai'), then update his city
--      to 'Madurai'.
INSERT INTO students (student_id, student_name, department, email, age, city) VALUES
(11, 'Kiran', 'Java', 'kiran@college.com', 20, 'Chennai');

-- Q24. Undo Q23: delete the student Kiran (student_id 11).
DELETE FROM students WHERE student_id = 11;

-- Q25. Add a column phone VARCHAR(15) to the students table,
--      then drop it again.
ALTER TABLE students ADD COLUMN phone VARCHAR(15);
ALTER TABLE students DROP COLUMN phone;

-- ==========================================================
-- LEVEL 2: INTERMEDIATE (Q26 - Q50)
-- Combined filters, JOINs, GROUP BY / HAVING, CASE, Top-N,
-- pagination, UNION and subqueries
-- ==========================================================

-- Q26. Display the students from the Python or Java department
--      whose age is at least 20.
SELECT s.* FROM students WHERE department IN ('Python', 'Java') AND age < 20;

-- Q27. Display the students who live in Chennai, Madurai or
--      Salem and are not from the Testing department.
SELECT * FROM students WHERE city IN ('Chennai', 'Madurai', 'Salem') AND department != 'Testing';

-- Q28. Display the marks records where sql_marks is between
--      70 and 90 (inclusive).
SELECT * FROM marks WHERE sql_marks BETWEEN 70 AND 90;

-- Q29. Display the students whose name ends with the letter 'a'.
SELECT * FROM students WHERE student_name LIKE '%a';

-- Q30. Display student_name, department and python_marks for all
--     students who have a marks record, along with the difference
--     between python_marks and sql_marks as a positive number with
--     the alias 'Marks Gap'.
SELECT s.student_name AS 'Student Name', s.department AS 'Department', 
m.python_marks AS 'Python Marks', ABS(m.python_marks - m.sql_marks) AS 'Marks Gap' 
FROM students AS s JOIN marks AS m ON m.student_id = s.student_id;

-- Q31. Display all students with their marks, including the
--     students who have no marks record.
SELECT * FROM students LEFT JOIN marks ON marks.student_id = students.student_id;

-- Q32. Find the students who have no marks record.
SELECT * FROM students LEFT JOIN marks ON marks.student_id = students.student_id WHERE marks.student_id IS NULL;

-- Q33. Display the average SQL marks of each department, rounded to
--     2 decimal places.
SELECT s.department AS 'Department', 'SQL' AS 'Subject', ROUND(AVG(m.sql_marks),2) AS 'Average Marks' 
FROM students AS s JOIN marks AS m ON m.student_id = s.student_id GROUP BY Department;

-- Q34. Display the departments that have more than 3 students
--      enrolled, with the number of students.
SELECT department AS 'Department', COUNT(*) AS 'Total Students'
FROM students GROUP BY department HAVING COUNT(*) > 3;

-- Q35. Display student_name, total marks shown in the format
--     'total/300' (for example '255/300'), and a performance
--     category:
--     250 and above -> 'Excellent'
--     200 to 249    -> 'Good'
--     150 to 199    -> 'Average'
--     Below 150     -> 'Needs Improvement'
SELECT s.student_name AS 'Name', CONCAT((m.python_marks + m.sql_marks + m.aptitude_marks), '/300') AS 'Total Marks', 
CASE
	WHEN (m.python_marks + m.sql_marks + m.aptitude_marks) >= 250 THEN 'Excellent'
    WHEN (m.python_marks + m.sql_marks + m.aptitude_marks) BETWEEN 200 AND 249 THEN 'Good'
    WHEN (m.python_marks + m.sql_marks + m.aptitude_marks) BETWEEN 150 AND 199 THEN 'Average'
    ELSE 'Needs Improvement'
END AS 'Performance Category'
FROM students AS s JOIN marks AS m ON m.student_id = s.student_id;


-- Q36. Find the student with the 2nd highest Python marks
--     (student_name and python_marks).
SELECT s.student_name AS 'Name','Python' AS 'Subject', MAX(m.python_marks) AS 'Highest Marks' FROM students AS s JOIN marks AS m ON m.student_id = s.student_id
GROUP BY s.student_id LIMIT 1 OFFSET 1;


-- Q37. Display the second page of students, with 3 students per
--     page, sorted by student_name.
SELECT * FROM students ORDER BY student_name LIMIT 3 OFFSET 3;

-- Q38. Display the names of students from the Python department
--     combined with the names of students from Chennai, with
--     duplicates removed.
SELECT student_name AS 'Student Name' FROM students
WHERE department = 'Python'
UNION
SELECT student_name AS 'Student Name' FROM students
WHERE city = 'Chennai';

-- Q39. Repeat Q38 but keep the duplicates. Which names appear
--     twice?
SELECT student_name AS 'Student Name' FROM students
WHERE department = 'Python'
UNION ALL
SELECT student_name AS 'Student Name' FROM students
WHERE city = 'Chennai';
-- Arun, Kumar, Kavitha

-- Q40. Without using any JOIN, display the students who have a
--     marks record.
SELECT * FROM students WHERE student_id IN (SELECT student_id FROM marks);

-- Q41. Without using any JOIN, display the students who do not have
--     a marks record.
SELECT * FROM students WHERE student_id NOT IN (SELECT student_id FROM marks);

-- Q42. Display the students whose age is greater than the average
--     age of all students.
SELECT * FROM students WHERE age > (SELECT AVG(age) FROM students);

-- Q43. Display student_name and total marks for the students whose
--     total marks are above the average total marks.
SELECT s.student_name AS 'Name', (m.python_marks + m.sql_marks + m.aptitude_marks) AS 'Total Marks'
FROM students AS s JOIN marks AS m ON m.student_id = s.student_id
WHERE (m.python_marks + m.sql_marks + m.aptitude_marks) > (
	SELECT AVG(python_marks + sql_marks + aptitude_marks) AS 'Average Total Marks' FROM marks
    );
    
-- Q44. Find the name of the student who scored the highest SQL
--     marks.
SELECT s.student_name AS 'Student Name' FROM students AS s JOIN marks AS m ON s.student_id = m.student_id
WHERE m.sql_marks = (SELECT MAX(sql_marks) FROM marks);

-- Q45. Display the names in UPPER case of the Java department
--     students, regardless of how the department name is
--     capitalised.
SELECT UPPER(student_name) AS 'Name' FROM students WHERE LOWER(department) = 'java';

-- Q46. Display the cities that have more than one student and
--      the number of students in each, highest count first.
SELECT city AS 'City', COUNT(*) AS 'Number of Students' FROM students GROUP BY city HAVING COUNT(*) > 1 ORDER BY COUNT(*) DESC;

-- Q47. Insert a new student (11, 'Kiran', 'Java',
--      'kiran@college.com', 20, 'Chennai') and a marks record
--      (109, 11, 70, 75, 80).
INSERT INTO students (student_id, student_name, department, email, age, city) VALUES
(11, 'Kiran', 'Java', 'kiran@college.com', 20, 'Chennai');
INSERT INTO marks (mark_id, student_id, python_marks, sql_marks, aptitude_marks) VALUES
(109, 11, 70, 75, 80);

-- Q48. Increase the sql_marks of mark_id 109 by 10.
UPDATE marks SET sql_marks = sql_marks + 10 WHERE mark_id = 109;

-- Q49. Undo Q47: delete the marks record 109 and then the
--      student 11 (in the correct order).
DELETE FROM marks WHERE mark_id = 109;
DELETE FROM students WHERE student_id = 11; 

-- Q50. Rename the students table to college_students, then
--      rename it back to students.
RENAME TABLE students TO college_students;
RENAME TABLE college_students TO students;


CREATE OR REPLACE VIEW student_inner_marks AS (
	SELECT s.*, m.mark_id, m.aptitude_marks, m.python_marks, m.sql_marks,
    (m.python_marks + m.sql_marks + m.aptitude_marks) AS total_marks
	FROM students AS s JOIN marks AS m ON m.student_id = s.student_id
);

-- ==========================================================
-- LEVEL 3: HARD (Q51 - Q75)
-- Joins with aggregates, conditional logic, nested and
-- correlated subqueries, multi-table DML and DDL
-- ==========================================================

-- Q51. For each department, display the number of students
--      enrolled and the number of those students who have a
--      marks record.
SELECT s.department AS 'Department', COUNT(s.student_id) AS 'Enrolled Students', COUNT(m.student_id) AS 'Students With Marks Record'
FROM students AS s JOIN marks AS m ON m.student_id = s.student_id GROUP BY Department;

-- Q52. Display the departments whose total Python marks are
--      greater than 200.
SELECT s.department AS 'Department', 'Python' AS 'Subject', SUM(m.python_marks) AS 'Total Marks'
FROM students AS s JOIN marks AS m ON m.student_id = s.student_id GROUP BY Department
HAVING SUM(m.python_marks) > 200;

-- Q53. For each department, display the number of students whose
--     total marks are 200 or more and the number whose total marks
--     are below 200.
SELECT s.department AS 'Department', 
'Total Marks' AS 'Category',
SUM(CASE WHEN (python_marks + sql_marks + aptitude_marks) >= 200 THEN 1 ELSE 0 END) AS 'More Than 200',
SUM(CASE WHEN (python_marks + sql_marks + aptitude_marks) < 200 THEN 1 ELSE 0 END) AS 'Less  Than 200'
FROM students AS s JOIN marks AS m ON m.student_id = s.student_id GROUP BY Department;

-- Q54. Display student_name, total marks and a result column:
--      'Pass' if total marks are 150 or more AND no subject is
--      below 40, otherwise 'Fail'.
WITH student_marks AS (
	SELECT *, (python_marks + sql_marks + aptitude_marks) AS total_marks
	FROM student_inner_marks
)
SELECT student_name AS 'Student Name', total_marks AS 'Total Marks',
CASE 
	WHEN total_marks >= 150 AND LEAST(python_marks, sql_marks, aptitude_marks) >= 40 THEN 'Pass'
    ELSE 'Fail'
END AS 'Result'
FROM student_marks;

-- Q55. Find the 3rd highest total marks: display student_name and
--     total marks.
SELECT student_name AS 'Name', MAX(total_marks) AS 'Highest Total Marks' 
FROM student_inner_marks GROUP BY student_id LIMIT 1 OFFSET 2;

-- Q56. Display the names in UPPER case and the SQL marks of the
--      students from Chennai or Madurai who scored more than 70
--      in SQL.
SELECT UPPER(student_name) AS 'Name', 'SQL' AS 'Subject', sql_marks AS 'Marks'
FROM student_inner_marks WHERE city IN ('Chennai', 'Madurai') AND sql_marks > 70;

-- Q57. Display the second page of the marks table (mark_id,
--     student_id and the overall percentage of total marks out of
--     300 as text such as '75%'), with 3 records per page, sorted
--     by overall percentage from highest to lowest.
SELECT mark_id AS 'Mark ID', student_id AS 'Student ID', 
CONCAT((python_marks + sql_marks + aptitude_marks), '/300') AS 'Total Marks', 
ROUND(((python_marks + sql_marks + aptitude_marks)/300)*100, 2) AS 'Percentage'
FROM marks ORDER BY Percentage DESC LIMIT 3 OFFSET 3; 

-- Q58. Display student names with the label 'Top Scorer' (total
--     marks 250 or more) together with student names with the
--     label 'At Risk' (total marks below 150) in a single result.
SELECT student_name AS 'Student Name','Top Scorer' AS 'Category'
FROM student_inner_marks WHERE total_marks >=250
UNION ALL
SELECT student_name AS 'Student Name', 'At Risk' AS 'Category'
FROM student_inner_marks WHERE total_marks < 150;

-- Q59. Display the students whose Python marks are higher than the
--     average Python marks of their own department.
SELECT s.* FROM students AS s JOIN marks AS m ON m.student_id = s.student_id 
WHERE m.python_marks > (SELECT AVG(python_marks) FROM marks) AND s.department = 'Python';

-- Q60. Display the students who have scored 90 or more in at least
--     one subject.
SELECT * FROM student_inner_marks WHERE GREATEST(sql_marks, python_marks, aptitude_marks) >=90;
-- OR
SELECT * FROM student_inner_marks AS s WHERE EXISTS (
	SELECT 1 FROM marks AS m WHERE m.student_id = s.student_id 
	AND (m.python_marks >=90 OR m.sql_marks >=90 OR m.aptitude_marks >=90)
);

-- Q61. Find the students who have no marks record without using
--     JOIN, IN or NOT IN.
SELECT * FROM students AS s WHERE NOT EXISTS (SELECT student_id FROM marks AS m WHERE m.student_id = s.student_id); 

-- Q62. Display the students who are older than at least one student
--     of the Testing department.
SELECT * FROM students AS s WHERE age > ANY ( SELECT age FROM students AS s2 WHERE department = 'Testing');

-- Q63. Display student_name and python_marks of the students who
--     scored higher in Python than every student of the Testing
--     department.
SELECT student_name AS 'Name', 'Python' AS 'Subject' , python_marks AS 'Marks' FROM student_inner_marks 
WHERE python_marks > ALL (SELECT python_marks FROM student_inner_marks WHERE department = 'Testing');

-- Q64. Display the students who belong to the departments whose
--     average student age is greater than 20.
SELECT * FROM students AS s WHERE department IN (SELECT department FROM students AS s2 GROUP BY department HAVING AVG(age) > 20); 

-- Q65. Display the student(s) with the highest total marks without
--     using LIMIT.
SELECT * FROM student_inner_marks AS s WHERE total_marks = (SELECT MAX(total_marks) FROM student_inner_marks); 

-- Q66. Display the students (other than Arun) whose total marks
--     differ from Arun's total marks by 30 or less, in either
--     direction.
SELECT * FROM student_inner_marks AS s WHERE student_id != 1 AND 
ABS(total_marks - (SELECT total_marks FROM student_inner_marks WHERE student_id = 1)) <=30;

-- Q67. Display the departments whose average SQL marks are higher
--     than the average SQL marks of the whole college.
SELECT department AS 'Department', 'SQL' AS 'Subject', ROUND(AVG(sql_marks),2) AS 'Average Marks' FROM student_inner_marks 
GROUP BY department HAVING AVG(sql_marks) > (SELECT AVG(sql_marks) FROM marks);

-- Q68. Increase aptitude_marks by 5 for all students of the Testing
--     department.
UPDATE marks SET aptitude_marks = aptitude_marks + 5 WHERE student_id = ANY (SELECT student_id FROM students WHERE department = 'Testing');

-- Q69. Undo Q68: reduce aptitude_marks by 5 for all students of
--      the Testing department.
UPDATE marks SET aptitude_marks = aptitude_marks - 5 WHERE student_id = ANY (SELECT student_id FROM students WHERE department = 'Testing');

-- Q70. Change the city to 'Trichy' for the students whose Python
--     marks are below 50.
UPDATE (students AS s JOIN marks AS m ON m.student_id = s.student_id) SET s.city = 'Trichy' WHERE m.python_marks < 50;

-- Q71. Undo Q70: restore the city of student 5 to 'Salem'.
UPDATE (students AS s JOIN marks AS m ON m.student_id = s.student_id) SET s.city = 'Salem' WHERE s.student_id = 5;

-- Q72. Add a column grade CHAR(1) to the marks table.
ALTER TABLE marks ADD COLUMN grade CHAR(1);

-- Q73. Fill the grade column using CASE on total marks:
--      250 or more -> 'A', 200 to 249 -> 'B', otherwise 'C'.
UPDATE marks SET grade = (
	CASE 
		WHEN (python_marks + sql_marks + aptitude_marks) >= 250 THEN 'A'
        WHEN (python_marks + sql_marks + aptitude_marks) BETWEEN 200 AND 249 THEN 'B'
        ELSE 'C'
	END) WHERE mark_id > 0;
-- Q74. Display each grade and the number of students who
--      received it.
SELECT grade AS 'Grade', COUNT(*) AS 'No of Students' FROM marks GROUP BY grade;

-- Q75. Drop the grade column from the marks table.
ALTER TABLE marks DROP COLUMN grade;

-- ==========================================================
-- LEVEL 4: INTERVIEW LEVEL (Q76 - Q100)
-- Questions that interviewers love: Nth highest values,
-- group-wise top records, correlated logic, NULL traps,
-- multi-condition reporting
-- ==========================================================

-- Q76. Find the 2nd highest SQL marks without using LIMIT or
--      OFFSET.
SELECT MAX(sql_marks) AS 'Second Highest SQL Marks' FROM marks WHERE sql_marks < (SELECT MAX(sql_marks) FROM marks);

-- Q77. Find the student(s) with the 2nd highest total marks
--      without using LIMIT or OFFSET.
SELECT SUM(total_marks) AS 'Second Highest Total Marks' FROM student_inner_marks WHERE total_marks < (SELECT SUM(total_marks) FROM student_inner_marks);

-- Q78. For each department, display the student with the
--      highest total marks (department, student_name, total
--      marks).
SELECT s.department AS 'Department', s.student_name AS 'Student Name', MAX(s.total_marks) AS 'Highest Total Marks'
FROM student_inner_marks AS s GROUP BY s.department, s.student_name HAVING MAX(s.total_marks) = (SELECT MAX(s1.total_marks) FROM student_inner_marks AS s1 WHERE s1.department = s.department);

-- Q79. Display the students who scored above their own
--      department's average in ALL three subjects.
SELECT s.department AS 'Department', s.student_name AS 'Student Name', s.total_marks AS 'Total Marks'
FROM student_inner_marks AS s GROUP BY s.department, s.student_name HAVING AVG(s.total_marks) > (SELECT AVG(s1.total_marks) FROM student_inner_marks AS s1 WHERE s1.department = s.department);

-- Q80. Display the students who have a marks record and have not
--     scored below 50 in any subject.
SELECT * FROM student_inner_marks AS s WHERE EXISTS (
	SELECT 1 FROM marks AS m WHERE m.student_id = s.student_id 
	AND (m.python_marks > 50 AND m.sql_marks > 50 AND m.aptitude_marks > 50)
);

-- Q81. A developer wrote:
--        SELECT * FROM students
--        WHERE email NOT IN (SELECT email FROM students
--                            WHERE department = 'Testing');
--      It returns no rows. Explain why (in a comment), then
--      rewrite it so it correctly returns the students whose
--      email does not match any Testing student's email.
/*
	Since it returns null in between those values, The IN returns unknown which in turn does not return any rows
*/
        SELECT * FROM students
        WHERE email NOT IN (SELECT email FROM students
                            WHERE department = 'Testing' AND email IS NOT NULL);

-- Q82. Display the departments in which every student who has
--      a marks record scored total marks of 150 or more.
SELECT DISTINCT s.department AS 'Department' FROM student_inner_marks AS s 
WHERE NOT EXISTS ( SELECT  DISTINCT s2.department FROM student_inner_marks AS s2 WHERE s.department = s2.department AND total_marks < 150);	

-- Q83. Display the department with the highest average total marks
--     without using LIMIT or ORDER BY.
SELECT department AS 'Department', AVG(total_marks) AS 'Average Total Marks' FROM student_inner_marks AS s1
GROUP BY department HAVING AVG(total_marks) >= ALL
(SELECT AVG(total_marks) FROM student_inner_marks AS s2 GROUP BY s2.department);

-- Q84. Display the cities whose number of students is greater
--      than the average number of students per city.
SELECT city AS 'City', COUNT(*) AS 'No of Students' FROM student_inner_marks
GROUP BY city HAVING COUNT(*) > (
    SELECT AVG(city_count)
    FROM (
        SELECT COUNT(*) AS city_count
        FROM student_inner_marks
        GROUP BY city
    ) AS city_summary
);

-- Q85. For each student who has a marks record, display
--      student_name and their strongest subject
--      ('Python', 'SQL' or 'Aptitude'). If there is a tie,
--      prefer Python, then SQL.
SELECT student_name AS 'Student Name', 
CASE 
	WHEN python_marks >= sql_marks AND python_marks >= aptitude_marks THEN 'Python'
    WHEN sql_marks >= aptitude_marks THEN 'SQL'
    ELSE 'Aptitude'
END AS 'Strongest Subject' FROM student_inner_marks;

-- Q86. In a single row, display how many students have Python, SQL
--     and Aptitude as their strongest subject (same tie rule as
--     Q85).
SELECT COUNT(*) AS 'Total number of Students', strongest_sub AS 'Strongest Subject' FROM (SELECT
CASE 
	WHEN python_marks >= sql_marks AND python_marks >= aptitude_marks THEN 'Python'
    WHEN sql_marks >= aptitude_marks THEN 'SQL'
    ELSE 'Aptitude'
END AS strongest_sub FROM student_inner_marks) AS main_marks GROUP BY strongest_sub;

-- Q87. Department report: department, students enrolled,
--     students with marks, average total marks of those with
--     marks (rounded to 2 decimal places), and a label:
--     average 230 or more -> 'Strong', 180 or more -> 'Stable',
--     otherwise 'Weak'. Show only departments with at least 2
--     enrolled students, highest average first.
SELECT s.department AS 'Department', COUNT(s.student_id) AS 'Students Enrolled',
COUNT(m.mark_id) AS 'Students With Marks', ROUND(AVG(m.python_marks + m.sql_marks + m.aptitude_marks)) AS 'Average Total Marks',
CASE
	WHEN AVG(m.python_marks + m.sql_marks + m.aptitude_marks) >= 230 THEN 'Strong'
    WHEN AVG(m.python_marks + m.sql_marks + m.aptitude_marks) >= 180 THEN 'Stable'
    ELSE 'Weak'
END AS 'Contestant' FROM students AS s JOIN marks AS m ON m.student_id = s.student_id GROUP BY department HAVING COUNT(m.mark_id) > 2;

-- Q88. Display the students with the top 3 total marks without
--     using LIMIT.
SELECT * FROM student_inner_marks WHERE total_marks IN (
	

-- Q89. Display the students whose SQL marks are above the
--      college average SQL marks but whose Aptitude marks are
--      below the college average Aptitude marks.


-- Q90. Display the names of students who scored 90 or more in any
--     subject together with the names of students who scored below
--     50 in any subject, in a single result without duplicates.


-- Q91. For each city, display the number of students and the
--      number of students who have no marks record.


-- Q92. Display the 4th to 6th highest total scorers: student_name
--     and total marks shown in the format 'total/300'.


-- Q93. Display the students who live in the same city as the
--      student with the highest total marks.


-- Q94. Display the students who belong to the same department
--      as the student with the lowest SQL marks.


-- Q95. For each department, display the youngest student(s)
--     (department, student_name, age).


-- Q96. Create a copy of the marks table named marks_backup that
--     includes all its data, then remove all rows from
--     marks_backup, then delete the marks_backup table.


-- Q97. Delete the marks records of the Testing department students
--     who are younger than 20.


-- Q98. Delete the students who no longer have a marks record.


-- Q99. Add a column remarks VARCHAR(50) to the marks table,
--      rename it to comments, then drop it.


-- Q100. Clean up: drop the marks table, the students table and
--       then the college_db database.