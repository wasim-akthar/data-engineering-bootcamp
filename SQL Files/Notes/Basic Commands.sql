/*
Student Database:
- Create Student Database as students_db (DB name must/should/will be unique always)
- After creating the Database, Use it and create students table with s_id, name, age, course as fields
*/
/*
- Ctrl + Enter to execute a line where cursor is
- Selected lines can also be run
*/

CREATE database students_db;
-- To view databases
SHOW databases;
-- To use the database for further activities
USE students_db;
-- Query for creating table
create table students(
s_id INT,
name VARCHAR(50),
age INT,
course VARCHAR(50)
);

-- desc: Describe the entity info, in this case, Table.
desc students;

-- insert: To insert values inside a table	
insert into students values
(1, "Wasim", 25, "Data Engineer"),
(2, "Akthar", 24, "Data Engineer"),
(3, "Jaheer", 23, "Data Scientist");

-- select: to view the data from table
SELECT * from students;

/*
Employee Table for Example
- Create a DB for employees named employees_db
- After creating select and use the employeed_db DB
- Create a table named employees with s_no, name, age, role as fields
- Insert 3 entries and verify added values
*/

create database employees_db;

use employees_db;

create table employees(
s_no INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
age INT,
role VARCHAR(100)
);

insert into employees (name, age, role) values
('Wasim', 24, 'Data Engineer'),
('Akthar', 24, 'Data Scientist'),
('Rahul', 21, 'Gen AI Engineer');

SELECT * from employees;

 
 create database employee_db;
 
 use employee_db;
 create table employee (
 emp_id int,
 
 emp_name varchar(50),
 doj int);
 
 insert into employee values
 
 (1,"karan",14536),
 (2, "ajay", 35453 );
 
 select * from employee;
 
 
 drop database employee_db;
 drop database employees_db;
 
 
