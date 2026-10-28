# 🚀 Data Engineering Bootcamp — SQL & Python

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![SQL](https://img.shields.io/badge/Language-SQL%20(DDL%20%7C%20DML%20%7C%20DQL)-F80000?style=for-the-badge&logo=sqlite&logoColor=white)](https://en.wikipedia.org/wiki/SQL)
[![Data Engineering](https://img.shields.io/badge/Domain-Data%20Engineering-007ACC?style=for-the-badge&logo=apache&logoColor=white)](#)
[![Status](https://img.shields.io/badge/Progress-Active%20Learning-2ea44f?style=for-the-badge)](#)
[![Maintained by](https://img.shields.io/badge/Author-Wasim%20Akthar-blueviolet?style=for-the-badge)](https://github.com/wasim-akthar)

A structured, hands-on repository documenting my journey through the **Data Engineering Bootcamp**, featuring intensive practical coursework in **Relational Database Management Systems (RDBMS)**, advanced SQL query optimization, database schema modeling, and core **Python programming foundations** tailored for data pipelines and analytics.

---

## 📌 Repository Overview

This repository serves as a centralized portfolio of daily coursework, class notes, speed drills, timed assessments, and capstone mini-projects completed during the bootcamp. The codebase showcases progressive mastery across:
1. **Relational Database Engineering (MySQL)**: From relational mechanics to advanced modern SQL paradigms including Window Functions, CTEs, Database Views, Correlated Subqueries, and complex schema design.
2. **Core Python for Data Engineering**: Foundational programming, memory management, dynamic typing, built-in data types, input/output operations, and comprehensive operator mechanics with an emphasis on interview preparation and data pipeline readiness.

### 🌟 Key Highlights

- **500+ Practice & Assessment Problems**: Solved query exercises ranging from foundational filtering to advanced analytical queries and interview-level problem sets.
- **Two 100-Question Capstone Mini-Projects**:
  - **Mini Project 1**: End-to-end relational schema, constraints, multi-table joins, reporting, and data lifecycle management for a College Student Marks System.
  - **Mini Project 2 (Subqueries Edition)**: 100 progressive questions partitioned across 4 distinct difficulty tiers (Beginner, Intermediate, Hard, Interview Level).
- **Production-Style SQL Case Studies**: Real-world schema designs and query solutions for **Swiggy** (food delivery), **BookMyShow** (cinema ticketing), **Rapido** (ride-hailing), **Amazon Sales** (e-commerce revenue), and **Myntra** (product catalogs).
- **Modern Analytical SQL**: In-depth implementations of Window Functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`, `NTILE`, `LAG`, `LEAD`), `PARTITION BY`, Common Table Expressions (`WITH`), and Database Views.
- **Python Foundations & Interview Notes**: Detailed class notes covering variables, memory pointer references, mutability vs. immutability, type casting, operator precedence, short-circuit evaluation, and time-complexity trade-offs (e.g., $O(1)$ set lookups vs. $O(n)$ list scans).

---

## 📂 Repository Structure

```plaintext
data-engineering-bootcamp/
├── README.md
├── Python Files/                    # Core Python programming & pipeline scripts
│   ├── Class Assignments/           # Daily graded assignments & coding tasks
│   ├── Class Tests/                 # Timed programming assessments & quizzes
│   ├── Notes/                       # Daily lecture notes, syntax primers & deep-dives
│   │   ├── Class Notes - 26-10-26 - Basics.py      # Python basics, syntax, print() & comments
│   │   ├── Class Notes - 27-10-26 - Variables.py   # Variables, Data Types, I/O & Interview Tips
│   │   ├── Class Notes - 28-10-26 - Operators.py   # Arithmetic, Comparison, Logical, Bitwise, etc.
│   │   └── test.py                                 # Interactive practice script for all operators
│   ├── Practice Tests/              # Speed drills & self-assessment challenges
│   └── Self Practice Assignments/   # Intensive coding challenges & algorithm drills
│
└── SQL Files/
    ├── Class Assignments/           # Daily graded assignments & real-world scenario sets
    │   ├── DOCX files/              # Written assignment documentation & output reports
    │   │   ├── SQL Assignment 23-09-26 Wasim Akthar.docx
    │   │   ├── SQL Assignment 20-10-26 - Wasim Akthar.docx
    │   │   └── ... (full submission docs)
    │   ├── SQL Assignment 23-09-26 - Wasim Akthar.sql  # Student Management System (DDL, DML, DQL)
    │   ├── SQL Assignment 24-09-26 - Wasim Akthar.sql  # Employee Details & Arithmetic Calculations
    │   ├── SQL Assignment 29-09-26 - Wasim Akthar.sql  # Employee (emp) Table & Self-Joins (30 Qs)
    │   ├── SQL Assignment 30-09-26 - Wasim Akthar.sql  # Advanced Filtering (WHERE/AND/OR/IN/BETWEEN)
    │   ├── SQL Assignment 01-10-26 - Wasim Akthar.sql  # Sorting, Ranking & Pagination (50 Qs)
    │   ├── SQL Assignment 06-10-26 - Wasim Akthar.sql  # Employee Aggregations & Grouping (30 Qs)
    │   ├── SQL Assignment 07-10-26 - Wasim Akthar.sql  # Orders Table & CASE Expressions (30 Qs)
    │   ├── SQL Assignment 08-10-26 - Wasim Akthar.sql  # Multi-Table JOINS (Emp, Dept, Projects)
    │   ├── SQL Assignment 09-10-26 - Wasim Akthar.sql  # E-Commerce Application & Constraints (30 Qs)
    │   ├── SQL Assignment 12-10-26 - Wasim Akthar.sql  # Mini-Project 1: Student Marks System (100 Qs)
    │   ├── SQL Assignment 15-10-26 - Wasim Akthar.sql  # Customers & Orders (Joins & Subqueries)
    │   └── SQL Assignment 20-10-26 - Wasim Akthar.sql  # Student Details: Subqueries & Window Functions
    │
    ├── Class Tests/                 # Timed assessments & evaluations under exam conditions
    │   ├── Class Test 15-10-26.sql  # Assessment on Joins, Aggregations & Subqueries
    │   ├── Class Test 20-10-26.sql  # Assessment on Subqueries & Window Functions
    │   └── Class Test 23-10-26.sql  # Comprehensive 30-Question SQL Test (Joins, CTEs, Views, Windows)
    │
    ├── Notes/                       # Daily lecture notes, syntax primers & schema walkthroughs
    │   ├── Basic Commands.sql       # Table creation & initial DDL/DML
    │   ├── Basic Commands - 2.sql   # Data insertion & query fundamentals
    │   ├── Basic Lessons.sql        # Data types & baseline constraints
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
    │   ├── Class Notes 14-10-26.sql # Myntra DB: Single & multi-row subqueries
    │   ├── Class Notes 16-10-26 - Window Functions.sql # Amazon Sales: Window Functions & Partitions
    │   ├── Class Notes 21-10-26 - CTE, Views.sql       # Rapido DB: CTEs (`WITH`) vs. Database Views
    │   └── Class Notes 22-10-26 - DATE TIME.sql        # Temporal & Date/Time operations
    │
    ├── Practice Tests/              # Speed drills & self-assessment challenges
    │   ├── Practice Assignment Wasim Akthar - 06-10.26.sql # 30-Question Employee Table Speed Drill
    │   ├── Practice Test Wasim Akthar - 06-10-26.sql       # Assessment Test on emp Table
    │   └── Practice Test Wasim Akthar - 14-10-26.sql       # Students DB Correlated Subquery Challenge
    │
    └── Self Practice Assignments/   # Intensive marathon problem sets
        ├── Practice Assignment Wasim Akthar - Pt 1.sql     # 100-Question Comprehensive SQL Drill
        └── Practice Assignment Wasim Akthar - Pt 2.sql     # Mini-Project 2: 100 Qs across 4 Levels (with Subqueries)
```

---

## 🐍 Python Curriculum & Engineering Progression

```mermaid
flowchart TD
    P1["Python Basics & Syntax<br/>(print, comments, escape sequences)"] --> P2["Variables & Memory References<br/>(Dynamic Typing, Naming Rules, Pointer References)"]
    P2 --> P3["Data Types & Mutability<br/>(int, float, str, bool, list, tuple, set, dict, None)"]
    P3 --> P4["Standard Input & Output<br/>(print parameters, f-strings, input type casting)"]
    P4 --> P5["Operator Mechanics & Precedence<br/>(Arithmetic, Relational, Logical, Assignment, Bitwise, Membership, Identity)"]
    P5 --> P6["Data Pipeline Structures & OOP<br/>(Control Flow, Functions, Lambdas, Classes, Error Handling - Next Up)"]
```

### Python Module Breakdown

| Module / Topic | Core Concepts Covered | Key Implementation Files |
| :--- | :--- | :--- |
| **1. Basics & Output** | `print()` syntax, string literals, newline `\n` escapes, basic expressions. | `Class Notes - 26-10-26 - Basics.py` |
| **2. Variables & Dynamic Typing** | Variable assignment (`var = val`), reference pointers, dynamic typing at runtime, PEP 8 naming conventions, multiple assignment, and in-place variable swapping (`a, b = b, a`). | `Class Notes - 27-10-26 - Variables.py` |
| **3. Data Types & Mutability** | Built-in primitives (`int`, `float`, `str`, `bool`, `NoneType`) vs collections (`list`, `tuple`, `set`, `dict`); mutable vs immutable types; hashing & dictionary key constraints; falsy values. | `Class Notes - 27-10-26 - Variables.py` |
| **4. Input & Formatting** | `input()` string default behavior, type conversion (`int()`, `float()`), `sep` and `end` parameters in `print()`, string concatenation with `str()`, and modern formatted strings (f-strings). | `Class Notes - 27-10-26 - Variables.py` |
| **5. Python Operators** | Comprehensive coverage of **Arithmetic** (`/` vs `//`, `%`), **Comparison** (chaining `10 < n < 20`), **Logical** (short-circuiting `and`, `or`, `not`), **Assignment** (`+=`, `-=`, etc.), **Membership** (`in`, `not in`), **Identity** (`is`, `is not`), **Bitwise** (`&`, `\|`, `^`, `~`, `<<`, `>>`), and **Precedence**. | `Class Notes - 28-10-26 - Operators.py`, `test.py` |

---

## 🗺️ SQL Curriculum & Learning Progression

```mermaid
flowchart TD
    A["Phase 1: DDL & DML Fundamentals<br/>(Databases, Tables, Constraints, Data Types)"] --> B["Phase 2: DQL, Filtering & Sorting<br/>(SELECT, Aliasing, Arithmetic, WHERE, LIKE, ORDER BY, LIMIT)"]
    B --> C["Phase 3: Aggregations & Grouping<br/>(COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING)"]
    C --> D["Phase 4: Conditional Logic & Constraints<br/>(CASE WHEN, PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE)"]
    D --> E["Phase 5: Relational Joins & Set Operations<br/>(INNER, LEFT, RIGHT, Self-Joins, Orphan Detection, UNION)"]
    E --> F["Phase 6: Subqueries & Correlated Subqueries<br/>(Single-row, Multi-row IN/ANY/ALL, Correlated EXISTS/NOT EXISTS)"]
    F --> G["Phase 7: Window Functions & Analytical Partitioning<br/>(ROW_NUMBER, RANK, DENSE_RANK, NTILE, LAG, LEAD, OVER)"]
    G --> H["Phase 8: Modular Queries with CTEs & Views<br/>(Common Table Expressions 'WITH', Persistent & Dynamic Views)"]
    H --> I["Phase 9: End-to-End Capstone Mini-Projects<br/>(Mini Project 1 & 2 — 200 Questions, 4 Progressive Levels)"]
```

### SQL Module Breakdown

| Module / Topic | Core Concepts Covered | Key Implementation Files |
| :--- | :--- | :--- |
| **1. Database & Table Foundations** | `CREATE DATABASE`, `USE`, `CREATE TABLE`, `DESC`, `INSERT INTO`, data types (`INT`, `VARCHAR`, `DECIMAL`, `DATE`). | `Employees DB.sql`, `Basic Commands.sql` |
| **2. DQL, Aliases & Arithmetic** | `SELECT`, column aliases (`AS`), arithmetic computations (`+`, `-`, `*`, `/`), `ROUND()`, bonus & tax logic. | `Basic SELECT and Arithmetic Exercises.sql`, `SQL Assignment 24-09-26` |
| **3. Filtering, Matching & Pagination** | `WHERE`, logical operators (`AND`, `OR`, `NOT`), `IN`, `BETWEEN`, `LIKE`, `IS NULL`, `ORDER BY`, `LIMIT`, `OFFSET`, Top-N / Nth highest records. | `SQL Assignment 30-09-26`, `SQL Assignment 01-10-26` (50 Qs) |
| **4. Aggregations & Grouping** | `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`, `GROUP BY`, `HAVING` clause vs. `WHERE` clause. | `Filter and Aggregations.sql`, `SQL Assignment 06-10-26` |
| **5. Conditional Logic & Data Integrity** | `CASE WHEN ... THEN ... ELSE END`, conditional bucketing, integrity constraints (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`). | `Class Notes 08-10-26.sql`, `SQL Assignment 07-10-26`, `SQL Assignment 09-10-26` |
| **6. Relational Joins & Set Operations** | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, self-joins (hierarchical employee-manager models), detecting orphaned records (`IS NULL`), `UNION` & `UNION ALL`. | `Class Notes 12-10-26.sql`, `SQL Assignment 08-10-26` |
| **7. Subqueries & Correlated Queries** | Single-row scalar subqueries, multi-row subqueries (`IN`, `ANY`, `ALL`), correlated subqueries (`EXISTS`, `NOT EXISTS`). | `Class Notes 13-10-26.sql`, `Class Notes 14-10-26.sql`, `Practice Test 14-10-26.sql` |
| **8. Window Functions & Ranking** | `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `NTILE()`, `LAG()`, `LEAD()`, `FIRST_VALUE()`, `LAST_VALUE()`, `NTH_VALUE()`, `OVER (PARTITION BY ... ORDER BY ...)`. | `Class Notes 16-10-26 - Window Functions.sql`, `SQL Assignment 20-10-26` |
| **9. CTEs & Virtual Views** | Common Table Expressions (`WITH cte AS (...)`), modular multi-step querying, `CREATE OR REPLACE VIEW`, view query optimization. | `Class Notes 21-10-26 - CTE, Views.sql`, `Class Test 23-10-26.sql` |
| **10. Capstone Mini-Projects & Tests** | 200 questions across two end-to-end Mini-Projects, plus comprehensive timed tests covering all advanced topics. | `SQL Assignment 12-10-26`, `Practice Assignment Pt 2.sql`, `Class Test 23-10-26` |

---

## 🏆 Featured Projects & Real-World Case Studies

### 🎓 1. College Student Marks Management System (Mini-Project 1 & 2)
- **Files**:
  - Mini-Project 1: `SQL Files/Class Assignments/SQL Assignment 12-10-26 - Wasim Akthar.sql` (100 Questions)
  - Mini-Project 2: `SQL Files/Self Practice Assignments/Practice Assignment Wasim Akthar - Pt 2.sql` (100 Questions across 4 Levels)
- **Scope**: **200 Curated Problems**
- **Schema**:
  - `students`: `student_id`, `student_name`, `department`, `city`, `age`, `email`
  - `marks`: `mark_id`, `student_id` (FK), `python_marks`, `sql_marks`, `aptitude_marks`
- **Difficulty Tiers (Mini-Project 2)**:
  - **Level 1 (Beginner — Q1 to Q25)**: DDL constraints, arithmetic expressions, aggregate totals, and basic filters.
  - **Level 2 (Intermediate — Q26 to Q50)**: `GROUP BY`, `HAVING`, `CASE` conditional aggregations, and multi-table joins.
  - **Level 3 (Hard — Q51 to Q75)**: Single-row & multi-row subqueries, top performers per department, and reversible DML manipulations.
  - **Level 4 (Interview Level — Q76 to Q100)**: Correlated subqueries (`EXISTS`/`NOT EXISTS`), percentile benchmarks, schema refactoring (`ALTER`/`RENAME`), and cascaded deletes.

### 🚖 2. Rapido Ride-Hailing Analytics (CTEs vs. Views)
- **File**: `SQL Files/Notes/Class Notes 21-10-26 - CTE, Views.sql`
- **Focus**:
  - Multi-city driver fleet performance analysis (`drivers` table across Mumbai, Delhi, Bengaluru, Chennai, etc.).
  - Demonstrating temporary query modularization using **CTEs** (`WITH chennai_drivers AS (...)`) versus persistent abstraction layers using **Views** (`CREATE VIEW`).
  - Benchmarking readability, maintainability, and reusability across data processing pipelines.

### 📦 3. Amazon Sales & Revenue Analytics (Window Functions)
- **File**: `SQL Files/Notes/Class Notes 16-10-26 - Window Functions.sql`
- **Focus**:
  - Product sales transactions across electronics and books categories.
  - Category-level sales partitioning (`PARTITION BY category`).
  - Comparative ranking behavior analysis (`ROW_NUMBER()` vs. `RANK()` vs. `DENSE_RANK()`).
  - Positional value retrieval using `FIRST_VALUE()`, `LAST_VALUE()`, and `NTILE(n)`.

### 🍕 4. Swiggy Food Delivery & Order Analytics
- **Files**: `SQL Files/Notes/Filter and Aggregations.sql`, `SQL Files/Notes/Class Notes 07-10-26.sql`
- **Focus**:
  - Aggregating order volumes by customer, city, and restaurant.
  - Spend distribution across customer segments.
  - Identifying top-grossing restaurants using grouped filtering (`HAVING`).

### 🎬 5. BookMyShow Cinema Ticketing System
- **File**: `SQL Files/Notes/BookMyShowDB.sql`
- **Focus**:
  - Relational schema modeling for multiplex ticket booking.
  - Entity relationships using auto-increment primary keys, foreign constraints, and showtime metadata.

### 🛍️ 6. E-Commerce Order Management (Online Shopping & Myntra)
- **Files**: `SQL Files/Class Assignments/SQL Assignment 09-10-26 - Wasim Akthar.sql`, `SQL Files/Notes/Class Notes 14-10-26.sql`
- **Focus**:
  - Strict schema integrity (`CHECK price > 0`, `UNIQUE email`, `NOT NULL`).
  - Correlated subqueries to find customers who placed above-average orders or purchased in specific product categories.

---

## 📝 Timed Class Tests & Evaluations

| Test Script | Date | Topics Evaluated | Format |
| :--- | :--- | :--- | :--- |
| `Class Test 15-10-26.sql` | 15-Oct-2026 | Multi-table JOINS (`INNER`, `LEFT`, `RIGHT`), orphaned record detection (`IS NULL`), aggregate spending, and correlated subqueries (`EXISTS`, `NOT EXISTS`, `AVG`, `MAX`, `ANY`). | Timed Hands-on |
| `Class Test 20-10-26.sql` | 20-Oct-2026 | Subquery scenarios (above-average fee extraction, 2nd & 3rd highest distinct fees without `LIMIT`) and Window Functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`, `LEAD`, `NTILE`). | Timed Hands-on |
| `Class Test 23-10-26.sql` | 23-Oct-2026 | Comprehensive 30-Question Assessment: Part 1 Beginner (Q1–Q10) covering Aggregates, `GROUP BY`, `HAVING`; Part 2 Intermediate (Q11–Q30) covering Joins, Subqueries, Views, Window Functions, and CTEs. | 30-Question Structured Exam |

---

## 🛠️ Getting Started & Execution

### Prerequisites
- **Python**: [Python 3.10+](https://www.python.org/)
- **Database**: [MySQL Server](https://dev.mysql.com/downloads/mysql/) (v8.0 or newer recommended for CTEs and Window Functions)
- **Tools / IDEs**: VS Code, [MySQL Workbench](https://www.mysql.com/products/workbench/) or [DBeaver](https://dbeaver.io/).

### Running Python Scripts

```bash
# Execute any notes or test scripts
python "Python Files/Notes/Class Notes - 27-10-26 - Variables.py"
python "Python Files/Notes/Class Notes - 28-10-26 - Operators.py"
python "Python Files/Notes/test.py"
```

### Running SQL Scripts

1. **Via MySQL CLI**:
   ```bash
   mysql -u <username> -p < "SQL Files/Class Assignments/SQL Assignment 12-10-26 - Wasim Akthar.sql"
   ```

2. **Via MySQL Workbench / DBeaver**:
   - Open any `.sql` file in the IDE.
   - Execute the setup statements (`CREATE DATABASE`, `USE`, `CREATE TABLE`, `INSERT`).
   - Run the analytical query sections to verify outputs.

---

## 📈 Roadmap & Progress Tracker

This repository is continuously maintained as the bootcamp progresses:

- [x] **Module 1**: Relational Databases & Advanced SQL Mastery (MySQL)
  - [x] DDL, DML, DQL Foundations & Constraints
  - [x] Multi-Table Relational Joins & Set Operations
  - [x] Scalar, Multi-Row & Correlated Subqueries
  - [x] Window Functions & Analytical Ranking
  - [x] Common Table Expressions (CTEs) & Database Views
  - [x] Capstone Mini-Projects & Timed Evaluations
- [x] **Module 2**: Python for Data Engineering (In Progress)
  - [x] Python Basics, Syntax, and Dynamic Typing
  - [x] Built-in Primitive & Collection Data Types (Mutability vs. Immutability)
  - [x] Standard Input, Output, and String Formatting (f-strings)
  - [x] Comprehensive Operator Mechanics (Arithmetic, Comparison, Logical, Assignment, Membership, Identity, Bitwise)
  - [ ] Control Flow, Iterations & Comprehensions
  - [ ] Functions, Generators & Error Handling
  - [ ] Object-Oriented Programming (OOP)
  - [ ] Data Wrangling with Pandas & Polars
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
*Contributions, suggestions, and feedback are welcome! ⭐ Star this repo if you find the SQL and Python materials helpful.*
