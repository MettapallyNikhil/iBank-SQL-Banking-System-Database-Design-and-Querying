Use INDIAN_BANK

--Joins
select * 
from Account_master inner join Transaction_master
	on Account_master.Acid = Transaction_master.Acid

select * 
from Account_master A inner join Transaction_master T
	on A.Acid = T.Acid

select Name, PID, Dateofopening
from Account_master A inner join Transaction_master T
	on A.Acid = T.Acid
where PID = 'SB'

select Name, PID, Dateofopening
from Account_master A inner join Transaction_master T
	on A.Acid = T.Acid

select Name, Address, ProductName
from Account_master	A inner join Product_master P
	on A.PID = P. PID

select name, Transactiontype, count(*) as cnt
from Account_master AM join Transaction_master TM
on AM.ACID = TM.ACID
group by Name, Transactiontype

select * 
from Transaction_master

Select Name, ProductName
from Account_master AM join Transaction_master TM
on AM.Acid = TM.Acid
join Product_master PM
on AM.PID = PM.PID
where Transactiontype= 'CD'

