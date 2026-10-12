CREATE TABLE employee_info (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    department_id INT,
    job_title VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE,
    manager_id INT,
    city VARCHAR(50),
    email VARCHAR(100)
);
INSERT INTO employee_info VALUES
(101, 'Arun Kumar', 'Male', 28, 1, 'Data Analyst', 55000, '2022-06-15', 105, 'Chennai', 'arun@gmail.com'),
(102, 'Priya Sharma', 'Female', 26, 1, 'Software Developer', 60000, '2023-01-10', 105, 'Chennai', 'priya@gmail.com'),
(103, 'Rahul Raj', 'Male', 32, 2, 'HR Executive', 45000, '2021-03-20', 108, 'Bangalore', 'rahul@gmail.com');

SELECT * FROM employee_info;

-- Department 2 times, JOb title 2 times in outupt
SELECT employee_id EMP_ID,employee_id EMPLOY_ID,job_title JOB_TITLE,job_title TITLE_OF_JOB FROM employee_info;

-- Select ALL
SELECT * FROM employee_info;

-- Old Salary, New Salary (Old Salary + 200)
Select employee_name NAME, salary AS OLD_SALARY, 200 as BONUS, salary+200 as NEW_SALARY  FROM employee_info;
