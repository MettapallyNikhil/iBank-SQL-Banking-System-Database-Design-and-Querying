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

### ✔ Conditional Classification & Aggregate Subqueries
* Retrieved customers with balances above the overall average
* Applied aggregate subqueries for dynamic data filtering
* Categorized customers using the `CASE` expression
* Implemented customer segmentation based on account balance ranges

📌 Concepts Practiced:
* Aggregate subqueries
* `AVG()` function
* `CASE` expression
* Conditional customer classification

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

### ✔ Local & Global Temporary Tables
* Created temporary tables for session-based and shared data storage
* Implemented local (`#`) and global (`##`) temporary tables
* Performed temporary data insertion, retrieval, and deletion operations
* Explored session scope and lifecycle management of temporary tables

📌 Local Temporary Tables (`#`):
* Accessible only within the current session
* Automatically removed when the session ends
* Stored in the `tempdb` database
* Used for temporary intermediate processing

📌 Global Temporary Tables (`##`):
* Accessible to all active SQL Server sessions
* Stored in the `tempdb` database
* Automatically removed after the creating session ends and no other session is using the table
* Useful for sharing temporary data across multiple sessions

### ✔ Table Variables
* Implemented table variables for temporary in-memory style data storage
* Stored multiple rows using table-type variables
* Performed insert and retrieval operations on table variables
* Compared table variables with temporary tables for different use cases

📌 Table Variable Characteristics:
* Declared using the `@` symbol
* Stored internally in the `tempdb` database
* Exists only during the current batch or procedure execution
* Best suited for small datasets and one-time processing

📌 Table Variables vs Temporary Tables:
* Table variables are intended for small datasets
* Temporary tables (`#`) are better suited for larger datasets
* Table variables are automatically removed after execution
* Table variables cannot be dropped explicitly using `DROP TABLE`

## 🔄 ETL Concepts & Incremental Loading
- Implemented full table synchronization using `MERGE`
- Inserted new records not present in target tables
- Updated existing records based on column-level changes
- Deleted obsolete records missing from source tables
- Compared source and target datasets dynamically

### ✔ T-SQL Variables & Memory Management
* Implemented local variables for temporary data storage during program execution
* Stored and transferred values within T-SQL programs using variables
* Explored variable declaration, assignment, and retrieval operations
* Learned memory-based processing without permanent database storage

### ✔ Variable Assignment & Arithmetic Operations
* Declared multiple local variables for data processing
* Assigned values using the `SET` statement
* Performed arithmetic calculations using variables
* Displayed computed results using the `PRINT` statement

### ✔ Variable Manipulation & Data Handling
* Performed arithmetic operations using local variables
* Updated variable values dynamically during execution
* Explored temporary memory-based data storage concepts
* Practiced variable swapping and value reassignment techniques

📌 Variable Operations:
* Variable initialization
* Incrementing existing values
* Temporary value storage
* NULL assignment and memory cleanup

### ✔ Variable Output & T-SQL Program Structure
* Displayed variable values using both `PRINT` and `SELECT` statements
* Converted numeric data to string format using `CAST()`
* Explored differences between message output and result-set output
* Learned the basic structure of Stored Procedures combining SQL and T-SQL

### ✔ Basic Stored Procedure Creation & Execution
* Created a stored procedure containing T-SQL programming logic
* Declared and manipulated local variables inside a procedure
* Performed arithmetic operations using procedural code
* Executed stored procedures using the `EXEC` command

📌 Stored Procedure Concepts:
* Encapsulates reusable business logic
* Supports SQL and T-SQL statements
* Executes as a single database object
* Can be called multiple times without rewriting code

📌 Stored Procedure Structure:
* Supports SQL commands (DDL, DML, TCL, DCL)
* Supports T-SQL programming constructs
* Can call Views, Functions, and Stored Procedures
* Can create and manage temporary objects

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

✔ Batch Data Processing using TVPs
Implemented user-defined table types for passing multiple records
Processed bulk data efficiently using stored procedures
Reduced multiple database calls by sending tabular data as a single parameter
Improved performance for batch insert and update operations

📌 Concepts Covered:
User-Defined Table Type
READONLY Table-Valued Parameters
Batch Inserts
Bulk Data Processing

✔ Transaction Management using BEGIN, COMMIT & ROLLBACK
Implemented database transactions to ensure atomic execution of multiple SQL statements
Committed successful transactions permanently to the database
Rolled back transactions automatically when errors occurred
Preserved data consistency during critical banking operations

📌 Transaction Commands:
BEGIN TRANSACTION – Starts a transaction
COMMIT TRANSACTION – Permanently saves all changes
ROLLBACK TRANSACTION – Reverts all changes made during the transaction
Ensures ACID properties for reliable database operations

✔ Transaction Rollback
Reverted database changes when an error occurred
Prevented partial updates during transaction failures
Ensured reliable execution of banking operations
Protected database consistency through rollback mechanisms

✔ TRY...CATCH with Transactions
Combined transaction management with structured exception handling
Committed successful transactions and rolled back failed operations
Improved reliability of business-critical SQL procedures
Captured runtime exceptions while maintaining data integrity

### ✔ WHILE Loop & Iterative Processing
* Implemented iterative logic using the `WHILE` loop
* Controlled execution using loop conditions
* Incremented variables dynamically during each iteration
* Generated sequential output through repetitive execution

📌 Loop Components:
* Variable initialization
* Loop condition evaluation
* Increment/Decrement operations
* Repetitive statement execution

✔ IF...ELSE Conditional Programming
Implemented conditional execution using IF...ELSE statements
Applied business rule validation before executing SQL operations
Controlled program flow based on logical conditions
Improved stored procedure decision-making through conditional branching

📌 Concepts Practiced:
IF statement
ELSE statement
Conditional execution
Business rule validation

✔ BREAK & CONTINUE in WHILE Loops
Implemented loop control using BREAK and CONTINUE
Terminated loop execution based on business conditions
Skipped specific iterations without stopping the loop
Improved control over iterative processing in T-SQL programs

📌 Loop Control Statements:
BREAK – Exits the loop immediately
CONTINUE – Skips the remaining statements in the current iteration
Used for conditional execution inside loops
Simplifies complex iterative logic

### ✔ WHILE Loop with Stored Procedures
* Implemented iterative processing inside a stored procedure
* Automated record insertion using loop-based logic
* Generated sequential data through repetitive execution
* Combined T-SQL programming with DML operations

📌 Concepts Practiced:
* Stored procedure with `WHILE` loop
* Dynamic data insertion
* Variable-controlled iteration
* Automated batch processing

### ✔ Parameterized Loop-Based Data Generation
* Created parameterized stored procedures for dynamic record generation
* Accepted starting and ending values as input parameters
* Automated sequential data insertion using `WHILE` loops
* Reset destination tables before generating new datasets using `TRUNCATE`

📌 Features Implemented:
* Input parameter handling
* Dynamic loop execution
* Automated batch insertion
* Table reset using `TRUNCATE`

### ✔ Conditional Number Generation using WHILE Loops
* Generated odd and even number sequences using iterative processing
* Controlled loop execution through variable initialization and increments
* Implemented arithmetic progression using fixed step values
* Practiced conditional looping techniques for automation tasks

📌 Loop Scenarios:
* Generate odd numbers
* Generate even numbers
* Variable-controlled iteration
* Sequential number generation

### ✔ Types of Stored Procedures
* Explored different categories of stored procedures available in SQL Server
* Learned the purpose and use cases of each stored procedure type
* Distinguished between user-created and system-provided procedures
* Introduced CLR integration for .NET-based database programming

📌 Stored Procedure Types:
* **User-Defined Stored Procedures** – Created by developers for implementing business logic.
* **System Stored Procedures** – Built-in SQL Server procedures for administration and metadata operations.
* **Extended Stored Procedures** – Legacy procedures used to execute external programs (deprecated).
* **CLR Stored Procedures** – Developed using .NET languages and executed through SQL Server Common Language Runtime (CLR).

### ✔ Parameterized Stored Procedures
* Modified stored procedures to accept input parameters dynamically
* Passed user-supplied values during procedure execution
* Performed arithmetic calculations using parameterized inputs
* Improved code reusability through flexible procedure design

📌 Input Parameter Concepts:
* Accepts values from users or applications
* Parameters are supplied during execution
* Supports dynamic business logic processing
* Eliminates hardcoded values within procedures

### ✔ Parameterized Stored Procedures
- Created reusable stored procedures using `CREATE PROCEDURE`
- Executed stored procedures using `EXEC` and `EXECUTE`
- Implemented input parameter handling for dynamic query execution
- Retrieved account balance information using parameterized procedures

✔ Status Management using Stored Procedures
Created stored procedures to execute multiple SQL statements as a single program
Automated inactive account identification based on transaction history
Updated account status using centralized business logic
Improved maintainability through reusable procedural code

### ✔ Stored Procedure Recompilation
* Explored recompilation to regenerate execution plans for stored procedures
* Cleared outdated cached execution plans to improve performance
* Learned when recompilation is appropriate for slow-running procedures
* Identified query-level optimization when recompilation alone is insufficient

📌 Recompilation Concepts:
* Uses the `WITH RECOMPILE` option during procedure creation or alteration
* Removes the cached execution plan and generates a new one
* Helpful when execution plans become inefficient due to changing data
* If performance remains poor after recompilation, individual SQL statements should be analyzed and optimized

### ✔ Default Parameter Values in Stored Procedures
* Implemented stored procedures with default input parameter values
* Retrieved branch-specific customer information dynamically
* Allowed procedure execution with or without explicit parameter values
* Improved flexibility through optional parameter handling

📌 Default Parameter Features:
* Parameters can be assigned default values
* Users may override the default during execution
* Simplifies procedure execution for common scenarios
* Enhances reusability of stored procedures

### ✔ Output Parameters in Stored Procedures
* Implemented output parameters to return values from stored procedures
* Retrieved customer name and account balance dynamically
* Validated account existence before returning results
* Passed output values to local variables for further processing

📌 Output Parameter Features:
* Returns values to the calling program
* Supports multiple output parameters
* Uses the `OUT` keyword for parameter binding
* Enables reusable data retrieval procedures

### ✔ TRY...CATCH Exception Handling & Error Logging
* Implemented structured exception handling using `TRY...CATCH`
* Logged runtime errors into a dedicated SQL error log table
* Returned execution status using `RETURN` codes
* Captured complete error diagnostics for debugging and auditing

📌 Exception Handling Features:
* `BEGIN TRY...END TRY`
* `BEGIN CATCH...END CATCH`
* Automatic error logging
* Success (`0`) and failure (`1`) return codes

### ✔ Error Detection using `@@ERROR`
* Explored runtime error detection using the `@@ERROR` system function
* Verified execution status immediately after SQL statements
* Identified successful and failed query executions
* Compared legacy error handling with modern `TRY...CATCH` blocks

📌 `@@ERROR` Features:
* Returns `0` when the previous statement executes successfully
* Returns a non-zero error number if the previous statement fails
* Must be checked immediately after the SQL statement
* Primarily used in legacy SQL Server error handling

📌 Return Statement Notes:
* Indicates whether a SQL statement executed successfully
* `0` → Successful execution
* Non-zero → Error occurred
* `TRY...CATCH` is the preferred approach for modern SQL Server programming

### ✔ Multi-Result Stored Procedures for Account Analytics
* Created parameterized stored procedures for account-wise transaction analysis
* Retrieved customer account information using dynamic inputs
* Generated transaction history reports for a specific time period
* Produced transaction-type summaries using aggregation functions

📌 Features Implemented:
* Input parameter handling
* Multiple result sets from a single procedure
* Date-based transaction filtering
* Aggregated transaction reporting

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

⚡ Dynamic SQL
Dynamic SQL enables SQL statements to be constructed and executed at runtime based on user input or application requirements.

✔ Dynamic SQL using EXEC()
Implemented dynamic SQL statements executed at runtime
Constructed SQL queries using string variables
Executed dynamically generated SQL using the EXEC() command
Improved query flexibility for dynamic filtering and reporting

📌 Dynamic SQL Features:
Query is built during execution
Supports dynamic table and column selection
Useful for search screens and reporting
Enables flexible SQL generation

✔ Parameterized Dynamic SQL using (sp_executesql)
Executed parameterized dynamic SQL securely
Reduced SQL injection risks through parameter binding
Improved execution plan reuse
Enhanced performance for repeated dynamic queries

📌 Benefits of sp_executesql:
Supports input parameters
Better execution plan caching
More secure than string concatenation
Recommended for production environments

✔ String Manipulation Functions
Practiced built-in SQL Server string functions for text processing
Formatted and transformed character data efficiently
Improved data quality using string manipulation techniques
Applied string functions in real-world querying scenarios

📌 Functions Covered:
UPPER()
LOWER()
LEN()
LTRIM()
RTRIM()
TRIM()
LEFT()
RIGHT()
SUBSTRING()
REPLACE()

✔ Searching Text
Retrieved character positions using search functions
Extracted text dynamically from string values
Improved querying of textual data
Applied text-search operations for business reporting

📌 Functions Covered:
CHARINDEX()
PATINDEX()

✔ Date & Time Functions
Implemented built-in SQL Server date functions for retrieving and manipulating dates
Performed date arithmetic and interval calculations
Extracted individual date components for reporting and analysis
Applied date functions in banking and transaction-based scenarios

📌 Functions Covered:
GETDATE()
CURRENT_TIMESTAMP
DATEADD()
DATEDIFF()
DATEPART()
DATENAME()
DAY()
MONTH()
YEAR()

✔ Date Formatting & Business Calculations
Formatted date values for reports and dashboards
Calculated future and previous dates using date arithmetic
Measured durations between important business events
Supported time-based analysis for transactional data

✔ Mathematical Functions
Implemented built-in mathematical functions for numeric calculations
Performed rounding, absolute value, and power computations
Applied mathematical operations for financial and analytical scenarios
Improved data analysis through efficient numerical processing

📌 Functions Covered:
ABS()
ROUND()
CEILING()
FLOOR()
POWER()
SQRT()
SQUARE()
PI()
RAND()

✔ Mathematical Functions with Banking Data
Applied mathematical functions to account balances and financial values
Rounded monetary values for reporting
Calculated absolute differences and financial metrics
Improved numerical accuracy in business reports

✔ Parameter Sniffing
Explored SQL Server's parameter sniffing mechanism during stored procedure execution
Analyzed how execution plans are generated based on initial parameter values
Identified scenarios where cached execution plans may impact query performance
Applied optimization techniques to improve query execution consistency

📌 Concepts Covered:
Execution Plan Caching
Parameter Sniffing
Query Optimizer
Performance Tuning

✔ Parameter Sniffing Optimization Techniques
Used recompilation to generate optimized execution plans
Applied local variables to reduce parameter sniffing effects
Evaluated query hints for performance optimization
Improved stored procedure efficiency for varying workloads

📌 Common Solutions:
OPTION (RECOMPILE)
WITH RECOMPILE
Local Variables
OPTIMIZE FOR
OPTIMIZE FOR UNKNOWN

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

### ✔ Keyset-Driven Cursors
Explored Keyset-Driven Cursors in SQL Server for efficient cursor navigation with reduced memory consumption.
📌 Keyset Cursor Characteristics:
- Stores only key values in `tempdb`
- Uses less storage compared to Static Cursors
- Supports scrollable navigation
- Can detect updates made to existing rows
- Does not display newly inserted rows by other users after the cursor is opened

### ✔ Dynamic Cursors
Explored Dynamic Cursors in SQL Server for real-time access to changing datasets.
📌 Dynamic Cursor Characteristics:
- Reflects changes made to the underlying data while the cursor is open
- Does not create a complete snapshot of the result set
- Supports row updates and deletions through cursor positioning
- Suitable for highly dynamic datasets requiring real-time visibility

## 🌐 Cross-Database Queries & Schemas
Explored querying data across multiple databases without switching the active database context.
### ✔ Cross-Database Querying
Implemented queries to retrieve data from tables located in other databases using fully qualified object names.
📌 Query Formats Practiced:
- Database.Schema.Table
- Database..Table (default dbo schema)
Examples:
- Accessing tables from another database
- Retrieving data without changing database context
- Working with multiple databases in a single query

### ✔ SQL Server Schemas
Explored the purpose and usage of schemas in SQL Server.
📌 Benefits of Schemas:
- Logical organization of database objects
- Security and access control
- Separation of business domains
- Easier permission management
- Role-based table access

### ✔ Schema Creation & Object Organization
* Created custom schemas to logically organize database objects
* Implemented schema-based table creation for departmental segregation
* Improved security through schema-level object grouping
* Managed schema lifecycle using creation and deletion operations

📌 Schema Benefits:
* Logical separation of database objects
* Department-wise data organization
* Simplified permission management
* Enhanced database security and maintainability

🔗 Linked Servers in SQL Server
📌 What is a Linked Server?
A Linked Server enables SQL Server to execute commands and retrieve data from another SQL Server instance or external data source.
🎯 Purpose
Access data from remote SQL Server instances.
Perform cross-server queries.
Integrate data from multiple servers.
Simplify reporting across distributed databases.

### ✔ Views for Data Abstraction & Reusability
* Created reusable virtual tables using SQL Server Views
* Centralized frequently used query logic for application access
* Simplified data retrieval without exposing underlying table complexity
* Improved code maintainability and query reusability

```sql
CREATE VIEW vw_getmybalance
AS
SELECT *
FROM Account_master
WHERE Acid = 122;
```

### ✔ Business Reporting using Views
* Used views to expose required data without granting direct table access
* Implemented customer activity analysis through reusable view-based queries
* Identified customers with no transactions in the last six months
* Simplified reporting logic for front-end applications and users

### ✔ View Limitations & Dynamic Data Retrieval
* Explored practical limitations of SQL Server Views
* Created branch-specific views for filtered customer access
* Verified that views always display the latest table data
* Demonstrated data abstraction without physical data storage

### ✔ Updatable and Non-Updatable Views
* Explored read-only and read-write view behavior in SQL Server
* Created non-updatable views for restricted data access
* Performed INSERT and UPDATE operations through updatable views
* Analyzed view modification capabilities and data consistency

📌 Non-Updatable Views:
* Typically used for read-only data access
* Often contain aggregated or derived data
* Cannot always support direct INSERT or UPDATE operations
* Used for reporting and analytical purposes

📌 Updatable Views:
* Support direct INSERT operations
* Support UPDATE operations on underlying tables
* Reflect changes in source tables automatically
* Used to simplify controlled data modifications

### ✔ Advanced View Operations & View Security
* Created views for time-based transaction analysis and customer segmentation
* Performed joins between views and base tables for integrated reporting
* Built hierarchical views by creating views on top of existing views
* Implemented view security using `SCHEMABINDING` concepts and `ENCRYPTION`

📌 View-Based Analytics:
* Created views for current-year transaction reporting
* Filtered data using date-based conditions (`DATEDIFF`)
* Built product-specific customer views (FD, SB, etc.)
* Created branch-wise customer segmentation views

📌 View Relationships & Joins:
* Joined views with tables for consolidated reporting
* Created views based on other views
* Supported multi-level view architecture
* Simplified complex business queries

📌 View Dependencies:
* Dependent views fail if parent views are removed
* Schema modifications can impact views, procedures, and functions
* Object naming consistency is critical for maintainability
* Dependency management is essential in production systems

📌 View Security Features:
* `WITH ENCRYPTION` hides view source code
* `SP_HELPTEXT` cannot display encrypted view definitions
* `SCHEMABINDING` prevents structural table modifications
* Improves protection of business logic and database objects

### ✔ Views with CHECK OPTION
* Implemented views with `WITH CHECK OPTION` to enforce view conditions
* Restricted updates that would move rows outside the view definition
* Preserved data consistency through view-level validation
* Prevented unauthorized modifications violating view filters

📌 CHECK OPTION Behavior:
* Ensures modified rows continue to satisfy the view condition
* Blocks updates that make records disappear from the view
* Enforces business rules at the view level
* Improves data integrity for filtered datasets

### ✔ Indexed Views for Performance Optimization
* Created indexed views using `SCHEMABINDING`
* Performed branch-wise aggregation on customer balances
* Generated precomputed summary datasets for reporting
* Improved performance for frequently executed analytical queries

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

##Interview Questions
Find all accounts that share the same ClearBalance value with at least one other account.
SELECT Acid, Name, ClearBalance
FROM Account_master
WHERE ClearBalance IN
(
    SELECT ClearBalance
    FROM Account_master
    GROUP BY ClearBalance
    HAVING COUNT(*) > 1
)
ORDER BY ClearBalance;

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
