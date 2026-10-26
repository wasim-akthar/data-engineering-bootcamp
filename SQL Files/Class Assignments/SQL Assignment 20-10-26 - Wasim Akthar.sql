-- Create student_details table
CREATE TABLE student_details (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    course VARCHAR(50) NOT NULL,
    fee DECIMAL(10, 2) NOT NULL
);

-- Insert 20 records
INSERT INTO student_details (id, name, course, fee) VALUES
(1, 'Arun', 'Computer Science', 22000.00),
(2, 'Priya', 'Computer Science', 19500.00),
(3, 'Rohan', 'Mechanical Engineering', 18000.00),
(4, 'Sneha', 'Data Science', 25000.00),
(5, 'Vikram', 'Mechanical Engineering', 16500.00),
(6, 'Ananya', 'Civil Engineering', 14000.00),
(7, 'Karthik', 'Computer Science', 21000.00),
(8, 'Meera', 'Data Science', 24000.00),
(9, 'Rahul', 'Electronics', 17500.00),
(10, 'Divya', 'Civil Engineering', 15000.00),
(11, 'Suresh', 'Electronics', 18500.00),
(12, 'Pooja', 'Data Science', 25000.00),
(13, 'Amit', 'Mechanical Engineering', 15500.00),
(14, 'Neha', 'Computer Science', 20000.00),
(15, 'Manoj', 'Civil Engineering', 13500.00),
(16, 'Deepa', 'Electronics', 19000.00),
(17, 'Rajesh', 'Data Science', 23000.00),
(18, 'Kavita', 'Mechanical Engineering', 17000.00),
(19, 'Sanjay', 'Civil Engineering', 16000.00),
(20, 'Harish', 'Electronics', 17000.00);

-- Section A — Subquery scenarios

-- 1. Above-average fees: The college wants to identify students whose fees are greater than the average fee of all students. Write a query using a subquery.
SELECT * FROM student_details WHERE fee > (SELECT AVG(fee) FROM student_details);

-- 2. Second-highest fee: The college wants to find the second-highest distinct fee amount without using LIMIT. Write a query using a subquery.
SELECT MAX(fee) AS 'Second Highest Fee' FROM student_details WHERE fee < (SELECT MAX(fee) FROM student_details); 

-- 3. Same course as Arun: Find all students who are enrolled in the same course as Arun. Use a subquery.
SELECT * FROM student_details WHERE course = (SELECT course FROM student_details WHERE id = 1);

-- 4. Maximum fee students: Find all students who pay the highest fee in the college. If multiple students have the same highest fee, return all of them.
SELECT * FROM student_details WHERE fee = ( SELECT MAX(fee) FROM student_details);

-- 5. Below-average course fees: Find students whose fees are lower than the average fees of students enrolled in their own course.
SELECT * FROM student_details AS s1 WHERE fee < (SELECT AVG(fee) FROM student_details AS s2 WHERE s1.course = s2.course);

-- 6. High-fee courses: Find all students studying courses in which at least one student pays ₹18,000 or more.
SELECT * FROM student_details WHERE course = ANY ( SELECT course FROM student_details WHERE fee >=18000);

-- 7. Third-highest distinct fee: Find the third-highest distinct fee amount using a subquery and without using LIMIT.
SELECT MAX(DISTINCT fee) AS 'Third Highest Fee' FROM student_details WHERE fee < ( 
	SELECT MAX(DISTINCT fee) FROM student_details WHERE fee < 
		(SELECT MAX(DISTINCT fee) FROM student_details)
	);
-- 8. Course maximum: Find students who pay the maximum fee within their respective courses.
SELECT * FROM student_details AS s1 WHERE fee = (SELECT MAX(fee) FROM student_details AS s2 WHERE s1.course = s2.course); 

-- Section B — Window function scenarios

-- 9. Unique student numbering: Give each student a unique row number based on fees, highest first.
SELECT ROW_NUMBER() OVER (ORDER BY fee DESC) AS 'S.No', s.* FROM student_details AS s;

-- 10. Fee ranking: Rank all students by fees using RANK(). Students with equal fees should share the same rank.
SELECT RANK() OVER (ORDER BY fee DESC) AS 'Rank', s.* FROM student_details AS s;

-- 11. Dense ranking: Rank students by fees using DENSE_RANK(). The ranks must not contain gaps.
SELECT DENSE_RANK() OVER (ORDER BY fee DESC) AS 'Rank', s.* FROM student_details AS s;

-- 12. Course-wise ranking: Rank students separately within each course, using the highest fee as rank 1.
SELECT RANK() OVER (PARTITION BY course ORDER BY fee DESC) AS 'Rank', s.* FROM student_details AS s;

-- 13. Top two fee levels: Display students whose fee rank is 1 or 2 within their course. Use DENSE_RANK().
SELECT * FROM (SELECT DENSE_RANK() OVER (PARTITION BY course ORDER BY fee DESC) AS 'Course_Rank', s.* FROM student_details AS s) AS students WHERE course_rank <=2;

-- 14. Previous student's fee: Display every student with the fee of the previous student, ordered by student_id.
SELECT *, LAG(fee, 1,0) OVER (ORDER BY id) AS 'Prev Student Fee' FROM student_details;

-- 15. Next student's fee: Display every student with the fee of the next student, ordered by student_id.
SELECT *, LEAD(fee, 1,0) OVER (ORDER BY id) AS 'Next Student Fee' FROM student_details;

-- 16. Fee difference: Display each student's fee and the difference between their fee and the previous student's fee.
SELECT *, ABS(fee - LAG (fee) OVER (ORDER BY id)) AS 'Fee Difference' FROM student_details;

-- 17. Three groups: Divide all students into three approximately equal groups based on fees, highest first.
 SELECT NTILE(3) OVER (ORDER BY fee DESC) AS 'Group', s.* FROM student_details AS s;