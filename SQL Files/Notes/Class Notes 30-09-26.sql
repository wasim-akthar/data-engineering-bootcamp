-- Fetch all people
SELECT * FROM emp;
-- Fetch people working only in Bangalore
SELECT * FROM emp WHERE city="Bangalore";
-- Fetch people working only in Bangalore, Chennai & Pondicherry
SELECT * FROM emp WHERE city IN ("Bangalore", "Chennai", "Pondicherry");
-- Fetch Prople where Dept id 1, Job title data analyst
SELECT * FROM emp WHERE department_id = 1 AND job_title =  'Data Analyst';
-- Fetch people where age 25, job data analyst, salary 45k
SELECT * FROM emp WHERE age = 25 AND job_title = 'Data Analyst' AND salary=45000;
-- Fetch people where Gender female or age 45
SELECT * FROM emp WHERE gender = "Female" OR age = 45;
-- Fetch people where salary between 45k and 55k, job title software developer
SELECT * FROM emp WHERE (salary BETWEEN 45000 AND 55000) AND job_title = 'Software Developer';
-- OR
SELECT * FROM emp WHERE (salary >= 45000 AND salary <= 55000) AND job_title = 'Software Developer';
-- Fetch people where manager id is 105, 108
SELECT * FROM emp WHERE manager_id = 105 OR manager_id = 108;
-- Fetch people where job title hr exec or manager is 105
SELECT * FROM emp WHERE job_title = "HR Executive" OR manager_id = 105;
-- Fetch male employee working in chennai whose salary is greater than 50000
SELECT * FROM emp WHERE gender = 'Male' AND city = 'Chennai' AND salary > 50000;
-- Fetch all managers in company ( Which means that manager should not be present)
SELECT * FROM emp WHERE manager_id IS NULL;
-- OR
SELECT * FROM emp WHERE job_title LIKE '%Manager';