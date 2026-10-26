/* =============================================================================
   SQL INTERACTIVE LEARNING GUIDE: CTEs vs. Views
   =============================================================================
   Core Objectives:
     1. Understand Common Table Expressions (CTE) — local, single-statement scope.
     2. Understand Views — persistent, reusable virtual query layers.
     3. Practice multi-stage filtering, joins, and derived analytics.
   ============================================================================= */


-- =============================================================================
-- SECTION 1: Database Setup & Data Seeding
-- =============================================================================

-- Step 1.1: Create and select the database context
CREATE DATABASE rapido_db;
USE rapido_db;

-- Step 1.2: Define base table schema
-- id is marked as the PRIMARY KEY (unique identifier, non-null)
CREATE TABLE drivers (
    driver_name VARCHAR(100),
    id INT PRIMARY KEY,
    city VARCHAR(100),
    total_rides INT
);

-- Step 1.3: Populate sample records for multi-city driver analysis
INSERT INTO drivers (driver_name, id, city, total_rides) VALUES 
('Aarav Sharma', 1, 'Mumbai', 432), ('Aditya Patel', 2, 'Delhi', 789), ('Vivaan Gupta', 3, 'Bengaluru', 124),
('Saanvi Reddy', 4, 'Hyderabad', 560), ('Diya Nair', 5, 'Chennai', 89), ('Arjun Verma', 6, 'Kolkata', 612),
('Sai Kumar', 7, 'Hyderabad', 345), ('Ishaan Mishra', 8, 'Pune', 231), ('Ananya Joshi', 9, 'Mumbai', 910),
('Rahul Das', 10, 'Kolkata', 156), ('Pranav Rao', 11, 'Bengaluru', 478), ('Yash Singh', 12, 'Ahmedabad', 623),
('Reyansh Mehta', 13, 'Surat', 88), ('Krishna Pillai', 14, 'Chennai', 511), ('Aanya Bhat', 15, 'Delhi', 704),
('Rohan Kapoor', 16, 'Mumbai', 390), ('Dev Choudhury', 17, 'Kolkata', 415), ('Aariyan Khan', 18, 'Lucknow', 289),
('Kabir Malhotra', 19, 'Jaipur', 174), ('Rudra Joshi', 20, 'Pune', 550), ('Kavya Krishnan', 21, 'Kochi', 602),
('Dhruv Saxena', 22, 'Delhi', 831), ('Avani Deshmukh', 23, 'Mumbai', 145), ('Ishita Goel', 24, 'Bengaluru', 720),
('Shaurya Tiwari', 25, 'Kanpur', 94), ('Tanishq Sethi', 26, 'Indore', 315), ('Aarohi Kulkarni', 27, 'Pune', 463),
('Ayush Jadhav', 28, 'Mumbai', 587), ('Atharv Banerjee', 29, 'Kolkata', 211), ('Gaurav Hegde', 30, 'Bengaluru', 674),
('Meera Nambiar', 31, 'Chennai', 398), ('Rithvik Raju', 32, 'Hyderabad', 812), ('Akash Sen', 33, 'Kolkata', 120),
('Prisha Singhal', 34, 'Delhi', 542), ('Siddharth Bose', 35, 'Kolkata', 303), ('Karan Johar', 36, 'Mumbai', 490),
('Aditi Rao', 37, 'Hyderabad', 715), ('Vihaan Jain', 38, 'Ahmedabad', 267), ('Madhav Menon', 39, 'Kochi', 183),
('Sneha Shetty', 40, 'Bengaluru', 649), ('Tanvi Marathe', 41, 'Pune', 422), ('Rishi Dhawan', 42, 'Delhi', 895),
('Manish Pandey', 43, 'Patna', 134), ('Shreya Ghoshal', 44, 'Mumbai', 519), ('Alok Tripathi', 45, 'Lucknow', 276),
('Pooja Hegde', 46, 'Bengaluru', 388), ('Vivek Agnihotri', 47, 'Bhopal', 99), ('Neha Kakkar', 48, 'Delhi', 607),
('Abhishek Bachchan', 49, 'Mumbai', 441), ('Vikram Seth', 50, 'Chandigarh', 325);


-- =============================================================================
-- SECTION 2: Direct Filtering vs. Common Table Expressions (CTEs)
-- =============================================================================

-- [Baseline]: Standard inline query without a CTE
-- Direct filtering using AND conditions in a single pass.
SELECT * 
FROM drivers 
WHERE city = 'Chennai' 
  AND total_rides > 150 
  AND id = 14;

/*
   CONCEPT: What is a CTE (Common Table Expression)?
   - Initiated with the `WITH` keyword.
   - Creates a temporary, named result set that exists ONLY during the execution
     of the statement directly following it.
   - Useful for readability, modular data transformation, and replacing complex subqueries.
*/

-- [CTE Example 1]: Filtering rows into an intermediate step
-- Step 1 (WITH): Pull all Chennai drivers into temporary CTE 'chennai_drivers'
-- Step 2 (SELECT): Run targeted condition checks against 'chennai_drivers'
WITH chennai_drivers AS (
    SELECT * 
    FROM drivers
    WHERE city = 'Chennai'
) 
SELECT * 
FROM chennai_drivers 
WHERE total_rides > 150 
  AND id = 14;

-- [CTE Example 2]: Using CTE with aggregate metrics
/*
   LEARNING NOTE:
   In strict SQL mode, mixing `SELECT *` with `MIN(total_rides)` without a GROUP BY
   collapses all rows into one or throws an error. To keep individual rows alongside
   the calculated minimum, window functions (MIN() OVER()) or subqueries are standard.
*/
WITH chennai_drivers AS (
    SELECT 
        *,
        MIN(total_rides) OVER () AS min_rides
    FROM drivers
    WHERE city = 'Chennai'
) 
SELECT * 
FROM chennai_drivers 
WHERE city = (SELECT city FROM chennai_drivers WHERE id = 14) 
  AND total_rides > (SELECT MIN(min_rides) FROM chennai_drivers);


-- =============================================================================
-- SECTION 3: Views (Virtual Reusable Tables)
-- =============================================================================
/*
   CONCEPT: CTE vs. VIEW
   -----------------------------------------------------------------------------
   Feature       | CTE (WITH ...)                | VIEW (CREATE VIEW ...)
   --------------+-------------------------------+------------------------------
   Persistence   | Query-lifetime only           | Stored in database catalog
   Reusability   | Single statement execution    | Reusable across any statement
   Storage       | In-memory result set pipeline | Stored SQL definition
   -----------------------------------------------------------------------------
*/

-- Create the view 'chennai_drivers'
-- Stored permanently until explicitly deleted using DROP VIEW
CREATE VIEW chennai_drivers AS 
SELECT * 
FROM drivers 
WHERE city = 'Chennai';

-- Querying the view directly (just like a physical table)
SELECT * 
FROM chennai_drivers;

-- Applying runtime filters on top of the view's predefined logic
SELECT * 
FROM chennai_drivers 
WHERE total_rides > 150;


-- =============================================================================
-- SECTION 4: Multi-Table Views & Derived Calculations
-- =============================================================================

-- Switch to the college academic database
USE college_db;

/*
   CONCEPT: Derived Columns in Views
   - Computations like total and average marks are computed on-the-fly.
   - Eliminates redundant business calculations across queries.
*/
ALTER VIEW student_total_marks AS 
    SELECT 
        s.*, 
        m.python_marks, 
        m.sql_marks, 
        m.aptitude_marks, 
        (m.python_marks + m.sql_marks + m.aptitude_marks) AS total_marks,
        ROUND((m.python_marks + m.sql_marks + m.aptitude_marks) / 3.0, 2) AS average_marks
    FROM students AS s 
    JOIN marks AS m ON m.student_id = s.student_id;


-- =============================================================================
-- SECTION 5: Querying the Derived View
-- =============================================================================

-- 5.1: Select only the computed total score
SELECT total_marks AS 'Total Marks' 
FROM student_total_marks;

-- 5.2: Find the lowest scoring student using a scalar subquery against the view
SELECT * 
FROM student_total_marks 
WHERE total_marks = (SELECT MIN(total_marks) FROM student_total_marks);

-- 5.3: Find the highest scoring student (rank 1)
SELECT * 
FROM student_total_marks 
WHERE total_marks = (SELECT MAX(total_marks) FROM student_total_marks);

-- 5.4: Extract a high-level summary report for students and averages
SELECT 
    student_name AS 'Student Name', 
    average_marks AS 'Average Marks' 
FROM student_total_marks;

-- 5.5: Order records by total marks ascending (lowest to highest)
SELECT * 
FROM student_total_marks 
ORDER BY total_marks ASC;

-- 5.6: Order records by total marks descending (leaderboard view)
SELECT * 
FROM student_total_marks 
ORDER BY total_marks DESC;

-- 5.7: Order records by average marks ascending
SELECT * 
FROM student_total_marks 
ORDER BY average_marks ASC;

-- 5.8: Order records by average marks descending
SELECT * 
FROM student_total_marks 
ORDER BY average_marks DESC;