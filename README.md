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

This section demonstrates practical SQL querying skills:

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

## 📊 Aggregation Functions

Implemented SQL aggregation techniques for data analysis:

- COUNT() – total records
- SUM() – total balance
- AVG() – average values
- MIN() / MAX() – range analysis
- GROUP BY – grouped insights

---

## 🧩 NULL Handling & Conditional Filtering

This section demonstrates handling missing values and applying conditional logic in SQL queries.

### ✔ NULL Handling

- `ISNULL()` – replaces NULL values with a default value  
- `NULLIF()` – returns NULL if two expressions are equal  

```sql
SELECT Name, ISNULL(Unclearbalance, 0) AS SafeBalance
FROM Account_master;

SELECT Name, NULLIF(Clearbalance, Unclearbalance) AS BalanceCheck
FROM Account_master;

**## 🧠 Conditional Logic & Subqueries

This section demonstrates applying decision-making logic and nested queries for advanced data retrieval.

---

### ✔ CASE Statement (Conditional Logic)

Used to categorize data based on conditions.

```sql
SELECT Name, Clearbalance,
    CASE
        WHEN Clearbalance < 5000 THEN 'Silver'
        WHEN Clearbalance BETWEEN 5000 AND 10000 THEN 'Gold'
        WHEN Clearbalance BETWEEN 10000 AND 15000 THEN 'Diamond'
        ELSE 'Platinum'
    END AS CustomerType
FROM Account_master;**

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

<img width="1015" height="827" alt="image" src="https://github.com/user-attachments/assets/39895c16-0559-4417-bbff-174ec28d65ef" />
