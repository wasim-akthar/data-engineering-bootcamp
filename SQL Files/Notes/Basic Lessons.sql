/*
Objective
To create a database for learning SQL basic commands

1. Create a database named sql_basic_commands and use it
2. 


*/

create database sql_basic_commands;
use sql_basic_commands; 

 create table student(
 id int primary key,
 name varchar(50),
 age int
 );
 
 desc student;
 -- ALTER: command used for updating table name, row & column
 alter table student add email varchar(100);
 
 desc student;
 
 insert into student_table values 
 (3, "Wasim", 23, "w@mail.com");

 
 select * from student;
 
 -- Truncate used for removing/clearing all data on table. Usage below
 truncate table student;
 
 -- RENAME: Used for renaming a component of table such as Name, row, columns. Usage below
 RENAME table student to student_table;
 
 --  UPDATE: Update value based on condition. Usage Below
 UPDATE student_table set age=20 where id=1;
 
 -- DELETE: Delete values such as row/record on table based on condition. USage below
 DELETE from student_table where name="Wasim";
 
 select * from student_table;
 
 -- COMMIT: Save current configuration/data like a checkpoint
 
commit;

-- ROLLBACK: Undo 1 step backwards in SQL command. Used when checking for previous value if not known


create table employee (
id int auto_increment primary key,
name varchar(50),
age int,
salary decimal(7,2) 
)
-- Here you can set auto incrememt directly from a specified start value. 
-- Place after the table creation before closing with semicolon. Eg: auto_increment=1 
;

insert into employee (name, age, salary) values
("Was", 23, 23000.23),
("AK", 24, 24000.34),
("Hill", 21, 22000.45);

select * from employee;

commit;
update employee set age=41 where id=2;
-- Here rollback will undo the previous change
rollback;
drop table employee;

set autocommit = ON;