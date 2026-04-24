/**********************************************
Name	: INDIAN BANK DB
Author	: Nikhil Mettapally
Date	: April 16, 2026

Purpose	: This script will create db and few table in it to store info about INDIAN BANK
**********************************************/
use master

use INDIAN_BANK

create database INDIAN_BANK

create table Product_master
(
PID				Char(2)				Primary key,
ProductName		Varchar(25)			Not Null 
)

select * from Product_master

insert into Product_master values('SB','Savings Bank')
insert into Product_master values('LA','Loan Account')
insert into Product_master values('FD','Fixed Deposit')
insert into Product_master values('RD','Recurring Deposit')

create table Region_master
(
RID				Integer			Primary key,
Region_name		char(6)			Not Null 
)

select * from Region_master

insert into Region_master values(1,'South')
insert into Region_master values(2,'West')
insert into Region_master values(3,'East')
insert into Region_master values(4,'North')

create table Branch_master
(
BRID			char(3)				Primary key,
Branch_name		varchar(6)			Not Null,
Branch_address	varchar(50)			Not null,
RID				Integer				Not null		Foreign key	references Region_master (RID)	
)

select * from Branch_master

insert into Branch_master values('BR1','Goa','Near KLM Mall',2)
insert into Branch_master values('BR2','Hyd','DSNR',1)
insert into Branch_master values('BR3','MH','Pune',3)
insert into Branch_master values('BR4','Delhi','Delhi',4)
insert into Branch_master values('BR5','Pondi','Beach',2)
insert into Branch_master values('BR6','TN','Temple Street',1)
insert into Branch_master values('BR7','Guj','Near Statue',3)
insert into Branch_master values('BR8','Kol','Mahankali Temple',4)
insert into Branch_master values('BR9','Raj','Palace Road',4)

create table User_master
(
Userid			Int					Primary key,
Username		varchar(30)			Not Null,
Designation		char(1)				Not Null check (Designation in ('M','C','T','O'))
)

select * from User_master

insert into User_master values(1,'Nikhil','M')
insert into User_master values(2,'Snehal','M')
insert into User_master values(3,'Rohit','O')
insert into User_master values(4,'John','T')
insert into User_master values(5,'Someone','C')

create table Account_master
(
Acid			Int					Primary key,
Name			varchar(40)			Not Null,
Address			varchar(50)			Not Null,
BRID			char(3)				Not null		Foreign key references Branch_master(BRID),
PID				char(2)				Not null		Foreign key references Product_master(PID),
Dateofopening	Datetime			not null,
Clearbalance	Money				null,
Unclearbalance	Money				Null,
Status			Char(1)				not null		check (Status in ('O','I','C')) 
)

select * from Account_master

insert into Account_master values (101,'Snehal', 'Pune', 'BR2', 'SB', '2026/04/16', 1000, 1000, 'O')
insert into Account_master values (102,'Nikhil', 'Hyd', 'BR1', 'FD', '2026/04/15', 1050, 1050, 'O')
insert into Account_master values (103,'Nihal', 'Deu', 'BR4', 'RD', '2026/04/01', 1040, 1000, 'O')
insert into Account_master 
values
(104,'Nihal', 'dam', 'BR3', 'SB', '2026/03/01', 10040, 10800, 'I'),
(105,'Nihil', 'mal', 'BR4', 'LA', '2026/02/01', 10400, 15000, 'O'),
(106,'Nihöl', 'hyd', 'BR2', 'SB', '2026/01/01', 22040, 10500, 'C'),
(107,'Nihul', 'Cha', 'BR1', 'FD', '2026/05/01', 10040, 10200, 'O'),
(108,'Nihel', 'Mum', 'BR2', 'RD', '2026/08/01', 10240, 10200, 'C'),
(109,'Nihol', 'Del', 'BR3', 'FD', '2026/01/01', 10840, 10000, 'O')

create table Transaction_master
(
TransactionNumber				Int						Primary key	Identity(1,1),
Dateoftransaction				Datetime				Not Null,
Acid							Int						Not Null	Foreign key references Account_master(Acid),
Brid							char(3)					Not null	Foreign key references Branch_master(BRID),
Transactiontype					char(3)					Not null	check (Transactiontype in ('CW','CD','CQD')),
ChqNo							Int						Null,
ChqDate							Int						Null,
TransactionAmount				Money					Not Null,
UserId							Int						Not null	Foreign key references User_master(UserId)
)

ALTER TABLE Transaction_master
ALTER COLUMN ChqDate SMALLDATETIME;

ALTER TABLE Transaction_master
Add check (TransactionAmount>=0);

Truncate table Transaction_master

select * from Transaction_master

insert into Transaction_master  values ('2026-04-15', 101, 'BR2', 'CD', 12345, '2026-04-13', 10000, 1)
INSERT INTO Transaction_master 
VALUES
('2023-01-15', 101, 'BR1', 'CD', 12345, '2023-01-14', 5000, 1)
insert into Transaction_master  values ('2024-03-22', 102, 'BR2', 'CW', NULL, NULL, 1200, 2)
insert into Transaction_master  
values
('2025-07-10', 103, 'BR3', 'CQD', 22331, '2025-07-09', 7800, 3),
('2022-11-05', 104, 'BR4', 'CD', 34567, '2022-11-04', 6400, 4),
('2026-02-18', 105, 'BR5', 'CW', NULL, NULL, 1500, 1),
('2023-06-12', 106, 'BR6', 'CQD', 11223, '2023-06-11', 9100, 2),
('2024-09-25', 107, 'BR7', 'CD', 55678, '2024-09-24', 3000, 3),
('2025-01-30', 108, 'BR8', 'CW', NULL, NULL, 2200, 4),
('2022-04-17', 109, 'BR9', 'CQD', 99887, '2022-04-16', 8700, 1),
('2026-08-09', 101, 'BR2', 'CD', 66778, '2026-08-08', 4500, 2),
('2023-12-01', 102, 'BR3', 'CW', NULL, NULL, 1800, 3),
('2024-05-19', 103, 'BR4', 'CQD', 44556, '2024-05-18', 7600, 4),
('2025-10-11', 104, 'BR5', 'CD', 77889, '2025-10-10', 8200, 1),
('2022-07-07', 105, 'BR6', 'CW', NULL, NULL, 900, 2),
('2026-03-03', 106, 'BR7', 'CQD', 33445, '2026-03-02', 6100, 3),
('2023-08-21', 107, 'BR8', 'CD', 55667, '2023-08-20', 4300, 4),
('2024-11-29', 108, 'BR9', 'CW', NULL, NULL, 2750, 1),
('2025-02-14', 109, 'BR1', 'CQD', 66779, '2025-02-13', 9900, 2),
('2022-09-09', 101, 'BR2', 'CD', 88990, '2022-09-08', 5400, 3),
('2026-06-27', 102, 'BR3', 'CW', NULL, NULL, 2100, 4),
('2023-10-05', 103, 'BR4', 'CQD', 22345, '2023-10-04', 8800, 1),
('2024-01-16', 104, 'BR5', 'CD', 33456, '2024-01-15', 7300, 2),
('2025-04-28', 105, 'BR6', 'CW', NULL, NULL, 1600, 3),
('2022-12-19', 106, 'BR7', 'CQD', 44567, '2022-12-18', 9200, 4),
('2026-09-30', 107, 'BR8', 'CD', 55678, '2026-09-29', 6100, 1),
('2023-02-11', 108, 'BR9', 'CW', NULL, NULL, 1950, 2),
('2024-06-06', 109, 'BR1', 'CQD', 66789, '2024-06-05', 8700, 3),
('2025-08-18', 101, 'BR2', 'CD', 77890, '2025-08-17', 4200, 4),
('2022-03-25', 102, 'BR3', 'CW', NULL, NULL, 1350, 1),
('2026-12-12', 103, 'BR4', 'CQD', 88901, '2026-12-11', 9500, 2),
('2023-05-01', 104, 'BR5', 'CD', 11111, '2023-04-30', 6000, 3),
('2024-07-14', 105, 'BR6', 'CW', NULL, NULL, 2500, 4),
('2025-11-22', 106, 'BR7', 'CQD', 22222, '2025-11-21', 8300, 1),
('2022-06-10', 107, 'BR8', 'CD', 33333, '2022-06-09', 4700, 2),
('2026-01-19', 108, 'BR9', 'CW', NULL, NULL, 1400, 3),
('2023-09-08', 109, 'BR1', 'CQD', 44444, '2023-09-07', 9100, 4),
('2024-02-02', 101, 'BR2', 'CD', 55555, '2024-02-01', 5200, 1),
('2025-06-15', 102, 'BR3', 'CW', NULL, NULL, 1800, 2),
('2022-10-23', 103, 'BR4', 'CQD', 66666, '2022-10-22', 7700, 3),
('2026-04-04', 104, 'BR5', 'CD', 77777, '2026-04-03', 6900, 4),
('2023-11-17', 105, 'BR6', 'CW', NULL, NULL, 1600, 1),
('2024-08-30', 106, 'BR7', 'CQD', 88888, '2024-08-29', 9800, 2),
('2025-03-09', 107, 'BR8', 'CD', 99999, '2025-03-08', 5500, 3),
('2022-01-28', 108, 'BR9', 'CW', NULL, NULL, 2100, 4),
('2026-07-13', 109, 'BR1', 'CQD', 10101, '2026-07-12', 8600, 1),
('2023-04-20', 101, 'BR2', 'CD', 20202, '2023-04-19', 7100, 2),
('2024-10-10', 102, 'BR3', 'CW', NULL, NULL, 1900, 3),
('2025-09-25', 103, 'BR4', 'CQD', 30303, '2025-09-24', 9400, 4),
('2022-05-05', 104, 'BR5', 'CD', 40404, '2022-05-04', 6300, 1),
('2026-11-11', 105, 'BR6', 'CW', NULL, NULL, 1700, 2)

sp_help Transaction_master