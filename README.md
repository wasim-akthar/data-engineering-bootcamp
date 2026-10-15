# 🚀 Data Engineering Bootcamp — SQL & Database Systems

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![SQL](https://img.shields.io/badge/Language-SQL%20(DDL%20%7C%20DML%20%7C%20DQL)-F80000?style=for-the-badge&logo=sqlite&logoColor=white)](https://en.wikipedia.org/wiki/SQL)
[![Data Engineering](https://img.shields.io/badge/Domain-Data%20Engineering-007ACC?style=for-the-badge&logo=apache&logoColor=white)](#)
[![Status](https://img.shields.io/badge/Progress-Active%20Learning-2ea44f?style=for-the-badge)](#)
[![Maintained by](https://img.shields.io/badge/Author-Wasim%20Akthar-blueviolet?style=for-the-badge)](https://github.com/wasim-akthar)

A structured, hands-on repository documenting my journey through the **Data Engineering Bootcamp**, with a current deep-dive into **Relational Database Management Systems (RDBMS)**, advanced SQL query design, database schema modeling, and analytical problem-solving using **MySQL**.

---

## 📌 Repository Overview

This repository contains all coursework, daily class notes, self-practice challenges, timed class assessments, and end-to-end mini-projects completed during the bootcamp. The codebase showcases progressive mastery from core relational foundations to complex analytical querying, subqueries, and real-world database design.

### 🌟 Key Highlights

- **300+ Practice & Assessment Problems**: Solved query exercises ranging from foundational filtering to advanced multi-table analytics.
- **Production-Style Case Studies**: Real-world schema designs and query solutions for **Swiggy**, **BookMyShow**, **Myntra**, and corporate employee hierarchies.
- **Capstone Mini-Project**: A 100-question end-to-end relational implementation of a **College Student Marks Management System** covering schema constraints, conditional reporting, multi-table joins, and DML operations.
- **Dual Documentation**: SQL implementation scripts paired with structured Microsoft Word (`.docx`) submission reports.

---

## 📂 Repository Structure

```plaintext
data-engineering-bootcamp/
├── README.md
└── SQL Files/
    ├── Class Assignments/           # Daily graded assignments & real-world scenario sets
    │   ├── DOCX files/              # Written assignment documentation & output reports
    │   │   ├── SQL Assignment 23-09-26 Wasim Akthar.docx
    │   │   └── ... (submission docs)
    │   ├── SQL Assignment 23-09-26 - Wasim Akthar.sql  # Student Management System
    │   ├── SQL Assignment 24-09-26 - Wasim Akthar.sql  # Employee Details & Arithmetic
    │   ├── SQL Assignment 29-09-26 - Wasim Akthar.sql  # Employee (emp) Table (30 Qs)
    │   ├── SQL Assignment 30-09-26 - Wasim Akthar.sql  # Advanced Filtering (WHERE/AND/OR/IN)
    │   ├── SQL Assignment 01-10-26 - Wasim Akthar.sql  # Sorting, Ranking & Pagination (50 Qs)
    │   ├── SQL Assignment 06-10-26 - Wasim Akthar.sql  # Employee Aggregations & Grouping (30 Qs)
    │   ├── SQL Assignment 07-10-26 - Wasim Akthar.sql  # Orders & CASE Expressions (30 Qs)
    │   ├── SQL Assignment 08-10-26 - Wasim Akthar.sql  # Multi-Table JOINS (Emp/Dept/Projects)
    │   ├── SQL Assignment 09-10-26 - Wasim Akthar.sql  # E-Commerce Application & Constraints (30 Qs)
    │   ├── SQL Assignment 12-10-26 - Wasim Akthar.sql  # Mini-Project: Student Marks System (100 Qs)
    │   └── SQL Assignment 15-10-26 - Wasim Akthar.sql  # Customers & Orders (Joins & Subqueries)
    │
    ├── Class Tests/                 # Timed assessments & evaluations
    │   └── Class Test 15-10-26.sql  # Assessment on Joins, Aggregations & Subqueries
    │
    ├── Notes/                       # Daily lecture notes, syntax primers & schema walkthroughs
    │   ├── Basic Commands.sql       # Table creation & initial DDL/DML
    │   ├── Distinct and Alias.sql   # DISTINCT keyword and column aliasing
    │   ├── Basic SELECT and Arithmetic Exercises.sql # Calculations & bonuses
    │   ├── Employees DB.sql         # Base Employee schema & verification
    │   ├── BookMyShowDB.sql         # Movie ticketing database modeling
    │   ├── Filter and Aggregations.sql # Swiggy DB order aggregations
    │   ├── Class Notes 30-09-26.sql # Compound filtering operators
    │   ├── Class Notes 05-10-26.sql # ORDER BY, LIMIT, OFFSET, Top-N
    │   ├── Class Notes 07-10-26.sql # Swiggy DB grouped aggregations
    │   ├── Class Notes 08-10-26.sql # HAVING clause & CASE expressions
    │   ├── Class Notes 09-10-26.sql # Integrity Constraints (PK, FK, UNIQUE, CHECK, DEFAULT)
    │   ├── Class Notes 12-10-26.sql # Relational Joins & Unmatched records
    │   ├── Class Notes 13-10-26.sql # Subquery mechanics & Foreign Key structures
    │   └── Class Notes 14-10-26.sql # Myntra DB: Single & multi-row subqueries
    │
    ├── Practice Tests/              # Speed drills & self-assessment challenges
    │   ├── Practice Assignment Wasim Akthar - 06-10.26.sql
    │   └── Practice Test Wasim Akthar - 06-10-26.sql
    │
    └── Self Practice Assignments/   # Intensive marathon problem sets
        └── Practice Assignment Wasim Akthar - Pt 1.sql # 100-Question Comprehensive SQL Drill
```

---

## 🗺️ SQL Curriculum & Learning Progression

```mermaid
flowchart LR
    A["Phase 1:<br/>DDL & DML Basics"] --> B["Phase 2:<br/>DQL, Filters & Sorting"]
    B --> C["Phase 3:<br/>Aggregations & GROUP BY"]
    C --> D["Phase 4:<br/>CASE Logic & Constraints"]
    D --> E["Phase 5:<br/>Relational Joins"]
    E --> F["Phase 6:<br/>Subqueries & Correlated Queries"]
    F --> G["Phase 7:<br/>End-to-End Mini Projects"]
```

### Module Breakdown

| Module / Topic | Core Concepts Covered | Key Files |
| :--- | :--- | :--- |
| **1. Database & Table Foundations** | `CREATE DATABASE`, `USE`, `CREATE TABLE`, `DESC`, `INSERT INTO`, data types (`INT`, `VARCHAR`, `DECIMAL`, `DATE`). | `Employees DB.sql`, `Basic Commands.sql` |
| **2. DQL, Aliases & Arithmetic** | `SELECT`, column aliases (`AS`), arithmetic computations (`+`, `-`, `*`, `/`), `ROUND()`, bonus & tax logic. | `Basic SELECT and Arithmetic Exercises.sql`, `SQL Assignment 24-09-26` |
| **3. Filtering, Matching & Pagination** | `WHERE`, logical operators (`AND`, `OR`, `NOT`), `IN`, `BETWEEN`, `LIKE`, `IS NULL`, `ORDER BY`, `LIMIT`, `OFFSET`, Top-N / Nth highest records. | `SQL Assignment 30-09-26`, `SQL Assignment 01-10-26` (50 Qs) |
| **4. Aggregations & Grouping** | `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`, `GROUP BY`, `HAVING` clause vs. `WHERE` clause. | `Filter and Aggregations.sql`, `SQL Assignment 06-10-26` |
| **5. Conditional Logic & Data Integrity** | `CASE WHEN ... THEN ... ELSE END`, conditional bucketing, integrity constraints (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`). | `Class Notes 08-10-26.sql`, `SQL Assignment 07-10-26`, `SQL Assignment 09-10-26` |
| **6. Relational Joins & Set Operations** | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, self-joins (hierarchical employee-manager models), detecting orphaned records (`IS NULL`), `UNION` & `UNION ALL`. | `Class Notes 12-10-26.sql`, `SQL Assignment 08-10-26` |
| **7. Subqueries & Nested Queries** | Single-row scalar subqueries, multi-row subqueries (`IN`, `ANY`, `ALL`), correlated subqueries (`EXISTS`, `NOT EXISTS`). | `Class Notes 13-10-26.sql`, `Class Notes 14-10-26.sql`, `Class Test 15-10-26.sql` |
| **8. Capstone Mini-Project** | 100-question comprehensive relational schema, reporting, academic performance analysis, and data mutations. | `SQL Assignment 12-10-26 - Wasim Akthar.sql` |

---

## 🏆 Featured Projects & Real-World Case Studies

### 🎓 1. College Student Marks Management System (Mini-Project)
- **File**: `SQL Files/Class Assignments/SQL Assignment 12-10-26 - Wasim Akthar.sql`
- **Scope**: **100 Comprehensive Questions**
- **Schema**:
  - `students`: `student_id`, `student_name`, `department`, `city`, `age`, `email`
  - `marks`: `mark_id`, `student_id` (FK), `python_marks`, `sql_marks`, `aptitude_marks`
- **Focus Areas**:
  - Multi-subject total, percentage, and grade tier classification via `CASE`.
  - Department-wise topper extraction using subqueries and window concepts.
  - Multi-table `LEFT JOIN` and `RIGHT JOIN` to surface students without mark entries.
  - Data lifecycle manipulation: `ALTER TABLE`, column renames, safe cascading updates, and record deletions.

### 🍕 2. Swiggy Food Delivery & Order Analytics
- **Files**: `SQL Files/Notes/Filter and Aggregations.sql`, `SQL Files/Notes/Class Notes 07-10-26.sql`
- **Focus**:
  - Aggregating order volumes by customer, city, and restaurant.
  - Spend distribution across customer segments.
  - Identifying top-grossing restaurants using grouped filtering (`HAVING`).

### 🎬 3. BookMyShow Cinema Ticketing System
- **File**: `SQL Files/Notes/BookMyShowDB.sql`
- **Focus**:
  - Relational schema modeling for multiplex ticket booking.
  - Entity relationships using auto-increment primary keys, foreign constraints, and showtime metadata.

### 🛍️ 4. E-Commerce Order Management (Online Shopping & Myntra)
- **Files**: `SQL Files/Class Assignments/SQL Assignment 09-10-26 - Wasim Akthar.sql`, `SQL Files/Notes/Class Notes 14-10-26.sql`
- **Focus**:
  - Strict schema integrity (`CHECK price > 0`, `UNIQUE email`, `NOT NULL`).
  - Correlated subqueries to find customers who placed above-average orders or purchased in specific product categories.

---

## 🛠️ Getting Started & Execution

### Prerequisites
- [MySQL Server](https://dev.mysql.com/downloads/mysql/) (v8.0 or newer recommended)
- A GUI client such as [MySQL Workbench](https://www.mysql.com/products/workbench/) or [DBeaver](https://dbeaver.io/), or the MySQL command-line client (`mysql`).

### Quick Setup

1. **Clone the repository**:
   ```bash
   git clone git@github.com:wasim-akthar/data-engineering-bootcamp.git
   cd data-engineering-bootcamp
   ```

2. **Run a script via MySQL CLI**:
   ```bash
   mysql -u <username> -p < "SQL Files/Class Assignments/SQL Assignment 12-10-26 - Wasim Akthar.sql"
   ```

3. **Or open in MySQL Workbench / DBeaver**:
   - Open any `.sql` file in the IDE.
   - Execute the setup statements (`CREATE DATABASE`, `USE`, `CREATE TABLE`, `INSERT`).
   - Run the analytical query sections to verify outputs.

> [!TIP]
> In files like `SQL Assignment 12-10-26 - Wasim Akthar.sql` and `Practice Assignment Wasim Akthar - Pt 1.sql`, questions are numbered sequentially. Run setup sections first before testing subsequent DML/DDL queries.

---

## 📈 Roadmap & Upcoming Modules

This repository is continuously maintained as the bootcamp progresses:

- [x] **Module 1**: Relational Databases & SQL Mastery (MySQL)
- [ ] **Module 2**: Python for Data Engineering (Data Structures, OOP, Pandas, Polars)
- [ ] **Module 3**: Data Modeling & Dimensional Warehousing (Star/Snowflake Schema, SCDs)
- [ ] **Module 4**: ETL / ELT Pipeline Development
- [ ] **Module 5**: Distributed Computing with Apache Spark & PySpark
- [ ] **Module 6**: Cloud Data Warehousing (Snowflake / Google BigQuery)
- [ ] **Module 7**: Workflow Orchestration (Apache Airflow / Dagster)

---

## 👤 Author

**Wasim Akthar**
- GitHub: [@wasim-akthar](https://github.com/wasim-akthar)
- Repository: [data-engineering-bootcamp](https://github.com/wasim-akthar/data-engineering-bootcamp)

---
*Contributions, suggestions, and feedback are welcome! ⭐ Star this repo if you find the SQL problem sets helpful.*

