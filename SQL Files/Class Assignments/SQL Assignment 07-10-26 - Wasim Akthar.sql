/*
============================================================
SQL PRACTICE ASSIGNMENT — ORDERS TABLE
============================================================

Topic: CASE Expressions & HAVING Clause

IMPORTANT:
- Table name: orders
- 10 sample records are provided.
- Try answering all 30 questions WITHOUT looking anything up.
- No solutions are included in this file.
*/

-- ==========================================================
-- SECTION 1: TABLE SETUP
-- ==========================================================

CREATE TABLE order_summary (
    order_id        INT PRIMARY KEY,
    customer_name   VARCHAR(50),
    category        VARCHAR(50),
    amount          DECIMAL(10,2),
    status          VARCHAR(20)
);

-- ==========================================================
-- SECTION 2: SAMPLE DATA
-- ==========================================================

INSERT INTO order_summary VALUES
(101, 'Arun', 'Electronics', 45000, 'Delivered'),
(102, 'Priya', 'Clothing', 2500, 'Delivered'),
(103, 'Karthik', 'Electronics', 15000, 'Cancelled'),
(104, 'Divya', 'Grocery', 3500, 'Delivered'),
(105, 'Arun', 'Clothing', 8000, 'Delivered'),
(106, 'Priya', 'Electronics', 55000, 'Delivered'),
(107, 'Karthik', 'Grocery', 1800, 'Delivered'),
(108, 'Divya', 'Electronics', 22000, 'Delivered'),
(109, 'Arun', 'Grocery', 6000, 'Cancelled'),
(110, 'Priya', 'Clothing', 12000, 'Delivered');

-- ==========================================================
-- SECTION 3: CASE QUESTIONS
-- ==========================================================

-- Q1. Write a query to display order_id, amount, and order_level.
--     Amount >= 20,000 -> High
--     Amount >= 5,000  -> Medium
--     Otherwise        -> Low
SELECT order_id AS "Order ID", amount AS Amount, 
CASE 
    WHEN amount >= 20000 THEN "High"
    WHEN amount >= 5000 THEN "Medium"
    ELSE "Low"
END AS order_level
FROM order_summary;

-- Q2. Write a query to display order_id, status, and
--     delivery_result.
--     Delivered -> Completed
--     Cancelled -> Failed
SELECT order_id AS "Order ID", status AS Status, 
CASE 
    WHEN status = 'Delivered' THEN "Completed"
    WHEN status = 'Cancelled' THEN "Failed"
    ELSE "Low"
END AS delivery_result
FROM order_summary;

-- Q3. Write a query to display customer_name, amount, and
--     purchase_type.
--     Amount >= 10,000 -> Expensive
--     Amount >= 5,000  -> Moderate
--     Otherwise        -> 
SELECT customer_name AS "Customer Name", amount AS Amount,
CASE 
    WHEN amount >= 10000 THEN "Expensive"
    WHEN amount >= 5000 THEN "Moderate"
    ELSE "Affordable"
END AS purchase_type
FROM order_summary;

-- Q4. Write a query to display order_id, category, and
--     category_type.
--     Electronics -> Electronic Product
--     Clothing    -> Fashion Product
--     Grocery     -> Grocery Product
SELECT order_id AS "Order ID", category AS Category,
CASE 
    WHEN category = 'Electronics' THEN "Electronic Product"
    WHEN category = 'Clothing' THEN "Fashion Product"
    WHEN category = 'Grocery' THEN "Grocery Product"
    ELSE "Others"
END AS category_type
FROM order_summary;

-- Q5. Write a query to display order_id, amount, and discount.
--     Amount >= 40,000 -> 20%
--     Amount >= 20,000 -> 10%
--     Otherwise        -> 5%
SELECT order_id AS "Order ID", amount AS Amount,
CASE 
    WHEN amount >= 40000 THEN "20%"
    WHEN amount >= 20000 THEN "10%"
    ELSE "5%"
END AS discount,
CASE 
    WHEN amount >= 40000 THEN ROUND(amount - (amount*0.2), 2)
    WHEN amount >= 20000 THEN ROUND(amount - (amount*0.1), 2)
    ELSE ROUND(amount - (amount*0.05), 2)
END AS discounted_price
FROM order_summary;


-- ==========================================================
-- SECTION 4: HAVING QUESTIONS
-- ==========================================================

-- Q6. Write a query to find customers who placed more than
--     2 orders.
SELECT customer_name AS 'Customer Name', COUNT(*) AS 'Num of Orders' FROM order_summary
GROUP BY customer_name
HAVING COUNT(*) > 2;


-- Q7. Write a query to find customers whose total purchase
--     amount is greater than 20,000.
SELECT customer_name AS 'Customer Name', SUM(amount) AS 'Amount Spent' FROM order_summary
GROUP BY customer_name
HAVING SUM(amount) > 20000;

-- Q8. Write a query to find categories having more than
--     2 orders.
SELECT category AS 'Category', COUNT(*) AS 'Num of Orders' FROM order_summary
GROUP BY category
HAVING COUNT(*) > 2;

-- Q9. Write a query to find categories whose average order
--     amount is greater than 10,000.
SELECT category AS 'Category', AVG(amount) AS 'Average Amount' FROM order_summary
GROUP BY category
HAVING AVG(amount) > 10000;

-- Q10. Write a query to find customers whose total purchase
--      amount is greater than 50,000.
SELECT customer_name AS 'Customer Name', SUM(amount) AS 'Total Amount' FROM order_summary
GROUP BY customer_name
HAVING SUM(amount) > 50000;

-- ==========================================================
-- SECTION 5: CASE + HAVING QUESTIONS
-- ==========================================================

-- Q11. Find each customer's total purchase and classify them:
--      >= 50,000 -> Premium
--      >= 20,000 -> Regular
--      Otherwise -> Basic
SELECT customer_name AS 'Customer Name', SUM(amount) AS 'Total Amount',
CASE
	WHEN SUM(amount) >= 50000 THEN 'Premium'
    WHEN SUM(amount) >= 20000 THEN 'Regular'
    ELSE 'Basic'
END AS "Purchase Type"
FROM order_summary
GROUP BY customer_name;
	

-- Q12. Find only customers whose total purchase is greater
--      than 20,000, and classify them:
--      >= 50,000 -> Premium
--      >= 30,000 -> Gold
--      Otherwise -> Silver
SELECT customer_name AS 'Customer Name', SUM(amount) AS 'Total Amount',
CASE
	WHEN SUM(amount) >= 50000 THEN 'Premium'
    WHEN SUM(amount) >= 30000 THEN 'Gold'
    ELSE 'Silver'
END AS "Eligible Membership"
FROM order_summary
GROUP BY customer_name
HAVING SUM(amount) > 20000;


-- Q13. Find each category's total sales and classify:
--      >= 50,000 -> Excellent
--      >= 20,000 -> Good
--      Otherwise -> Average
SELECT category AS 'Category', SUM(amount) AS 'Total Amount',
CASE
	WHEN SUM(amount) >= 50000 THEN 'Excellent'
    WHEN SUM(amount) >= 20000 THEN 'Good'
    ELSE 'Average'
END AS "Performance"
FROM order_summary
GROUP BY category;

-- Q14. Find categories having at least 3 orders and classify
--      them based on average amount:
--      >= 20,000 -> High Value
--      >= 5,000  -> Medium Value
--      Otherwise -> Low Value
SELECT category AS 'Category', COUNT(*) AS 'Total Orders',
CASE
	WHEN AVG(amount) >= 20000 THEN 'High Value'
    WHEN AVG(amount) >= 5000 THEN 'Medium Value'
    ELSE 'Low Value'
END AS "Weightage"
FROM order_summary
GROUP BY category
HAVING COUNT(*) >= 3;

-- Q15. Find customers having more than 2 orders and display
--      their total purchase amount along with:
--      >= 50,000 -> VIP
--      >= 25,000 -> Gold
--      Otherwise -> Regular
SELECT customer_name AS 'Customer Name', COUNT(*) AS 'Total Orders', SUM(amount) AS 'Total Purchase',
CASE
	WHEN SUM(amount) >= 50000 THEN 'VIP'
    WHEN SUM(amount) >= 25000 THEN 'Gold'
    ELSE 'Regular'
END AS "Member"
FROM order_summary
GROUP BY customer_name
HAVING COUNT(*) > 2;

-- ==========================================================
-- SECTION 6: CASE — INTERVIEW LEVEL (nested logic, correlated
-- subqueries inside CASE)
-- ==========================================================

-- Q16. Display order_id, customer_name, status, amount, and a
--      column named net_amount:
--      - If status = 'Cancelled'                     -> 0
--      - Else if status = 'Delivered' AND amount >
--        40,000 (a loyalty bonus order)               -> amount * 1.1
--      - Otherwise                                    -> amount
--      (This needs a CASE with more than one condition
--      checked per branch, in the right order.)
SELECT customer_name AS 'Customer Name', order_id AS 'Order ID', status AS 'Status', amount AS 'Amount',
CASE
	WHEN status = 'Cancelled' THEN 0
    WHEN (status = 'Delivered' AND amount > 40000) THEN ROUND(amount * 1.1, 2)
    ELSE amount
END AS net_amount
FROM order_summary;

-- Q17. Display order_id, category, amount, and a column named
--      rank_tag that labels an order 'Category Topper' if its
--      amount equals the highest amount within its own
--      category, otherwise 'Standard'.
--      (Hint: you cannot just compare to a fixed number — the
--      CASE condition needs to reference the maximum amount
--      for that specific category, e.g. via a subquery.)
SELECT main.order_id AS 'Order ID', main.category AS 'Category', main.amount AS 'Amount',
CASE 
	WHEN main.amount = (SELECT MAX(sub.amount) FROM order_summary as sub WHERE main.category = sub.category) THEN "Category Topper"
    ELSE 'Standard'
END AS rank_tag
FROM order_summary AS main;

-- Q18. Display customer_name, order_id, amount, and a column
--      named spend_pattern that labels an order 'Big Spender
--      Order' if its amount is more than double that same
--      customer's own average order amount, otherwise 'Normal
--      Order'.
--      (Hint: the comparison value is different for every
--      customer — think about a correlated subquery.)
SELECT main.customer_name AS "Customer Name", main.order_id AS 'Order ID', main.amount AS 'Amount',
CASE
	WHEN main.amount > 2 * (SELECT AVG(sub.amount) FROM order_summary AS sub WHERE sub.customer_name = main.customer_name) THEN 'Big Spender Order'
	ELSE 'Normal Order'
END AS spend_pattern
FROM order_summary AS main;

-- ==========================================================
-- SECTION 7: HAVING — INTERVIEW LEVEL (ratios, conditional
-- aggregates, MAX/MIN spread, ALL-vs-ANY style logic)
-- ==========================================================

-- Q19. Find customers whose total amount from 'Delivered'
--      orders is more than double their total amount from
--      'Cancelled' orders. Your query must still work
--      correctly for a customer who has zero cancelled
--      orders (no divide-by-zero errors).
SELECT customer_name FROM order_summary
GROUP BY customer_name
HAVING SUM(CASE WHEN status = 'Delivered' THEN amount ELSE 0 END) > 
   2 * SUM(CASE WHEN status = 'Cancelled' THEN amount ELSE 0 END);

-- Q20. Find categories where more than 50% of their orders
--      have status 'Cancelled'.
SELECT category FROM order_summary
GROUP BY category
HAVING 1.0 * SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*) > 0.5;

-- Q21. Find customers who have placed at least one order above
--      ₹20,000 AND at least one order below ₹5,000 (i.e. both
--      a big order and a small order somewhere in their
--      history).
SELECT main.customer_name AS 'Customer Name' FROM order_summary AS main
GROUP BY main.customer_name
HAVING SUM(CASE WHEN main.amount > 20000 THEN 1 ELSE 0 END) >= 1 AND
SUM( CASE WHEN main.amount < 5000 THEN 1 ELSE 0 END) >= 1 ;


-- Q22. Find categories where the gap between the highest and
--      lowest order amount in that category exceeds ₹30,000.
SELECT category AS 'Category' FROM order_summary AS main
GROUP BY category
HAVING MAX(amount) - MIN(amount) > 30000;

-- Q23. Find customers whose number of distinct categories
--      ordered from is equal to their total number of orders
--      (meaning none of their orders repeat a category).
SELECT main.customer_name AS 'Customer Name' FROM order_summary
GROUP BY main.customer_name
HAVING COUNT(DISTINCT category) = COUNT(*);

-- ==========================================================
-- SECTION 8: CASE + HAVING — INTERVIEW LEVEL (multi-metric
-- classification, conditional-aggregate ratios, revenue-share
-- subqueries)
-- ==========================================================

-- Q24. Find each customer's total order count, total amount,
--      and cancelled order count. Show only customers with
--      more than 1 order, and classify them:
--      - cancelled count > 0 AND total > 50,000 -> 'Risky High Value'
--      - total > 50,000                          -> 'High Value'
--      - cancelled count > 0                      -> 'Risky'
--      - Otherwise                                -> 'Stable'
SELECT 	customer_name AS 'Customer Name', 
		COUNT(*) AS 'Total Orders', 
        SUM(amount) AS 'Total Amount', 
        SUM(CASE WHEN status = 'Cancelled' THEN 1 else 0 END) AS 'Cancelled Orders Count',
CASE
	WHEN SUM(CASE WHEN status = 'Cancelled' THEN 1 else 0 END) > 0 AND SUM(amount) > 50000 THEN 'Risky High Value'
    WHEN SUM(amount) > 50000 THEN 'High Value'
    WHEN SUM(CASE WHEN status = 'Cancelled' THEN 1 else 0 END) > 0 THEN 'Risky'
    ELSE 'Stable'
END AS 'Customer Order Pattern'
FROM order_summary GROUP BY customer_name HAVING  COUNT(*) > 1;


-- Q25. Find each category's total sales, order count, and
--      number of distinct customers. Show only categories with
--      more than 2 distinct customers, and classify them by
--      sales-per-customer (total sales / distinct customers):
--      >= 20,000 -> 'High Per-Customer Value'
--      Otherwise -> 'Low Per-Customer Value'
SELECT category AS Category, SUM(amount) AS "Total Sales", COUNT(*) AS 'Total Orders', COUNT(DISTINCT customer_name) AS 'Total Customers',
CASE
	WHEN SUM(amount)/COUNT(DISTINCT customer_name) >= 20000 THEN 'High Per-Customer Value'
    ELSE 'Low Per-Customer Value'
END AS 'Sales Per Customer'
FROM order_summary
GROUP BY category
HAVING COUNT(DISTINCT customer_name) > 2;

-- Q26. Find customers whose 'Delivered'-only total exceeds
--      their 'Cancelled'-only total by more than ₹20,000, and
--      classify the size of that gap:
--      > 40,000  -> 'Strong Net Customer'
--      Otherwise -> 'Moderate Net Customer'
SELECT customer_name AS 'Customer Name', 
CASE 
	WHEN SUM(CASE WHEN status = 'Delivered' THEN amount ELSE 0 END) - SUM(CASE WHEN status = 'Cancelled' THEN amount ELSE 0 END) > 40000 THEN 'Strong Net Customer'
    ELSE 'Moderate Net Customer'
END AS 'Pay Gap'
FROM order_summary
GROUP BY customer_name
HAVING SUM(CASE WHEN status = 'Delivered' THEN amount ELSE 0 END) - SUM(CASE WHEN status = 'Cancelled' THEN amount ELSE 0 END) > 20000;

-- Q27. Find each customer's order count and cancellation rate
--      (cancelled orders ÷ total orders × 100), showing only
--      customers with more than 1 order, and classify:
--      0%        -> 'Fully Reliable'
--      <= 50%    -> 'Mostly Reliable'
--      Otherwise -> 'Unreliable'
SELECT customer_name AS 'Customer Name', COUNT(*) AS 'Total Orders',
CASE
	WHEN (SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END)/COUNT(*))*100 = 0 THEN 'Fully Reliable'
    WHEN (SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END)/COUNT(*))*100 <= 50 THEN 'Mostly Reliable'
    ELSE 'Unreliable'
END AS 'Cancellation Rate'
FROM order_summary
GROUP BY customer_name
HAVING COUNT(*) > 1;

-- Q28. Find categories having more than 2 orders where the
--      average amount of 'Delivered' orders ONLY (ignore
--      cancelled orders when computing the average) is greater
--      than 15,000, and classify:
--      >= 30,000 -> 'Elite Category'
--      Otherwise -> 'Standard Category'
SELECT category AS 'Category',
CASE 
	WHEN AVG(CASE WHEN status = 'Delivered' THEN amount END) >= 30000 THEN 'Elite'
    ELSE 'Standard'
END AS 'Class'
FROM order_summary
GROUP BY category
HAVING COUNT(*) > 2 AND AVG(CASE WHEN status = 'Delivered' THEN amount END) > 15000;

-- Q29. Find customers whose highest single order amount is
--      more than 3 times their lowest single order amount, and
--      label them 'Highly Inconsistent Spender'.
SELECT customer_name AS 'Customer Name', 'Highly Inconsistent Spender' AS Label FROM order_summary
GROUP BY customer_name
HAVING MAX(amount) > 3 * MIN(amount);

-- Q30. Find each category's percentage contribution to the
--      company's total revenue across ALL orders (category
--      total ÷ overall total × 100). Show only categories
--      contributing more than 15%, and classify:
--      >= 40%    -> 'Major Revenue Driver'
--      Otherwise -> 'Moderate Revenue Driver'
--      (Hint: you need the grand total from a subquery — it
--      does not change per group, so it cannot come from the
--      same GROUP BY.)
SELECT category AS 'Category', SUM(amount) AS 'Total Amount', ROUND(SUM(amount)/(SELECT SUM(amount) FROM order_summary), 2) * 100  AS 'Contribution',
CASE
	WHEN SUM(amount)/(SELECT SUM(amount) FROM order_summary) * 100 >= 40 THEN 'Major Revenue Driver'
    ELSE 'Moderate Revenue Driver'
END AS 'Type'
FROM order_summary
GROUP BY category
HAVING SUM(amount)/(SELECT SUM(amount) FROM order_summary) * 100 > 15;




