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

### ✔ Advanced Aggregation – CUBE & ROLLUP
- Implemented multidimensional aggregation using `CUBE` and `ROLLUP`  
- Generated summarized reports across multiple grouping combinations  
- Used advanced `GROUP BY` operations for analytical reporting  

## 📈 Window Functions & Analytical SQL
🧠 Concepts Used:
- `ROW_NUMBER()`
- `PARTITION BY`
- `RANK()`
- `DENSE_RANK()`
- `NTILE()`
- Common Table Expressions (`CTE`)
- Analytical aggregations

## ⚡ Common Table Expressions (CTE) & Temporary Tables
🧠 Concepts Used:
- Common Table Expressions (`WITH`)
- Local Temporary Tables (`#`)
- Global Temporary Tables (`##`)
- Aggregation with reusable datasets
- Nested filtering using subqueries

Window Functions → CTE → Duplicate Handling → Running Totals
🧠 Concepts Used:
- `DISTINCT`
- `ROW_NUMBER()`
- `PARTITION BY`
- Window aggregation (`SUM() OVER`)
- Common Table Expressions (`CTE`)

## 🔄 ETL Concepts & Incremental Loading
- Implemented full table synchronization using `MERGE`
- Inserted new records not present in target tables
- Updated existing records based on column-level changes
- Deleted obsolete records missing from source tables
- Compared source and target datasets dynamically

## ⚙️ Stored Procedures & Programmable SQL
📌 Features:
- Supports input and output parameters
- Can contain DDL and DML operations
- Supports variables, conditional logic, and procedural programming
- Can invoke other stored procedures and functions

📌 Use Cases:
- Centralized business logic
- Reusable transaction operations
- Secure database access
- Performance optimization through execution plan reuse

### ✔ Parameterized Stored Procedures
- Created reusable stored procedures using `CREATE PROCEDURE`
- Executed stored procedures using `EXEC` and `EXECUTE`
- Implemented input parameter handling for dynamic query execution
- Retrieved account balance information using parameterized procedures

### ✔ Output Parameters & Procedure Alteration
- Implemented stored procedures with both input and output parameters
- Retrieved dynamic values from database tables using output variables
- Executed procedures using declared variables and output bindings
- Modified existing procedures using `ALTER PROCEDURE`

⚙️ Stored Procedures & Programmable SQL
- Implemented conditional validation inside stored procedures using `IF...ELSE`
- Verified account existence before processing queries
- Handled invalid account inputs gracefully
- Combined procedural logic with output parameters for controlled execution

## ⚡ Triggers & Automated Data Validation
- Explored automated database validations using SQL Server Triggers
- Implemented event-driven validation logic during data modifications
- Learned differences between simple constraints and complex business validations
- Understood trigger-based enforcement of transactional business rules

### ✔ Trigger Types & Execution Flow
- Explored SQL Server trigger execution lifecycle
- Implemented automated validations during data modification events
- Learned pre-processing and post-processing trigger workflows
- Understood trigger-based business rule enforcement

### ✔ Automated Transaction Processing using Triggers
- Implemented automated balance update logic using SQL Server triggers
- Applied business-rule validation during transaction processing
- Updated account balances dynamically after transaction events
- Performed account status validation before processing deposits and withdrawals

### ✔ Transaction Rollback & Trigger-Based Validation
- Implemented trigger-based transaction rollback for invalid account operations
- Prevented transactions on deactivated customer accounts
- Enforced transactional integrity using automated rollback logic
- Combined validation and balance synchronization within trigger workflows

### ✔ Fund Validation & Transaction Authorization
- Implemented trigger-based balance validation for withdrawal transactions
- Prevented transactions with insufficient account balance
- Enforced transactional authorization using automated rollback logic
- Combined account status checks with balance verification workflows

### ✔ INSTEAD OF Triggers & High-Value Transaction Routing
- Implemented `INSTEAD OF` triggers for pre-processing transaction validation
- Intercepted high-value banking transactions before insertion
- Redirected large-volume transactions into a separate monitoring table
- Applied trigger-based transaction routing and segregation workflows

## 🔄 Cursors & Row-by-Row Processing
- Explored row-by-row data processing using SQL Server cursors
- Learned procedural record traversal techniques
- Understood cursor-based data navigation and update workflows
- Compared cursor-based processing with standard set-based queries

### ✔ Cursor Lifecycle & Navigation
- Declared a cursor on a query result set
- Opened the cursor for processing
- Retrieved records using `FETCH NEXT`
- Controlled iteration using `@@FETCH_STATUS`
- Closed and deallocated cursor resources

### ✔ Scrollable Cursors
Implemented scrollable cursor navigation techniques for moving across records in different directions without processing rows sequentially.
📌 Cursor Navigation Operations:
- `FETCH LAST` – Retrieves the last row in the result set
- `FETCH PRIOR` – Retrieves the row immediately before the current row
- `FETCH ABSOLUTE n` – Retrieves the specific row position
- `FETCH RELATIVE n` – Moves forward or backward relative to the current position

### ✔ Cursor Status Monitoring
Explored cursor state validation using SQL Server's built-in `CURSOR_STATUS()` function.
📌 Cursor Status Validation:
- Monitor cursor lifecycle state
- Verify cursor availability before processing
- Improve cursor management and debugging

## ✔ Static Cursors
Explored Static Cursors in SQL Server for read-only snapshot-based data access.
📌 Static Cursor Characteristics:
- Creates a snapshot of the result set when the cursor is opened
- Does not reflect subsequent changes made to the underlying table
- Primarily used for read-only operations
- Provides predictable and stable cursor navigation


## 🧮 User Defined Functions (UDF)
- Explored reusable SQL logic using User Defined Functions (UDF)
- Implemented modular calculation-oriented database functions
- Learned differences between functions and stored procedures
- Used parameterized function structures for reusable query logic

### ✔ Latest Product Version Validation
- Analyzed product version history using ranking functions
- Identified products whose latest version contains invalid or zero amounts
- Applied partition-based ranking for latest-record extraction

### ✔ Scalar User Defined Functions
- Created scalar user defined functions for reusable balance retrieval logic
- Returned computed values dynamically using input parameters
- Integrated functions within `SELECT`, `INSERT`, and conditional filtering operations
- Handled NULL scenarios using `ISNULL()`

### ✔ Inline & Table-Valued Functions
- Implemented Inline Table-Valued Functions for parameterized data retrieval
- Created reusable table-returning functions for branch-wise customer analysis
- Developed Multi-Statement Table-Valued Functions using table variables
- Returned structured datasets dynamically using function parameters

### ✔ Return Codes & Execution Status Handling
- Implemented stored procedure return codes for execution status tracking
- Returned custom status values for success and failure conditions
- Controlled execution flow using conditional return validation
- Combined output parameters with procedural status handling

### ✔ System Stored Procedures & Procedure Management
- Explored SQL Server system stored procedures for database metadata analysis
- Retrieved stored procedure definitions using built-in system utilities
- Managed stored procedures using creation, alteration, and deletion operations
- Investigated SQL Server environment and disk-level information

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
