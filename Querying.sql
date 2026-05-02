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
