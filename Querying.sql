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

use Indian_bank

-- All Check constraints
select * from sys.objects where type = 'C'

--Inline functions - Parameterised views
create function Fn_GetBranchCustomers
(
		@brid		char(4)
)
Returns Table
as
return
	(
	select *
	from Account_master
	where brid = @brid
	)
go

--while calling the Inline function use * from as we mentioned TABLE in the query
select *
from dbo.Fn_GetBranchCustomers('Br1')

select *
from Account_master
where BRID= 'BR1'

--Table values function
create function Fn_Getcustomers
(
	@acid		int
)
returns @tmp	table(	Acid	int,
						name	varchar(100),
						Bal		Money
					)
As 
begin
		insert into @tmp (Acid, name, Bal)

		select Acid, name, Bal
		from Account_master
		where Acid = @acid

return

end

-- Interview Questions

CREATE TABLE ProductVersions
(
    ProductNo INT,
    VersionNo INT,
    Amount INT
)

CREATE TABLE ProductInfo
(
    ProductNo	INT		not null,
    VersionNo	INT		not null,	
    Amount		INT		not null
)

insert into ProductInfo values (10,1,100),(10,2,120),(10,3,0),(10,4,0)
insert into ProductInfo values (20,1,45),(20,2,0),(20,3,55),(20,4,78),(20,5,234)
insert into ProductInfo values (30,1,120),(30,2,0)
insert into ProductInfo values (40,1,0),(40,2,130),(40,3,0)
insert into ProductInfo values (50,1,230),(50,2,345),(50,3,126)
insert into ProductInfo values (60,1,0)
insert into ProductInfo values (70,1,0),(70,2,0)

select * from ProductInfo

select *
from (
select ProductNo, VersionNo, Amount,
		Rank() over(partition by productNo
		order by VersionNo desc) Rno
from ProductInfo
	) K
Where Rno = 1 and Amount = 0

use Indian_bank

/*
TRIGGERS
Need - to validatze the data
Complex validations then Triggers ex: cst cannot withdraw more than 20k in a day. - in this as csts do multiple transactions then we need triggers
simple things are performed by check constraints ex: like salary should not be 0, male of female etc
*/

select * from Account_master
select * from Transaction_master

/*
Need of the triggers
1. Pre Processing: Validations
		Accounts	--		Closed
		CW			---		Funds Availability
2. Post Processing: Job

		DML (insert, update and delete) Operations in same table/different tables
Types - After (or) For
		Instead Of
*/

-- Syntax
create trigger <Trigger Name>
on <TableName>
<Type>  <insert,update,delete>
as
begin
	--Code
End
Go

-- Every time when Trigger fires, there will be 2 new tables INSERTED - there will be rows here and DELETED - there wont be any rows
-- They are called Magic tables, it helps to identify who has done the transaction and all.

use sp_settriggerorder

use INDIAN_BANK

select * from Account_master
select * from Transaction_master

create trigger check_StatusAndUpdateStatus
on Transaction_master
after insert,update,delete
as 
begin

declare @acid	int
declare @type	char(3)
declare @amt	money
declare @status	char(1)

--Get cst Info
select @acid = Acid, @type = Transactiontype, @amt = TransactionAmount from inserted

--Find out the status
Select @status = status from Account_master where acid = @acid

-- Open
 if (@status = 'o')
	begin
			if (@type = 'CD')
				begin	
					update Account_master set Clearbalance = Clearbalance + @amt where acid = @acid
				end
			else
				begin
					update Account_master set Clearbalance = Clearbalance - @amt where acid = @acid
				end
	End
else
	begin
		print 'Your Account is De-Activated. Please call CC'
		print 'Txn is declined'
	end
End

select * from Account_master
select * from Transaction_master where TransactionNumber > 51

delete from Transaction_master where TransactionNumber = 53

insert into Transaction_master values (getdate(), 101, 'Br2', 'CD', null, null,1520, 1 )
insert into Transaction_master values (getdate(), 106, 'Br2', 'CD', null, null,1520, 1 )

-- Rollback
Alter trigger check_StatusAndUpdateStatus
on Transaction_master
after insert,update,delete
as 
begin

declare @acid	int
declare @type	char(3)
declare @amt	money
declare @status	char(1)

--Get cst Info
select @acid = Acid, @type = Transactiontype, @amt = TransactionAmount from inserted

--Find out the status
Select @status = status from Account_master where acid = @acid

-- Open
 if (@status = 'o')
	begin
			if (@type = 'CD')
				begin	
					update Account_master set Clearbalance = Clearbalance + @amt where acid = @acid
				end
			else
				begin
					update Account_master set Clearbalance = Clearbalance - @amt where acid = @acid
				end
	End
else
	begin
		print 'Your Account is De-Activated. Please call CC'
		print 'Txn is declined'
		Rollback
	end
End

insert into Transaction_master values (getdate(), 106, 'Br2', 'CD', null, null,1520, 1 )

Use Indian_bank

--validation for the sufficient bal
Alter trigger check_StatusAndUpdateStatus
on Transaction_master
after insert,update,delete
as 
begin

declare @acid	int
declare @type	char(3)
declare @amt	money
declare @status	char(1)
declare @bal	money

--Get cst Info
select @acid = Acid, @type = Transactiontype, @amt = TransactionAmount from inserted

--Find out the status
Select @status = status from Account_master where acid = @acid

-- Open
 if (@status = 'o')
	begin
			if (@type = 'CD')
				begin	
					update Account_master set Clearbalance = Clearbalance + @amt where acid = @acid
				end
			else
				begin

				--check the balance
				select @bal = Clearbalance from Account_master where acid= @acid

				if (@amt <= @bal)
					update Account_master set Clearbalance = Clearbalance - @amt where acid = @acid
				else
					begin
						print 'Insufficient funds in your konto'
						print 'Txn is declined'
						Rollback
				end
			end
	End
else
	begin
		print 'Your Account is De-Activated. Please call CC'
		print 'Txn is declined'
		Rollback
	end
End


select * from Account_master
insert into Transaction_master values (getdate(), 101, 'Br2', 'CD', null, null,20, 1 )
insert into Transaction_master values (getdate(), 106, 'Br2', 'Cw', null, null,20, 1 )

Use INDIAN_BANK

-- InsteadOf Trigger -- PRE TRIGGER -- when bank gave that the condition: if the amnt is more than 50k, we should not process the Txn
create trigger High_Volumn_Txns
on Transaction_master
Instead of Insert, Update, Delete
as begin

	declare @Dateoftransaction	datetime
	declare	@Acid				int
	declare	@Brid				char(3)
	declare	@Transactiontype	char(3)
	declare	@ChqNo				int
	declare	@ChqDate			smalldatetime
	declare	@TransactionAmount	money
	declare	@UserId				int

-- get the customer info
	select @Dateoftransaction = [Dateoftransaction],@Acid = [Acid],@Brid=[Brid],@Transactiontype = [Transactiontype],@ChqNo=[ChqNo], 
			@ChqDate=[ChqDate],@TransactionAmount=[TransactionAmount],@UserId=[UserId]
	from inserted
-- Condition
if (@TransactionAmount > 50000)
	insert into HTM values (@Dateoftransaction,@Acid,@Brid,@Transactiontype,@ChqNo, 
			@ChqDate,@TransactionAmount,@UserId)
else 
	insert into Transaction_master values (@Dateoftransaction,@Acid,@Brid,@Transactiontype,@ChqNo, 
			@ChqDate,@TransactionAmount,@UserId)
end

-- creating an table with already defined datatypes
select * into HTM from Transaction_master where 1 = 2

select * from Transaction_master
select * from HTM

insert into Transaction_master values (getdate(), 101, 'Br2', 'CD', null, null,20000000, 1 )

-- drop trigger
drop trigger <Triggername>

-- We can also disable the triggers and check constraints
alter table <Tablename>
enable/disable trigger <triggername>

/*
CURSORS	
Need		-	can update the data
Types		-	Server side
Direction	-	Forward, Scrollable, Fastforward
Visibility	-	Static, key set driven, Dynamic
*/

SELECT * from Account_master where Acid = 101
-- in the above query we can only view the data, but cant edit..
-- in cursors we can edit the data

--Cursor Syntax
declare Abc cursor for
select * from Account_master 

open Abc 
fetch next from Abc

while @@FETCH_STATUS=0
fetch next from Abc

close Abc
deallocate Abc

--Scrolling cursor
Declare ABCD cursor Scroll for
select * from Account_master

open ABCD

--Fetch the last row in the cursor
Fetch last from ABCD

--Fetch the row immediately prior to the current row in the cursor
Fetch prior from ABCD

--Fetch the Second row in the cursor
Fetch Absolute 2 from ABCD

--Fetch the row that is 3 rows after the current row
Fetch Relative 3 from ABCD

--Fetch the row that is 2 rows prior to the current row
Fetch Relative -2 from ABCD

Close ABCD
deallocate ABCD

-- To know the Cursor open/close state -- it should be in the same window to execute
If CURSOR_STATUS('global', 'ABCD') >=-1
Begin 
	print 'The Above cursor is in Open State'
End

-- Static Cursor - Read Only
declare Abc cursor Forward_only Static 
for
select * 
from Account_master 

open Abc 
fetch next from Abc

while @@FETCH_STATUS=0
fetch next from Abc

close Abc
deallocate Abc

-- Static with Scroll
declare Abc cursor Scroll Static 
for
select * 
from Account_master 

open Abc 
fetch next from Abc

fetch Last from Abc

close Abc
deallocate Abc

--STATIC WITH UPDATE -- we cant update using the static cursor - Its only Read only

-- KEYSET-DRIVEN CURSORS
-- Only the key columns are copied in the tempdb and it uses less space
-- Insertions by others we cant see
declare Abc cursor Scroll Keyset 
for
select * 
from Account_master 

open Abc 
fetch next from Abc

While @@FETCH_STATUS=0
fetch Next from Abc

close Abc
deallocate Abc

--DYNAMIC Cursors:
-- No tempDB space and very costly
-- Faster than all the cursors
declare Abc cursor Dynamic 
for
select * 
from Account_master 

open Abc 
fetch next from Abc

Fetch prior from ABC

Update Account_master
set Name = 'Nikhil Mettapally'
where current of Abc

Delete from Account_master
where current of Abc

close Abc
deallocate Abc

-- We cant Insert the data using CURSORS, we can update, delete and view the data
-- Cursors are important for looping the data
-- cant use the cursors on 1 Gb data and bigger
-- they are performance wise bad
-- only for small amount of data.

-- Linked Server/Remote Server
-- When we want to get the data from the other Database without choosing the other one
use INDIAN_BANK

select * from Acheiver.[dbo].[Example]

--or

select * from Acheiver..[Example]

select * from [School]..[CourseMaster]

-- we can only put .. when we have 'dbo'
-- Why schemas?
-- to provide the security to the tables
-- we can separate the tables to access
-- we can give logins to the new users
-- Read the data from another db: within server
Select * from dbname.schema.tablename

/*
LINKED SERVER:
when one server is in India and one in USA we need to use LS
SYNTAX: another server
Select *
from Servername.DBName.Schemaname.Tablename
*/

/*
Creating an Linked Server:
Go to Linked Servers on the left panel and create it
*/

Select * from Account_master

-- How can i find out the same clearbalance of the Acid's

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

/*
All languages and Client apps or Front end Apps are developed by Python, Java, Angular JS-...
Oracle, SQL server and My SQl these are backened as databse apps....
1 server many clients
EX: in Amazon website when we search for the shirts, we write the query in the front end and 
the query runs in backened
To centralise the code:
1. View
2. SP
3. Functions
*/

-- Creating a View
create view vw_getmybalance
as
select * 
from Account_master
where acid = 122

-- to centralise the data - Tables
-- We shouldnt give the data to client aplication, we need to give the View, so that the data wont be exposed.
-- The middlesmens are created and between the client and database, the MM are View, SP, function

-- persons who did not do the Txns for the last 6 months

Select Acid 
from Account_master
where acid not in	(
					Select distinct acid
					from Transaction_master 
					where datediff(mm, Dateoftransaction, GETDATE()) <=6
					)
-- we cant only write one query in view and not an update statements

--Calling a view
Select * from vw_getmybalance
-- if we need to implement more than 1, we need to use SP's
-- Multiple queries in single program - Use SP's
-- Creating an SP
create proc	usp_update_status
as
begin
	update Account_master
	set status = 'I'
	where acid in	(
					Select Acid 
					from Account_master
					where acid not in	(
										Select distinct acid
										from Transaction_master 
										where datediff(mm, Dateoftransaction, GETDATE()) <=6
										)
					)
end

select * from vw_getmybalance

-- see the code
sp_helptext 'vw_getmybalance'

-- altering the view
alter view vw_getmybalance  
as  
select *   
from Account_master  
where acid = 123

-- get all the view names
select count(*) from sys.tables
select count(*) from sys.views
--Views and functions can be used for joins

/* 
Limitations of VIEWS:
One single query is allowed
views are slow
no programming
no insert/update/delete
no parameters
it gets fresh data
*/

select * from vw_getmybalance

create view get_cstdata_br1
as 
select *
from Account_master
where brid = 'Br1'

select * from get_cstdata_br1

-- if we update the data the data in the views will also gets updated
-- View wont be storing the data anywhere,it is just like an another query

/*
View is an Virtual Table
Types of Views:
updatable Views(Read/Write) 
Non-updatable views(Read Only) 
*/

Use INDIAN_BANK

-- Non updatable views - and when we have the aggreagate functions also.
create view Name_CB
as
select Name, Clearbalance from Account_master

Select * from Name_CB

Insert into Name_CB values (200, 'Amaira', 'Regensburg', 'BR2', 'SB', getdate(), 13156, 54574, 'O')

-- Updatable Views
select * from get_cstdata_br1

Insert into get_cstdata_br1 values (199, 'Amaira', 'Regensburg', 'BR2', 'SB', getdate(), 13156, 54574, 'O')

update get_cstdata_br1
set Clearbalance = 45645
where Acid = 107

-- View is also an Virtual table

select * from Account_master

-- creating a view for the current year transactions
create view vw_current_year_txns as
-- current year
select * from Transaction_master where DATEDIFF(yy, Dateoftransaction, GETDATE()) = 0

-- last 2 quarters
select * from Transaction_master where DATEDIFF(qq, Dateoftransaction, GETDATE()) = 2

select * from vw_current_year_txns

-- joining a view and a table
select * 
from vw_current_year_txns as a join Account_master as b
on a.Acid = b.Acid

-- create a view with FD custs
create view vw_GetFdCustomers
as 
select * from Account_master
where Pid = 'FD'

-- create view on another view
create view vw_GetBR1FdCustomers
as
select * from vw_GetFdCustomers
where BRID = 'BR1'

select * from vw_GetFdCustomers
select * from vw_GetBR1FdCustomers

/*
WE CAN JOIN THE BELOW:
tables	-- tables 
tables	-- views
views	-- tables
view	-- view	-- table 
tables	-- udfs
udf		-- tables
view	-- udfs
udfs	-- views, tables
udfs	-- udfs

WE CANNOT JOIN THE BELOW:
SP cannot ve joined with tables, views, functions

if we create a view based on other view, if we drop the 1st one, we cant execute the 2nd one
when schema changes the views, SP's and functions wont work
NEVER CHANGE THE NAMES OF THE TABLES
When we use SCHEMABINDING, no one can modify the table and we need to include the SCHEMA
When we use ENCRYPTION, no one can view the syntax of the query
*/

create view vw_sb_customers
with encryption
as
select * from Account_master
where PID = 'SB'

sp_helptext vw_sb_customers

-- code is called the schema
-- to provide more security to end users and also to group and give to different dept users

create schema sales

create table sales.Emp
(
EID			int			not null		primary key,
NAME		varchar(10)	not null,
MID			int			null			
)

drop schema sales

-- if we want to give some permission to specific persons we need schemas
-- Views with Check Option
-- we cant modify the view data using Check option

create view Hyd_Employees
as
select * from Account_master
where Address = 'Hyderabad'
with check option

select * from Hyd_Employees

update Hyd_Employees
set Address = 'Pune'
where acid = 140

/*
MATERIALISED AND INDEXED VIEWS
INDEXED VIEWS: The queries are cached in RAM, no need to run the entire query all the time.
need to create with Schema binding
*/

CREATE VIEW vw_BranchBalanceSummary
WITH SCHEMABINDING
AS
SELECT
    Brid,
    COUNT_BIG(*) AS TotalAccounts,
    SUM(ClearBalance) AS TotalBalance
FROM dbo.Account_master
GROUP BY Brid;
GO

select * from vw_BranchBalanceSummary

use Indian_bank

/*
SQL		- DDL, DML, TCL, DCL commands
T-SQL	- Variables, If...Else, Loops, Try catch blocks
1. VARIABLES
- Purpose: To store the data in Ram and move the data from one place to another.
- Variables are declared in the memory/Ram, but not in SQL server/HDD
- There are 2 types of variables
-- LOCAL VARIABLES:
- They are created using '@' Symbol
- Removed when the connection is closed
- Whoever created them, they can only use, not others

SYNTAX
Declare		@<Variable Name>	<Data Type>

Ex: Declare @Salary INT
- @Salary is a variable, which is capable of storing an Integer
- variable can store only an single value

Declare
declare @x smallint

store
set @x = -1000

read
print = -x
or
select = x
******************************************/

-- T SQL Programming
declare @x int
declare @y int
declare @z  int

set @y = 30
set @x = 10
set @z = 60

-- set @z = @x + @y
print @x + @y + @z -- only as message 
-- Select @x + @y + @z as Total -- can view in table format

use indian_bank
-- Programming is RAM
-- Database is HDD
declare @x int
declare @y int
declare @z  int

set @y = 30
set @x = 10
set @z = 60

-- set @z = @x + @y
print 'TotalValue =' +cast (@z as Varchar) -- only as message 
Select @z as Total -- can view in table format

-- to create an program, we need to store in SP or Function
-- SP Syntax:
create proc <SpName>
(
		input,
		output parameters
)
as 
begin

	SQL
		DDL, DML, TCL, DCL

		Temp Table/Table
		create/drop

		call view/sp/function

	T-SQL 
		Programming
end

-- we can write either SQL or T-SQL in the SP

use indian_bank

-- We can use SP to centralise the code
create proc add_numbers
as
begin
	declare @x int
	declare @y int
	declare @z int
	set @x = 10
	set @y = 20
	set @z = @x+@y

print @z
end

-- calling an SP
exec add_numbers

use indian_bank
-- Alter SP
-- Input parameters are used to inteact with SP (we will supply the data) - not holding the data - data cant be changed
ALTER proc [dbo].[add_numbers]
(
	@x int,
	@y int
)
as
begin
	declare @z int
	set @z = @x+@y

print @z
end

exec add_numbers 6454564,6464

create proc multiply_numbers
(
	@x int,
	@y int
)
as 
begin
	declare @z int
	set @z = @x * @y

print @z
end

exec multiply_numbers 416, 16

-- Adding 500 to existing variable:
declare @x	money
set @x = 100
set @x = @x+500
print @x + 4564654
-- variables are not permanent after execution they get erased

-- Swapping 2 numbers:
declare @x int = 100
declare @y int = 200

print @x
print @y
-- Now swapping:
declare @z int

set @x = @y 
set @y = @x
set @z = @y

set @z = null

print @x
print @y
print @z


create proc	usp_GetTxns
(
		@acid	int
)
as
begin

		SELECT *
		FROM Account_master
		WHERE acid = @acid

		SELECT *
		FROM Transaction_master
		WHERE DATEDIFF(yy, Dateoftransaction, GETDATE()) = 1
		  AND acid = @acid

		SELECT Transactiontype,
			   COUNT(*) AS NoOfTxns
		FROM Transaction_master
		WHERE DATEDIFF(yy, Dateoftransaction, GETDATE()) = 1
		  AND acid = @acid
		GROUP BY Transactiontype
end

exec usp_GetTxns 105

-- SP is used for reusability
-- Modify the SP
alter proc	usp_GetTxns
(
		@acid	int,
		@Tenure	tinyint
)
as
begin

		SELECT *
		FROM Account_master
		WHERE acid = @acid

		SELECT *
		FROM Transaction_master
		WHERE DATEDIFF(yy, Dateoftransaction, GETDATE()) = @tenure
		  AND acid = @acid

		SELECT Transactiontype,
			   COUNT(*) AS NoOfTxns
		FROM Transaction_master
		WHERE DATEDIFF(yy, Dateoftransaction, GETDATE()) = @tenure
		  AND acid = @acid
		GROUP BY Transactiontype
end

exec usp_GetTxns 222, 50

--Get all Sp's
select * from sys.procedures

/*
GLOBAL VARIABLES:
- created by SQL server
- created using '@@' symbol
- Already declared with variables
- 'Read Only' Variables
- We can only print/select them
*/

-- version name
select @@version

-- server name
select @@SERVERNAME

-- errors
select  @@error

-- Rowcount
select * from Account_master
select @@rowcount

-- we can know how many commands are updated and all
select * from Account_master where Acid = 4156465
select @@rowcount

select @@FETCH_STATUS

-- Local variables are created by us for read and write, whereas Global are given By microsoft only for reading

-- Loop (To print 1000 numbers)
-- For Loop (SQL doesnt support this)
-- While Loop
-- Syntax:
-- 1. Initialise
-- 2. Condition
-- 3. Increment/decrement

declare @x int
set @x = 1

while (@x <=100)
begin

	print @x

	set @x = @x+1
end

-- we can create loops in SP, as views dont support Loops
create table tbl_nms 
(Id		Int)

select * from tbl_nms

-- create SP and insert 100 Nos
alter proc usp_Printnumbers
as 
begin
	declare @x int
	set @x = 1

	while (@x <=100)
	begin
		
		-- Action
		Print @x
		insert into tbl_nms values (@x)   

		-- Incr
		set @x = @x+1
	end
end

exec usp_Printnumbers

-- Assignment
-- Write a loop to Insert odd numbers in table (below 500)
	declare @x	int
	set @x = 1

	while (@x<=500)
	begin

		print @x 

		set @x = @x+2
	end

-- Write a loop to Insert Even numbers in table (below 1000)
	declare @x	int
	set @x = 2

	while (@x<=1000)
	begin

		print @x 

		set @x = @x+2
	end

alter proc usp_Printnumbers
(
		@starting_value		int,
		@upper_limit		int
		
)
as 
begin

		-- Delete all rows
		Truncate table tbl_nms
	
		while (@starting_value <= @upper_limit)
		begin
		
		-- Action
		insert into tbl_nms values (@starting_value)   

		-- Incr
		set @starting_value = @starting_value + 1
		end
end

		-- Displaying the data
		select * from tbl_nms

exec usp_Printnumbers 30 , 32

/*
TEMP TABLE AND TABLE VARIABLE
--Temp Tables
--There are 2 types of Temp Tables.
--------------------------------

1) Local Temp Table:
--It is created using # symbol.
--It is available to the user, who created it
--It is deleted when the user close the session
--These tables are created in TempDB database.

CREATE TABLE #Emp
(
    EID     INT       PRIMARY KEY,
    NAME    CHAR(10)  NOT NULL,
    GENDER  CHAR(1)   NOT NULL
)

Select * from #Emp

insert into #Emp values (1, 'Nikhil', 'M')
insert into #Emp values (2, 'Snehu', 'F')

--Manually drop the table
DROP TABLE #Emp

--When we close the connection, then sql server automatically
--drops the temp tables

--Global Temp Tables
----------------------------------------
--It is created using ## symbol.
--It is available to all users
--It is deleted when all the users close their sessions/Connections
--These tables are created in TempDB database.

CREATE TABLE ##Emp
(
    EID      INT       PRIMARY KEY,
    NAME     CHAR(10)  NOT NULL,
    GENDER   CHAR(1)   NOT NULL
)

INSERT INTO ##Emp VALUES (1, 'Bhaskar', 'M')
INSERT INTO ##Emp VALUES (2, 'Kavitha', 'F')

select * from ##Emp

To operate the Global Temp, the main createor should bve there.

- Table Variable (one time usage)
-- Normal variables takes the space in RAM
-- Storing a table inside a variable is Table variable
Table Variable is allocated in TempDB

declare @x table
(
	eid			int			primary key,
	name		varchar(50)
)

insert into @x values (1, 'Nikhil')

select * from @x

TEMPDB AND TABLE VARIABLE
- Temp table (#) after execution is available (multiple usage) - large data
- Table variable is gone after execution - small data
- cant drop the table variable
*/

select * from Account_master

-- assignment
-- Display all customers whose balance is greater than the average account balance.
select * 
from Account_master
where Clearbalance > 
(
	select Avg(Clearbalance)
	from Account_master
)

/*
Categorize customers based on their balance.
Less than 5,000 → Silver
5,000 – 10,000 → Gold
Above 10,000 → Platinum
*/
SELECT
    Acid,
    Name,
    ClearBalance,
    case
        WHEN ClearBalance < 5000 THEN 'Silver'
        WHEN ClearBalance BETWEEN 5000 AND 10000 THEN 'Gold'
        ELSE 'Platinum'
	end
FROM Account_master;

-- Debugging a SP
ALTER PROC usp_Printnumbers
(
    @starting_value INT,
    @upper_limit INT
)
AS
BEGIN

    BEGIN TRY

        -- Delete all rows
        TRUNCATE TABLE tbl_nms;

        WHILE (@starting_value <= @upper_limit)
        BEGIN

            -- Action
            INSERT INTO tbl_nms
            VALUES (@starting_value);

            -- Increment
            SET @starting_value = @starting_value + 1;

        END

        -- Display the data
        SELECT * FROM tbl_nms;

    END TRY

    BEGIN CATCH

        SELECT
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage,
            ERROR_LINE() AS ErrorLine,
            ERROR_PROCEDURE() AS ProcedureName,
            ERROR_SEVERITY() AS Severity,
            ERROR_STATE() AS State;

    END CATCH

END;

exec usp_Printnumbers 222, 2222

INSERT INTO tbl_nms VALUES ('ABC');

-- OUTPUT PARAMETERS IN SP
Use INDIAN_BANK

alter proc Get_CstInformation
(
		@acid			int,
		@CustName		varchar(40)		out,
		@Balance		money			out
)
as 
begin
		if exists (select * from Account_master where acid = @acid)
					select @CustName = Name, @Balance = Clearbalance from Account_master where acid = @acid
		else
			print ' Acid Invalid'
end

declare @Name			varchar(40)
declare @Clearbalance	money
exec Get_CstInformation 101, @Name out, @Clearbalance out
print @Name
print @Clearbalance

sp_help 'dbo.Get_CstInformation'

-- Exception/Error Handling
-- Error occurs at runtime is Exception
use indian_bank
select * from Account_master
go
select @@ERROR as Result

select * from Account_masteer
go
select @@ERROR as Result

/*
Return Statement
It tell twhether the query successfully executed or not
if everything is correct it will return 0, if not Non-Zero
Cons:
Too Much of Code
Difficult
*/
/*
new syntax - try and catch block:
when there is error they will catch the error
begin try
end try
begin catch
end catch
*/

alter proc usp_Divide2Nums
(
		@x	int,
		@y	int
)
as 
begin
begin Try
		declare @z int

		Set	@z = @x/@y
		print @z

		return 0 -- Success
end try
Begin catch
		insert into SQL_Logs
		select	ERROR_LINE()		as Err_Line,
				Error_message()		as Err_message,
				ERROR_NUMBER()		as Err_num,
				ERROR_PROCEDURE()	as Err_SPName,
				GETDATE()			as Err_DateTime,
				ERROR_SEVERITY()	as Err_Sev,
				ERROR_STATE()		as Err_State
				
		Return 1 -- fail
end catch
end

exec	usp_Divide2Nums   50,0

CREATE TABLE SQL_Logs
(
    ID           INT			IDENTITY,
    Err_Line     INT			NOT NULL,
    Err_Message  VARCHAR(MAX)	NOT NULL,
    Err_Num      INT			NOT NULL,
    Err_SPName   VARCHAR(100)	NOT NULL,
    Err_DateTime DATETIME		NOT NULL,
    Err_Sev      INT			NULL,
    Err_State    INT			NULL
);

select * from SQL_Logs

-- Input or Output - to give data to client applications
alter proc usp_GetCustomers
(
	@brid char(3) = 'BR4' -- we can give an default value, so that after execution user gets only these data
)
as
begin
	select * from Account_master where brid = @brid
end

exec usp_GetCustomers 'BR2'

-- inside the ram all the parameters are stored.
-- we need to give correct data type for parameters.
/*
Stored Procedure Recompilation
* Learned the purpose of recompiling stored procedures for updated execution plans
* Improved query optimization when underlying data distribution changes
* Reduced performance issues caused by outdated cached execution plans
* Explored recompilation techniques for dynamic and parameter-sensitive queries

Recompilation Benefits:
* Generates a new execution plan during execution
* Optimizes performance after significant data changes
* Resolves parameter sniffing issues
* Useful for procedures with varying input patterns
*/

/*
Syntax:
create proc sp1 
with recompile
as
begin

.......
end
go

end
*/

/*
When SP is Slow, recompile it
in recompile the cached data gets deleted
after recompile if still its slow, we need to check which query is making the SP slow
*/

/*
TYPES OF SP'S
- User Defined 
- System Defined
- Extended 
- CLR(.NET) - Common Language Runtime
*/

ALTER PROC usp_CheckBalance
(
    @Acid INT
)
AS
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM Account_master
        WHERE Acid = @Acid
    )
    BEGIN
        SELECT *
        FROM Account_master
        WHERE Acid = @Acid;
    END
    ELSE
    BEGIN
        PRINT 'Invalid Account ID';
    END
END;

EXEC usp_CheckBalance 101;
EXEC usp_CheckBalance 999;

-- BREAK & CONTINUE in WHILE Loops
DECLARE @x INT = 1;

WHILE (@x <= 10)
BEGIN

    IF (@x = 6)
        BREAK;

    PRINT @x;

    SET @x = @x + 1;
END;