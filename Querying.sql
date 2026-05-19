 Use INDIAN_BANK

--All cols and All rows
Select * from Account_master

--Some cols and All rows
Select Acid,name,Status from Account_master

--Some rows but all the columns
Select * 
from Account_master 
where BRID='BR1' and Clearbalance < 5000

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

-- Cube Operator

CREATE TABLE Item
(
    ItemName		Varchar(30)				Primary key,
    Color			VARCHAR(10),
    Onty			INT
);

Select * from Item

INSERT INTO item VALUES ('Chair', 'Black', 10);
INSERT INTO item VALUES ('Table', 'Red', 20);
INSERT INTO item VALUES ('WChair', 'Red', 50);
INSERT INTO item VALUES ('WTable', 'Black', 75);
INSERT INTO item VALUES ('FChair', 'Black', 25)

--Total
select SUM(Onty) as Total from Item

--Chair
select SUM(Onty) as Total from Item
where Color = 'Red'

-- Cube will give all permutations and combinations

Select Itemname, color, sum(Onty) as total
from Item
group by ItemName, Color

--Query with Cube
Select Itemname, color, sum(Onty) as total
from Item
group by ItemName, Color with cube

--Rollup - less permuatitions and combinations
Select Itemname, color, sum(Onty) as total
from Item
group by ItemName, Color with Rollup

--Row_Number
select acid, name, ROW_NUMBER() over (Order by Acid Asc) as Rno
from Account_master

--Partition by
select acid,BRID, name, ROW_NUMBER() over (Partition by Brid Order by Acid Asc) as Rno
from Account_master

--Getting 22nd Row
Select *
from (
		select acid, name, ROW_NUMBER() over (Order by Acid Asc) as Rno
		from Account_master
	) X
where Rno = 22

Select *
from (
		select acid, name, ROW_NUMBER() over (Order by Acid Asc) as Rno
		from Account_master
	) X
where Rno between 22 and 27

--1st person from each branch 
select Name
from (
		select acid,BRID, name, ROW_NUMBER() over (Partition by Brid Order by Acid Asc) as Rno
		from Account_master
	) x
where Rno = 1 

-- Get Every 5th Row from the table
Select *
from (
		select acid, name, ROW_NUMBER() over (Order by Acid Asc) as Rno
		from Account_master
	) X
where Rno % 5 = 0

--Rank and Dense Rank
select acid, name,BRID, Clearbalance,
		Rank()			over (Order by Clearbalance asc ) as Bal,
		Dense_Rank()	over (Order by Clearbalance asc ) as BalD
from Account_master

--Who is having the highest bal in the bank
Select *
from		(
			select acid, name,BRID, Clearbalance,
			Dense_Rank()	over (Order by Clearbalance desc ) as BalD
			from Account_master
			) X
where BalD = 1

--Who is having the highest bal in the bank - Branch wise ('Partition By')
Select *
from		(
			select acid, name,BRID, Clearbalance,
			Dense_Rank()	over (Partition by Brid Order by Clearbalance desc ) as BalD
			from Account_master
			) X
where BalD = 1

--Ntile() -- split data into groups
select acid, name,Brid,  Ntile(6) over (Order by Acid Asc) as GrpNo
from Account_master

--Selecting the particular group number
select *
from	(
		select acid, name,Brid,  Ntile(6) over (Order by Acid Asc) as GrpNo
		from Account_master
		) x
where GrpNo = 4

--Dividing even further by using the Partition in the Branch Id
select *
from	(
		select acid, name,Brid,  Ntile(6) over (Partition by Brid Order by Acid Asc) as GrpNo
		from Account_master
		) x
where GrpNo = 1

--Common table expression
with x
as 
		(
		select acid, name,Brid,  Ntile(6) over (Partition by Brid Order by Acid Asc) as GrpNo
		from Account_master
		) 
select * from x where GrpNo = 5;

with x
as 
		(
		select acid, name,Brid,  Ntile(6) over (Partition by Brid Order by Acid Asc) as GrpNo
		from Account_master
		) 
select * from x where GrpNo = 1

-- WHICH BRANCH HAS MORE CUSTOMERS
select brid, count(*) as Cnt
from Account_master
group by BRID

select count(*) as Customercount, BRID
from	(
			select brid, name, Acid
			from Account_master
		) x
group by BRID
order by Customercount asc

-- derived tablesa re slow, CTE is faster
-- only that query we can use multiple times not the other ones.
with x
as 
		(
		select Brid, count(*) as Cnt 
		from Account_master
		group by brid
		) 
select brid
from x
where cnt = (select max(cnt) from x)

--Temp Table
select brid, count(*) as Cnt into #k
from Account_master
group by BRID

--1st table
select brid 
from #k
where cnt = (select max(cnt) from #k)

--2nd table
select brid 
from #k
where cnt = (
select max(cnt) from #k where cnt < (select max(cnt) from #k) 
			)

select * from #k

-- Global Temp table
select brid, count(*) as Cnt into ##k
from Account_master
group by BRID

select * from ##k

--removing duplicate data
select * from dup_values

CREATE TABLE dup_values
(
    Name		Varchar(30),
);

insert into dup_values values ('Ram');
insert into dup_values values ('Rahim');
insert into dup_values values ('Ram');
insert into dup_values values ('Rahim');
insert into dup_values values ('Robert');
insert into dup_values values ('Ram');
insert into dup_values values ('Robert');

select name, count(*) as cnt
from dup_values
group by Name
having count(*) > 1

--by using distinct we can only see the data which are not duplicates
select distinct name
from dup_values

--By using CTE we can delete the duplicate data
with x_cte
as 
		(
		select name,
		Row_number() over (Partition by name order by name asc) Rno 
		from dup_values
		)
delete 
from x_cte
where Rno > 1

select name
from dup_values

--finding out running total - for only 1 movie
select Clearbalance,name,acid, sum(clearbalance) over (order by acid asc) Running_Total
from Account_master

--Based on the branch - if there are multiple movies
select	Clearbalance,name,acid, 
		brid, sum(clearbalance) over (partition by Brid order by acid asc) Running_Total
from Account_master

/*
if we want to move the data from one server to other.
if we want to move the water from one place to other place, we use the motor (that motor is ETL), right, 
just like that we will have the ETL software(Extract, Transform and Load) in SQL
*/

--Incremental Loading using Merge command
create database mergeDB

Use mergeDB

create table Emp
(
Name		varchar(20)				primary key,
eid			int						not null,
salary		money					not null
);

select * from Emp

insert into Emp 
values
('Nikhil', 1, 4564),
('Nihal', 2, 453654564),
('Nihil', 3, 45664564),
('Nihol', 4,5664564),
('Nikhi',5, 4565688464)

create table Merge_Emp
(
Name		varchar(20)				primary key,
eid			int						not null,
salary		money					not null
);

select * from Emp
select * from Merge_Emp

update Emp
set salary = 78945
where eid = 5

merge merge_emp D
using Emp S
on d.eid=s.eid

--Insert
when not matched by target
then 
insert (Name, eid, Salary) values (s.Name, s.eid, s.Salary)
-- Update
when matched and d.name <> s.name or d.salary <> s.salary
then 
update
set d.name = s.name, d.salary = s.salary
--Delete
when not matched by source
then delete;

use INDIAN_BANK

  --Stored Procedures
  select top 10 *
  from Transaction_master
  where Acid = 101
  order by Dateoftransaction desc

  /*
  there are 3 options to keep the data in the DB server
  Views -				if we dont want to provide any input parameters (No I/p are supported)
  Stored procedures -  they support all the i/p parameters, output, DDL, DML, Cache execution plan also
  Functions -			they support all the i/p parameters, output parameters
  Data in the Tables
  */

  -- Syntax - code will be centralised using SP´s
  create procedure <Proc Name>
  (
	Input -- To pass the data to SP
	Output -- To return from SP
  )
  As
  Begin
	  -- Variables
	  -- DDL
	  -- DML
	  -- Programming
	  -- Call a function
	  -- Call a SP
	  -- Cursors
	  -- Return Statement
  End

  -- call the SP
  Exec <Sp Name>
  or 
  Execute <Sp Name>

  -- SP can store an execution plan

--Create a Sample Proc
Create proc Welcome
as 
begin
		print 'Welcome to Sql'
end

Execute Welcome

-- creating SP with 1 input parameter
create proc Getbalance
(
		@acid int
)
as 
begin
		select clearbalance
		from Account_master
		where Acid = @acid
end
go

exec Getbalance 164

SELECT clearbalance
FROM Account_master
WHERE Acid = 164

sp_help Account_master

select * from Account_master

-- 1 input and 1 output parameter
create proc Getbalance1
(
		@acid		int,
		@balance	money	output
)
as
begin 
		select @balance = clearbalance
		from Account_master
		where Acid= @acid
end
go

declare @balance money
exec Getbalance1 @acid = 101, @balance output
print @balance

-- With 1 input
create proc GetB
(
		@acid			int
)
as 
begin
	select clearbalance
	from Account_master
	where Acid = @acid
end

exec GetB 155	

-- with 1 input and 1 output
create proc GetBa
(
		@acid			int,
		@Bal			Money		out
)
as 
begin
		select @bal = clearbalance
		from Account_master
		where Acid = @acid
end

--We need to exec all at once, Declare, exec and print or else the code wont work
declare @balance Money
exec	GetBa	154, @balance output
print @balance

-- Altering the SP
alter proc GetBa
(
			@acid			int,
			@bal			money			out,
			@name			varchar(100)	out
)
as 
begin
			select @Bal = clearbalance, @name = Name
			from Account_master
			where Acid = @acid
end

declare @bal	money
declare @name	varchar(100)
exec	GetBa	122, @bal output, @name output
print	@bal
print	@name

alter proc GetBa
(
			@acid			int,
			@bal			money			out,
			@name			varchar(100)	out
)
as 
begin
			declare @cnt	Int

			select @cnt = count(*) from Account_master where Acid = @acid

			if @cnt = 0
			begin 
					SELECT 'Invalid Account Number' AS Message
			end
			
			else
			begin
					select @Bal = clearbalance, @name = Name
					from Account_master
					where Acid = @acid
			end
end

declare @bal	money
declare @name	varchar(100)
exec	GetBa	101, @bal output, @name output
select	@bal
select	@name

use indian_bank

/*
--Return Statement
Check whether the SP is executed well of not?

Returns 0	-- Success
Returns Non Zero	-- Failed

SQl will stop execution of the procedure, when it findds Return keyword
*/

alter proc GetBa
(
			@acid			int,
			@bal			money			out,
			@name			varchar(100)	out
)
as 
begin
			declare @cnt	Int

			select @cnt = count(*) from Account_master where Acid = @acid

			if @cnt = 0
			begin 
					SELECT 'Invalid Account Number' AS Message
					Return 22
			end
			
			else
			begin
					select @Bal = clearbalance, @name = Name
					from Account_master
					where Acid = @acid

					Return 0
			end
end

declare @RC		Int
declare @bal	money
declare @name	varchar(100)

exec	@rc = GetBa	101, @bal output, @name output
select	@RC

if(@RC = 0)
begin	
			select @bal
			select @name
end
else
begin
			select 'Sp failed to execute'
end

select	@bal
select	@name

-- Dropping an Proc
drop proc Welcome

-- finding syntax - to get the proc code, where we can modify it further
sp_helptext Welcome

/*
types of SP's
-- system defined Sp's
sp_help
sp_helpdb
sp_helptext
sp_indexes
-- User defined Sp's
Never create user SP's names prefix with Sp_getbalance
*/

/****************************
Extended SP's
If has SP has C or C++ code then its Extended SP
example: sending an email, creating folder
prefix: Xp_
*/
-- complete server version
exec Xp_Msver

-- for finding the storage sapce in the disks
exec Xp_fixeddrives

exec sp_indexes Indian_bank

--CLR SP - Common language runtime - Dot.net

/*
User defined functions (Calculations)
select, update and delete --- we cant perform in UDF hence we are using functions
We cant use temptables in functions, we use table variables
Examples - creating automatic seat number in movie theatre
Types:
1. Scalar
2. Multi Statement Table valued
3. Inline functions - Parameterized view
*/

use indian_bank

-- Function Syntax:
create function Biryani
(
)
Returns
as 
	begin
		........
		return
	end
go


create function Fn_GetCustBalance
(
	@acid	int
)
Returns Money
as 
begin
		Declare @x Money

		select @x = clearbalance
		from Account_master
		where Acid = @acid
		
		return @x
	end
go

--calling an function - we need to add dbo.functionname, then only it will execute
select dbo.Fn_GetCustBalance(105)

alter function Fn_GetCustBalance
(
	@acid	int
)
Returns Money
as 
begin
		Declare @x Money

		select @x = clearbalance
		from Account_master
		where Acid = @acid
		
		return isnull (@x,0)
	end
go

--calling an function - we need to add dbo.functionname, then only it will execute
select dbo.Fn_GetCustBalance(105)

/*
Use function to delete and the rows
delete, update
from Account_master
where Clearbalance = dbo.Fn_GetCustBalance(105)
*/

--using vaiable
declare @x Money
set @x = dbo.Fn_GetCustBalance(105)
print @x

--insert
insert into Account_master values (222, 'Acheiver', 'Deu', 'BR3', 'SB', getdate(), dbo.Fn_GetCustBalance(105), dbo.Fn_GetCustBalance(105), 'O')

select * from Account_master

--schema of Fn
sp_helptext '[dbo].[Fn_GetCustBalance]'

-- All Sp's
select * from sys.procedures

-- All Views
select * from sys.views

-- All informations
select * from sys.objects

-- All Pk's
select * from sys.objects where type = 'PK'

-- All Functions
select * from sys.objects where type = 'Fn'