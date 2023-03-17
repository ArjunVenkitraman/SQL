--creating database
create database task2
use task2

--create schema
create schema employee

--creating table 
create table employee.details(
  ID int primary key,
  ename char(20)unique not null,
  eage int check(eage>18),
  department char(20) default 'trainee',

)
--inserting values (primary key,unique key,not null,default,check constraints)
insert into employee.details(ID,ename,eage) values(101,'John',20)
select * from employee.details
insert into employee.details values(102,'Baby',20,'HR') 
insert into employee.details values(103,'Johnny',25,'Developer')
insert into employee.details values(104,'Henry',19,'Tester')
insert into employee.details(ID,ename,eage) values(105,'Ben',24)
select * from employee.details

--Renaming  database
alter database task2 modify name=Task_2

--Renaming table
exec sp_rename 'employee.details','emp_details' 

--Renaming Schema
create schema emp
alter schema emp transfer employee.emp_details

--Droping old schema
drop schema employee

 --3)creating new table 
 create table players1(
  ID int identity(1,1),
  ename char(20)unique not null,
  salary int,
  increment int
)

--inserting values into table
 insert into players1 values('Ben',25000,2000) 
 insert into players1 values('Parker',28000,1000)
 insert into players1 values('Peter',39000,1000)
 insert into players1 values('Haaland',23000,2000)
 insert into players1 values('Mee',13000,2000)

 select * from players1

 --computed column
 alter table players1 add revised_salary as (salary+increment) 

 --creating new table and inserting records from another table
 select * into fbplayers from players1 where salary>20000

 select * from fbplayers