# 📦 iBank SQL Case Study – Database Design & Implementation

## 🧾 Overview
This project demonstrates the design and implementation of a **relational banking database system (iBank)** using **SQL Server**.

The system models core banking operations including:
- Account management
- Transaction processing
- Branch and region hierarchy
- Product mapping
- User activity tracking

This project covers **end-to-end database development**, from schema design to data querying and manipulation.

---

## 🏗️ Database Architecture
The database consists of **6 interconnected tables** with no standalone entities. All tables are linked using primary and foreign key relationships to maintain data integrity.

### 📊 Tables Included
- `Account_master`
- `Branch_master`
- `Region_master`
- `Product_master`
- `Transaction_master`
- `User_master`

---

## 🔗 Relationships & Data Flow
- Regions → Branches → Accounts  
- Accounts → Transactions  
- Products assigned to Accounts  
- Users perform Transactions  

This ensures a **fully normalized relational structure**.

---

## 💾 Data Storage & Management
Implemented SQL operations:
- Table creation (`CREATE TABLE`)
- Data insertion (`INSERT`)
- Table modification (`ALTER`)
- Data deletion (`DELETE`, `TRUNCATE`)
- Constraints:
  - Primary Key
  - Foreign Key
  - CHECK constraints
  - NOT NULL constraints

---

## 🔍 Querying & Data Analysis

### ✔ Data Retrieval
- `SELECT *` (all columns)
- Selecting specific columns
- Filtering rows using `WHERE`

### ✔ Sorting & Filtering
- `ORDER BY` (ASC/DESC)
- `TOP` clause
- `BETWEEN`, `IN`, `LIKE`

### ✔ Data Transformation
- String concatenation
- Column aliasing
- `CAST()` and `CONVERT()` functions

### ✔ Data Modification
- `UPDATE` statements
- Conditional updates

### ✔ Aggregations
- `COUNT()`, `SUM()`, `AVG()`
- `GROUP BY`
- `HAVING`

---

## 📊 Aggregation Functions
Implemented SQL aggregation techniques for data analysis:

- COUNT() – total records  
- SUM() – total balance  
- AVG() – average values  
- MIN() / MAX() – range analysis  
- GROUP BY – grouped insights  

---

## 🧩 NULL Handling & Conditional Filtering

### ✔ NULL Handling
- `ISNULL()` – replaces NULL values with a default value  
- `NULLIF()` – returns NULL if two expressions are equal  

### ✔ Range Filtering
- `BETWEEN` – filters values within a specific range  

---

## 🧠 Conditional Logic & Subqueries

### ✔ CASE Statement
Used to categorize data based on conditions such as customer segmentation.

### ✔ Subqueries
Used to retrieve data based on results of another query (e.g., highest balance accounts).

---

## 🔗 Joins & Multi-Table Analysis

### ✔ INNER JOIN
Used to retrieve matching records from related tables.

### ✔ LEFT JOIN
Returns all records from the left table and matching records from the right table.

### ✔ RIGHT JOIN
Returns all records from the right table and matching records from the left table.

### ✔ FULL JOIN
Returns all records when there is a match in either table.

### ✔ CROSS JOIN
Returns Cartesian product of tables.

### ✔ SELF JOIN
Used to represent hierarchical relationships (e.g., employee-manager structure).

---
### ✔ Advanced Subqueries

- Scalar subqueries for value comparison  
- Nested subqueries (multiple levels)  
- Correlated subqueries (row-level comparison)  
- Using subqueries for ranking problems (Nth highest)  

📌 Use Cases:
- Finding second highest / Nth highest values  
- Comparing values with global or group averages  
- Performing row-wise dynamic filtering  

### ✔ Correlated Subqueries (EXISTS / NOT EXISTS)
- Correlated subqueries execute row-by-row based on the outer query  
- Used for existence checks instead of value comparison  
- `EXISTS` returns TRUE if matching records exist  
- `NOT EXISTS` returns TRUE if no matching records are found

📌 Use Cases:
- Identifying accounts with transactions  
- Finding inactive customers (no transactions)  
- Validating relationships between tables  

### ✔ System Tables & Database Metadata
- Accessing system catalogs using `sys.tables`, `sys.columns`, `sys.databases`  
- Retrieving database structure information programmatically  
- Identifying table and column relationships using metadata joins  
- Using subqueries to dynamically fetch object IDs  

### ✔ Derived Tables (Inline Views)
- Derived tables are subqueries placed in the `FROM` clause  
- Used to create temporary result sets for further querying  
- Must always be assigned an alias  
- Useful for simplifying complex joins and aggregations  

## 📊 SQL Interview Case Study – Customer Analytics
### ✔ Month-wise New Customer Acquisition
- Identify new customers based on their first transaction  
- Calculate number of new customers acquired each month  
- Aggregate results month-wise  

## 🧠 Key Learnings
- Designing normalized relational databases  
- Implementing multi-table relationships  
- Applying constraints for data integrity  
- Writing efficient SQL queries  
- Performing data transformations using built-in functions  
- Handling SQL errors (CHECK, FK violations)  
- Managing data lifecycle (INSERT, UPDATE, DELETE, TRUNCATE)  

---

## 🚀 Future Enhancements
- Indexing for performance optimization  
- Stored procedures for transaction handling  
- Triggers for audit logging  
- Views for reporting and analytics  
- Role-based access control  
- Advanced JOIN queries for multi-table analysis  

---

## 🔚 Conclusion
This project showcases a **real-world banking database system** built using SQL Server, covering both **data storage and querying aspects**. It demonstrates strong fundamentals in relational database design, data integrity, and practical SQL usage.

---

## 📌 ER Diagram

<img width="1015" height="827" alt="image" src="https://github.com/user-attachments/assets/39895c16-0559-4417-bbff-174ec28d65ef" />
