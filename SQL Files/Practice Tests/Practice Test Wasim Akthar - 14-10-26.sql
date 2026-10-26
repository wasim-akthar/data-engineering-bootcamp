CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(30),
    city VARCHAR(30),
    marks INT,
    attendance DECIMAL(5,2),
    course_fee DECIMAL(10,2),
    admission_year INT
);

INSERT INTO students (student_id, student_name, age, gender, department, city, marks, attendance, course_fee, admission_year) VALUES
(1,  'Arjun Kumar',      20, 'Male',   'Computer Science', 'Chennai',    85, 92.50, 85000.00, 2022),
(2,  'Priya Sharma',     19, 'Female', 'Electronics',      'Mumbai',     78, 88.75, 80000.00, 2023),
(3,  'Rahul Verma',      21, 'Male',   'Mechanical',       'Delhi',      66, 74.20, 75000.00, 2021),
(4,  'Sneha Iyer',       20, 'Female', 'Computer Science', 'Bangalore',  91, 95.00, 85000.00, 2022),
(5,  'Karthik Raja',     22, 'Male',   'Civil',            'Madurai',    58, 68.40, 70000.00, 2020),
(6,  'Divya Nair',       19, 'Female', 'Information Tech', 'Kochi',      82, 90.10, 82000.00, 2023),
(7,  'Mohammed Faisal',  21, 'Male',   'Electronics',      'Hyderabad',  73, 81.60, 80000.00, 2021),
(8,  'Ananya Reddy',     20, 'Female', 'Biotechnology',    'Hyderabad',  88, 93.30, 90000.00, 2022),
(9,  'Vikram Singh',     23, 'Male',   'Mechanical',       'Jaipur',     61, 70.85, 75000.00, 2019),
(10, 'Lakshmi Menon',    19, 'Female', 'Information Tech', 'Coimbatore', 94, 97.20, 82000.00, 2023),
(11, 'Suresh Babu',      22, 'Male',   'Civil',            'Trichy',     69, 77.50, 70000.00, 2020),
(12, 'Pooja Gupta',      20, 'Female', 'Computer Science', 'Pune',       87, 91.80, 85000.00, 2022),
(13, 'Harish Patel',     21, 'Male',   'Electrical',       'Ahmedabad',  76, 84.00, 78000.00, 2021),
(14, 'Meena Krishnan',   19, 'Female', 'Biotechnology',    'Chennai',    83, 89.45, 90000.00, 2023),
(15, 'Aditya Joshi',     22, 'Male',   'Electrical',       'Nagpur',     64, 72.30, 78000.00, 2020),
(16, 'Nisha Thomas',     20, 'Female', 'Electronics',      'Trivandrum', 79, 86.90, 80000.00, 2022),
(17, 'Rohan Das',        23, 'Male',   'Computer Science', 'Kolkata',    55, 65.10, 85000.00, 2019),
(18, 'Kavya Srinivas',   19, 'Female', 'Information Tech', 'Chennai',    90, 96.00, 82000.00, 2023),
(19, 'Deepak Chandra',   21, 'Male',   'Mechanical',       'Lucknow',    71, 79.25, 75000.00, 2021),
(20, 'Aishwarya Rao',    20, 'Female', 'Civil',            'Mysore',     84, 90.75, 70000.00, 2022);

-- Find students whose marks are greater than the average marks of students from their own city, 
-- but whose marks are less than the overall maximum marks in the table.

SELECT * FROM students s1 WHERE marks > 
	(SELECT AVG(marks) FROM students s2 WHERE s1.city = s2.city)
AND s1.marks < 
	(SELECT max(marks) FROM students);
    
