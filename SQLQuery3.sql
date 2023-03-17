--Creating detabase
create database task3
use task3

--Creating Department table
create table DEPARTMENT(
	DEPTID int primary key,
	DEPARTMENT varchar(15),
)

--inserting values into Department
insert into DEPARTMENT values(100,'DEVELOPER'),(101,'UI/UX')
 
 --Creating Address Table
create table ADDRESS(
	ADDRESSID int primary key,
	CITY char(10),
	STATE varchar(20),
	PINCODE int
)

--inserting values to Address
insert into ADDRESS values(1,'MANFORD','OKLAHOME(OK)',678001),(2,'SIDNEY','OHIO(OH)',678002)

--
create table Employee(
	ID int primary key,
	NAME varchar(20) not null,
	DESIGNATION varchar(10),
	DEPID int not null references DEPARTMENT(DEPTID),
	MOBILE1 decimal,
	MOBILE2 decimal,
	STRESS_ADDRESS char(30),
	ADDRESSID int references ADDRESS(ADDRESSID)
)

insert into Employee values(1,'JOHN','DEVELOPER',100,9885798859,6321123656,'234 Hinton Rd',1)
insert into Employee(ID,NAME,DESIGNATION,DEPID,MOBILE1,STRESS_ADDRESS,ADDRESSID) values(2,'JAMIE','DESIGNER',101,7885798857,'214 DOUNTY Rd',2)
insert into Employee values(3,'JACK','DEVELOPER',100,7885798857,4321123654,'236 Hinton Rd',1)

select * from Employee
select * from ADDRESS
select * from DEPARTMENT

