Use INDIAN_BANK

--Joins
select * 
from Account_master inner join Transaction_master
	on Account_master.Acid = Transaction_master.Acid

--We dont need to use the entire table name, rather we can set Alias as T or A Anything
select * 
from Account_master A inner join Transaction_master T
	on A.Acid = T.Acid

	select * 
from Account_master A inner join Transaction_master T
	on A.BRID = T.Brid	

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

--Equijoin with Acid and BranchID
Select * 
from Account_master, Transaction_master
where Account_master.Acid = Transaction_master.Acid

Select * 
from Account_master, Transaction_master
where Account_master.BRID = Transaction_master.Brid

--Left outer join
Select Name, PID, Address 
from Account_master left outer join Transaction_master
on Account_master.BRID = Transaction_master.Brid

Select *
from Account_master left outer join Transaction_master
on Account_master.BRID = Transaction_master.Brid
--Or
Select *
from Account_master left join Transaction_master
on Account_master.BRID = Transaction_master.Brid

--Right Join
Select *
from Account_master Right join Transaction_master
on Account_master.BRID = Transaction_master.Brid

--Full Join
Select *
from Account_master Full join Transaction_master
on Account_master.BRID = Transaction_master.Brid

--Purely unmatched data - left join unmatached data
Select *
from Account_master left join Transaction_master
on Account_master.Acid = Transaction_master.Acid
where Transaction_master.Acid is Null

--Who did not do any transaction
Select Account_master.Acid, Address, Name
from Account_master left join Transaction_master
on Account_master.Acid = Transaction_master.Acid
where ChqNo is Null

Select count(*) Cnt
from Account_master left join Transaction_master
on Account_master.Acid = Transaction_master.Acid
where ChqNo is Null

Select Account_master.BRID, COUNT(*) as Cnt
from Account_master left join Transaction_master
	on Account_master.Acid = Transaction_master.Acid
where ChqNo is Null
group by Account_master.BRID

--Cross join
select * from Account_master AM, Transaction_master TM, Transaction_master TTM

select * from Account_master AM, Transaction_master TM, Transaction_master TTM, Transaction_master TTTM

-- SELF REFERENTIAL TABLE

CREATE TABLE EMP
(
    EID			INT					PRIMARY KEY,
    NAME		VARCHAR(10)			NOT NULL,
    MID			INT NULL			FOREIGN KEY REFERENCES EMP(EID)
);

INSERT INTO EMP VALUES (1, 'Ranga', NULL);
INSERT INTO EMP VALUES (2, 'Thyagu', 1);
INSERT INTO EMP VALUES (3, 'Ravi', 1);
INSERT INTO EMP VALUES (4, 'Shilpa', 2);
INSERT INTO EMP VALUES (5, 'Krishna', 3)

Select * from EMP

Select * 
from EMP E1 inner join EMP E2
	on E2.Eid = E1.Mid

Select E1.EID, E1.NAME as EmpName, E2.NAME as ManagerName 
from EMP E1 right join EMP E2
	on E2.Eid = E1.Mid

Select E1.EID, E1.NAME as EmpName, E2.NAME as ManagerName 
from EMP E1 left join EMP E2
	on E2.Eid = E1.Mid

Select E1.EID, E1.NAME as EmpName, E2.NAME as ManagerName 
from EMP as E1, EMP as E2

