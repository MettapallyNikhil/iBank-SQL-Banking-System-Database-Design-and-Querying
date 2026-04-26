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
