/*
============================================================
SQL PRACTICE ASSIGNMENT — GPAY PAYMENT APPLICATION
============================================================

Scenario:
GPay stores information about its customers, their bank
accounts, and their payment transactions. Use the sample
tables below as the reference for the questions.

Topics covered:
- SELECT and aliases
- Filtering (WHERE)
- SQL commands (CREATE, TRUNCATE)
- UPDATE and ALTER
- Aggregate functions
- CASE and GROUP BY
- Constraints
- Joins
- Subqueries (including EXISTS)
- Window functions
- Subquery + window functions
- CTEs

IMPORTANT:
- Try answering all 30 questions WITHOUT looking anything up.
- Write your answer directly under each question.
- No solutions are included in this file.
- Window functions and CTEs need MySQL 8.0 or later.
- Q10 to Q12 change the data (Arun's city, a new email column,
  Priya's balance), so later queries will show those changes.
- The setup below uses its own database, gpay_practice_db.
  Q7 asks you to create a different database, GPayDB. After
  Q7, switch back with: USE gpay_practice_db;
*/

-- ==========================================================
-- SETUP: TABLES AND SAMPLE DATA (run this first)
-- ==========================================================

CREATE DATABASE IF NOT EXISTS gpay_practice_db;
USE gpay_practice_db;

CREATE TABLE Customers (
    customer_id   INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city          VARCHAR(50),
    age           INT
);

INSERT INTO Customers (customer_id, customer_name, city, age) VALUES
(101, 'Arun', 'Chennai', 25),
(102, 'Priya', 'Bangalore', 30),
(103, 'Karthik', 'Chennai', 22),
(104, 'Divya', 'Madurai', 28),
(105, 'Ravi', 'Coimbatore', 35),
(106, 'Meena', 'Chennai', 27);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    customer_id    INT,
    amount         INT,
    payment_mode   VARCHAR(30),
    status         VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Transactions (transaction_id, customer_id, amount, payment_mode, status) VALUES
(1001, 101, 500, 'UPI', 'Success'),
(1002, 102, 1500, 'UPI', 'Success'),
(1003, 101, 200, 'UPI', 'Failed'),
(1004, 103, 2500, 'Bank Transfer', 'Success'),
(1005, 104, 800, 'UPI', 'Success'),
(1006, 102, 300, 'UPI', 'Failed'),
(1007, 105, 1200, 'Bank Transfer', 'Success'),
(1008, 103, 700, 'UPI', 'Success'),
(1009, 106, 3000, 'UPI', 'Success'),
(1010, 101, 1000, 'Bank Transfer', 'Success');

CREATE TABLE Bank_Accounts (
    account_id  INT PRIMARY KEY,
    customer_id INT,
    bank_name   VARCHAR(30),
    balance     INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Bank_Accounts (account_id, customer_id, bank_name, balance) VALUES
(201, 101, 'SBI', 10000),
(202, 102, 'HDFC', 25000),
(203, 103, 'ICICI', 15000),
(204, 104, 'SBI', 8000),
(205, 105, 'HDFC', 20000),
(206, 106, 'ICICI', 30000);

-- ==========================================================
-- TOPIC 1: SELECT (Q1 - Q3)
-- ==========================================================

-- Q1. The GPay support team wants to see all registered
--     customer details. Write a query to retrieve every column
--     from the Customers table.

SELECT * FROM customers;

-- Q2. The reporting team needs only the customer name and
--     city. Write a query to display these two columns.

SELECT customer_name AS 'Customer Name', city AS 'City' FROM customers;

-- Q3. GPay wants to display all transaction IDs and amounts,
--     using the column aliases Payment_ID and Payment_Amount.

SELECT transaction_id AS Payment_ID, amount AS Payment_Amount FROM transactions;

-- ==========================================================
-- TOPIC 2: FILTERING (WHERE) (Q4 - Q6)
-- ==========================================================

-- Q4. The GPay fraud-monitoring team wants to identify all
--     failed transactions. Display the transaction details
--     where the status is Failed.

SELECT * FROM transactions WHERE status = 'Failed';

-- Q5. The finance team wants to identify successful
--     transactions with amounts greater than ₹1,000.

SELECT * FROM transactions WHERE amount > 1000;

-- Q6. GPay wants to identify customers who belong to Chennai
--     and are older than 24 years.

SELECT * FROM customers WHERE city = 'Chennai' AND age > 24;

-- ==========================================================
-- TOPIC 3: SQL COMMANDS (Q7 - Q9)
-- ==========================================================

-- Q7. GPay wants to create a database named GPayDB and select
--     it for use. Write the required SQL commands.

CREATE DATABASE IF NOT EXISTS GpayDB;
USE GpayDB;

-- Q8. GPay wants to create a table named Merchants with the
--     following columns:
--     - merchant_id   : INT
--     - merchant_name : VARCHAR(50)
--     - city          : VARCHAR(30)
--     Write the SQL query to create the table.

CREATE TABLE Merchants (
	merchant_id    INT,
	merchant_name  VARCHAR(50),
	city           VARCHAR(30)
);

-- Q9. GPay wants to remove all records from a temporary table
--     named Test_Transactions while retaining its structure.
--     Which SQL command should be used?

CREATE TEMPORARY TABLE Test_Transactions AS (
SELECT * FROM transactions
);

-- ==========================================================
-- TOPIC 4: UPDATE & ALTER (Q10 - Q12)
-- (Switch back first: USE gpay_practice_db;)
-- ==========================================================

-- Q10. Customer Arun has moved from Chennai to Hyderabad.
--      Update his city in the Customers table.

UPDATE customers SET city = 'Hyderabad' WHERE customer_id = 101;

-- Q11. GPay wants to add an email column of type VARCHAR(100)
--      to the Customers table.

ALTER TABLE customers ADD COLUMN email VARCHAR(100);

-- Q12. GPay wants to increase Priya's bank account balance by
--      ₹5,000. Write the SQL query to update her balance in
--      Bank_Accounts.

UPDATE Bank_Accounts SET balance = balance + 5000 WHERE customer_id = 102;

-- ==========================================================
-- TOPIC 5: AGGREGATE FUNCTIONS (Q13 - Q15)
-- ==========================================================

-- Q13. The finance team wants to calculate the total value of
--      all successful transactions.

SELECT SUM(amount) AS 'Total Transaction Amount' FROM transactions;

-- Q14. GPay wants to calculate the average transaction amount
--      for successful transactions.

SELECT ROUND(AVG(amount),2) AS 'Average Transaction Amount' FROM transactions;

-- Q15. GPay wants to identify the highest and lowest
--      transaction amounts in the Transactions table.

SELECT MAX(amount) AS 'Highest Transaction Amount', MAX(amount) AS 'Lowest Transaction Amount' FROM transactions;

-- ==========================================================
-- TOPIC 6: CASE & GROUP BY (Q16 - Q18)
-- ==========================================================

-- Q16. GPay wants to categorize transactions into three
--      groups:
--      - Amount below ₹500                    : Small Payment
--      - Amount from ₹500 to ₹1,500 inclusive : Medium Payment
--      - Amount above ₹1,500                  : Large Payment
--      Display the transaction ID, amount, and payment
--      category using CASE.

SELECT transaction_id AS 'Transaction ID', amount AS 'Amount',
CASE
	WHEN amount > 1500 THEN 'Large Payment'
    WHEN amount BETWEEN 500 AND 1500 THEN 'Medium Payment'
    ELSE 'Small Payment'
END AS 'Payment Category' FROM transactions;

-- Q17. The finance team wants to calculate the total
--      transaction amount for each payment mode.

SELECT payment_mode AS 'Payment Mode', SUM(amount) AS 'Total Transaction Amount'
FROM transactions GROUP BY payment_mode;

-- Q18. GPay wants to count successful and failed transactions
--      separately. Write a query to display the transaction
--      status and its corresponding transaction count.

SELECT COUNT(*) AS 'No of Transactions', status AS 'Status'
FROM transactions GROUP BY status;

-- ==========================================================
-- TOPIC 7: CONSTRAINTS (Q19 - Q20)
-- ==========================================================

-- Q19. Create a table named GPay_Users with the following
--      requirements:
--      - user_id must be the primary key.
--      - user_name cannot be NULL.
--      - phone must be unique.
--      - age must be greater than or equal to 18.
--      Write the SQL query with the appropriate constraints.

CREATE TABLE GPay_Users (

	user_id INT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    phone INT(10) UNIQUE,
    age INT CHECK(age >= 18)

);

-- Q20. GPay wants to create a Payments table in which every
--      payment has a unique transaction ID and the customer_id
--      references the Customers table. Write the query with a
--      primary key and foreign key.

CREATE TABLE Payments (

	transaction_id INT UNIQUE PRIMARY KEY,
    FOREIGN KEY (customer_id) REFERENCES transactions(customer_id)

);

-- ==========================================================
-- TOPIC 8: JOINS (Q21 - Q23)
-- ==========================================================

-- Q21. GPay wants to display each customer's name alongside
--      their transaction ID and amount. Write a query using an
--      INNER JOIN.

SELECT customer_name AS 'Customer Name', transaction_id AS 'Transaction ID', amount AS 'Amount'
FROM customers AS c JOIN transactions AS t ON c.customer_id = t.customer_id;


-- Q22. GPay wants to display all customers, including those
--      who have never made a transaction. Write a query using
--      a LEFT JOIN.

SELECT *
FROM customers AS c LEFT JOIN transactions AS t ON c.customer_id = t.customer_id;

-- Q23. The finance team wants to display customer names, bank
--      names, and account balances. Write a query joining the
--      Customers and Bank_Accounts tables.

SELECT customer_name AS 'Customer Name', bank_name AS 'Bank Name', balance AS 'Account Balance'
FROM customers AS c JOIN bank_accounts AS b ON c.customer_id = b.customer_id;

-- ==========================================================
-- TOPIC 9: SUBQUERIES (Q24 - Q25)
-- ==========================================================

-- Q24. GPay wants to identify transactions whose amounts are
--      greater than the average amount of all transactions.
--      Write a query using a subquery.

SELECT * FROM transactions WHERE amount > (SELECT AVG(amount) FROM transactions);

-- Q25. GPay wants to identify customers who have made at least
--      one successful transaction. Write a query using EXISTS.

SELECT * FROM customers AS c WHERE EXISTS ( SELECT 1 FROM transactions AS t WHERE c.customer_id = t.customer_id);

-- ==========================================================
-- TOPIC 10: WINDOW FUNCTIONS (Q26)
-- ==========================================================

-- Q26. GPay wants to rank transactions from highest to lowest
--      amount without removing any transaction records.
--      Display the transaction ID, amount, and rank using
--      RANK().

SELECT RANK() OVER (ORDER BY amount DESC) AS 'Rank', t.* FROM transactions AS t;

-- ==========================================================
-- TOPIC 11: SUBQUERY + WINDOW FUNCTIONS (Q27)
-- ==========================================================

-- Q27. GPay wants to identify the highest-value transaction
--      made by each customer. Use a window function inside a
--      subquery to solve this problem.
SELECT * FROM (
SELECT RANK() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS rank_per_customer
, t.*
FROM (SELECT DISTINCT amount, customer_id FROM transactions) AS t ) AS transact
WHERE rank_per_customer = 1;

-- ==========================================================
-- TOPIC 12: CTE (Q28 - Q30)
-- ==========================================================

-- Q28. GPay wants to calculate the total successful
--      transaction amount using a CTE.

WITH total_success_trans_amount AS (
SELECT SUM(amount) AS total_amount FROM transactions WHERE status = 'Success'
)
SELECT total_amount AS 'Total Successfully Transacted Amount' FROM total_success_trans_amount;


-- Q29. GPay wants to identify customers whose total successful
--      transaction amount exceeds ₹1,000. Use a CTE.

WITH total_cus AS (
SELECT * FROM customers AS c JOIN transactions AS t USING (customer_id)
WHERE status = 'Success' AND amount > 1000
) 
SELECT * FROM total_cus;

-- Q30. GPay wants to identify the top three customers based on
--      their total successful transaction amounts. Use a CTE
--      and a window function.

WITH total_amt AS (
	SELECT customer_id, SUM(amount) AS total_sum FROM transactions WHERE customer_id IN (SELECT customer_id FROM transactions WHERE status = 'Success')
    GROUP BY customer_id ORDER BY total_sum DESC LIMIT 3
) SELECT customer_id AS 'Customer ID', total_sum AS 'Total Amount' FROM total_amt;

