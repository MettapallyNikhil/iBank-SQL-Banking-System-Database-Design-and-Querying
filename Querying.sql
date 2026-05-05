 Use INDIAN_BANK

--All cols and All rows
Select * from Account_master

--Some cols and All rows
Select Acid,name,Status from Account_master

--Some rows but all the columns
Select * from Account_master where BRID='BR1' and Clearbalance < 5000

--Some cols and some rows
Select Acid,name,clearbalance from Account_master where Address = 'Hyd' or Address = 'Hyderabad'

--Sort (Order by clause is used to filter the data)
Select * from Account_master order by Clearbalance desc

Select Acid,Name
from Account_master
where PID = 'SB'
order by name desc

--Interview (Correct)
Select *,*,*
from Account_master

Select acid, name, *
from Account_master

Select 5 as [Myluckynumber] from Account_master

Select *,'Nikhil' from Account_master

-- We can print columns and constants

--Valid
Select acid, name, clearbalance, 'Rupees' as Currency from Account_master

-- We can print constants as columns for our purposes in this case as we dont have the currency column we addeded it

--Concatenate
--use + Symbol
Select acid, name + ' is the best customer'
from Account_master
where Clearbalance > 5000

--Updating the table
update Account_master set name = 'Roßberger' where acid = 101

--The below are used to change the data type
--Cast(col as datatype)
--Convert(datatype, columnname, stylenum)

select acid, name, cast (clearbalance as varchar) + ' INR' as currency from Account_master

select acid, name, Convert (varchar,clearbalance) + ' INR' as currency from Account_master

use INDIAN_BANK

Select * from Account_master

select acid, name, Convert (varchar,clearbalance) + ' INR' as currency from Account_master

Select Dateofopening, convert (varchar,dateofopening,1) as DOO from Account_master

select * from Account_master

--Find out no.of customers
select count(*) from Account_master
select count(*) NOC from Account_master

select count(*) NOC
from Account_master
where BRID = 'BR1' or  BRID= 'BR2'

select count(*) NOC
from Account_master
where BRID in ('BR1' , 'BR2')

--first FROM clause and then 'WHERE' clause is going to work and Aggregation atlast 'SELECT'

--Finding total bal
Select sum(clearbalance) tb
from Account_master

Select Min(clearbalance) MB
from Account_master

Select max(clearbalance) MaxB
from Account_master

Select avg(clearbalance) AB
from Account_master

--All Aggreagations
select count(*) NOC,
sum(clearbalance) tb,
Min(clearbalance) MB,
max(clearbalance) MaxB,
avg(clearbalance) AB
from Account_master
where BRID='BR1'

--Null values
select nullif(6,6) as Result

select nullif(6,4) as Result

 select acid, name,clearbalance,unclearbalance, nullif(clearbalance,unclearbalance) as Balance 
 from Account_master

 --Between function
 select *
 from Account_master
 where Clearbalance between 3000 and 5000

 select name
 from Account_master
 where datepart(yy,Dateofopening) between 2020-01-01 and 2024-01-01

 use INDIAN_BANK

 Select * from Account_master

 select min(clearbalance) from Account_master
 select max(clearbalance) from Account_master

 --When else 
 Select name, clearbalance,
		Customertype= case
		when clearbalance < 5000					then 'Silver'
		when clearbalance between 5000 and 10000	then 'Gold'
		when clearbalance between 10000 and 15000	then 'Diamond'
		else 'Platinum'
		end
from Account_master

select * from Account_master 

--A query in the where clause is subquery.
select name
from Account_master
where clearbalance = (select max(clearbalance) from Account_master) 

Use Indian_Bank

select * 
from Account_master

select avg(clearbalance) from Account_master

--Subquery
select *, Clearbalance-(select avg(clearbalance) from Account_master) as diff
from Account_master

select *
from Account_master
where Clearbalance = (
				select max(clearbalance) 
				from Account_master
				where Clearbalance < (select max(clearbalance) from Account_master)
					)

-- Max 32 levels of Nesting is allowed in an subquery

--Finding the 10th highest
Select *
from Account_master
where Clearbalance = (
				Select min(clearbalance)
				from Account_master
				where Clearbalance in (
							Select distinct Top 10 Clearbalance
							from Account_master
							order by Clearbalance desc
										)
					)	
				
CREATE TABLE EmpInfo
(
    EID					INT						PRIMARY KEY,
    EmpName				VARCHAR(50),
    Salary				INT,
    DeptName			VARCHAR(50)
);

INSERT INTO EmpInfo VALUES (1, 'John', 10000, 'HR');
INSERT INTO EmpInfo VALUES (2, 'Girish', 12000, 'Sales');
INSERT INTO EmpInfo VALUES (3, 'Mannat', 8000, 'Sales');
INSERT INTO EmpInfo VALUES (4, 'Salman', 14000, 'HR');
INSERT INTO EmpInfo VALUES (5, 'Ratan', 9000, 'HR');
INSERT INTO EmpInfo VALUES (6, 'Peter', 11000, 'Sales');

select *
from EmpInfo E1
where Salary > (
			Select avg(Salary)
			from EmpInfo E2
			where E2.DeptName = E1.DeptName			
			)

--Correlated Subquery
-- outer query is first executed
-- value by value at a time... 
-- dependant on the main query
-- loop in a loop

--Whoever did the transactions
select *
from Account_master as AM 
where exists (
			Select * 
			from Transaction_master as TM
			where Am.Acid = Tm.Acid
			)

--Who didnt do the transactions
select *
from Account_master as AM 
where not exists (
			Select * 
			from Transaction_master as TM
			where Am.Acid = Tm.Acid
			)

-- to display data from all the tables - we use joins
-- If we dont want to display the other table - then subquery or correlated subquery

-- To know how many tables are there in a Database
select * from sys.tables
select count(*) as NoOfTables from sys.tables

--To know how many columns
select * from sys.columns where object_id=1397580017
select count(*) as NoOfColumns from sys.columns where object_id=1397580017

--Subquery
Select *
from sys.columns
where object_id = (select object_id from sys.tables where name='Transaction_master')

--ColName
--Identify the table
select A.Name ColName, B.Name TableName
from sys.columns as A join sys.tables as B on A.object_id = B.object_id 
where A.Name = 'Clearbalance'

--Check Emp table exists or Not
if exists (Select * from sys.tables where name = 'Emp')
		drop table 'Emp'

--All db Names
select * from sys.databases

-- All Sp
select * from sys.procedures

--All Triggers
Select * from sys.Triggers

-- Interview question -- Derived Query
--Write a SQL query to determine the **number of new customers acquired each month**.
 
CREATE TABLE SalesData
(
    DoS				DATE				Primary key,
    Customer		VARCHAR(10),
    SalesAmount		INT
);

Select * from SalesData

INSERT INTO SalesData VALUES
-- JAN
('2020-01-12','C1',1000),
('2020-01-20','C2',1200),
-- FEB
('2020-02-07','C3',500),
('2020-02-15','C1',300),
('2020-02-21','C4',750),
-- MAR
('2020-03-02','C5',1500),
('2020-03-22','C6',8000),
('2020-03-25','C4',7000),
('2020-03-26','C2',1200),
-- APR
('2020-04-05','C7',900),
('2020-04-10','C1',1100),
('2020-04-18','C8',2000),
-- MAY
('2020-05-03','C2',1500),
('2020-05-14','C9',2500),
('2020-05-20','C3',800),
-- JUN
('2020-06-01','C10',3000),
('2020-06-11','C4',1000),
('2020-06-19','C1',700),
-- JUL
('2020-07-07','C11',4000),
('2020-07-15','C5',1200),
('2020-07-25','C2',900),
-- AUG
('2020-08-02','C12',3500),
('2020-08-10','C6',2000),
('2020-08-21','C3',1100),
-- SEP
('2020-09-05','C13',5000),
('2020-09-17','C7',1500),
('2020-09-28','C1',800),
-- OCT
('2020-10-03','C14',4500),
('2020-10-12','C8',2200),
('2020-10-20','C4',1300),
-- NOV
('2020-11-01','C15',6000),
('2020-11-11','C2',1400),
('2020-11-19','C9',1800),
-- DEC
('2020-12-05','C16',7000),
('2020-12-15','C10',2500),
('2020-12-22','C3',900);

select * 
from SalesData
where DoS = 'YYYY-MM-DD'

Select 
	FORMAT(Purchase, 'MMM') as MonthName, 
	count(*) as NewCustomers
from (
				select Customer, min(DoS) as Purchase
				from SalesData
				group by Customer
				) X
group by 
	FORMAT(Purchase, 'MMM'), 
	MONTH(Purchase)
Order by 
	Month(Purchase);

-- Derived Tables
-- when we add another query starting 'from' is Derived table
-- but whereas if we use from 'where' its subquery

select *
from (select * from Account_master) S

-- Joins
select A.Acid, name, count(*) as NoOfT
from Account_master as a join Transaction_master as t on a.Acid = t.Acid
where datepart(yy, Dateoftransaction) = 2025
group by a.Acid, Name

--Derived query
select A.acid, name,  NoOfT
from Account_master A
join (
		select Acid, count(*) as NoOfT
		from Transaction_master
		where datepart(yy, Dateoftransaction) = 2025
		group by Acid
		) B
on A.Acid = B.Acid

-- Always we need to elimate the data and then join it..  for fast processing of the data






