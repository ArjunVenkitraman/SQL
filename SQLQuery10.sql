create database task10
use task10


create table training
(
e_id int,
fname varchar(20),
lname varchar(20),
email varchar(20),
pno bigint,
hire_date date,
jobid int,
salary int
)

insert into training values
(101,'ranita','nagarajan','ranita@gmail.com',9089767548,'2022-05-20',1,20000),
(102,'harita','nagarajan','harita@gmail.com',2453789103,'2022-05-20',2,20000),
(103,'hari','karthic','hari@gmail.com',3545287193,'2022-05-20',3,30000),
(104,'selva','ganapathi','selva@gmail.com',2348965402,'2022-05-20',4,40378),
(105,'arun','karthi','arun@gmail.com',4578653234,'2022-05-20',5,32456),
(106,'harshan','harsha','harshan@gmail.com',3564718934,'2022-05-20',6,40000),
(107,'sharon','david','sharon@gmail.com',9890987890,'2022-05-20',7,23000),
(108,'harish','mitha','harish@gmail.com',5454673850,'2022-05-20',8,55000),
(109,'yamini','priya','yamini@gmail.com',34345264357,'2022-05-20',9,80000),
(110,'vikram','vik','vikram@gmail.com',3489876780,'2022-05-20',10,30000),
(111,'vikhi','vignesh','vikhi@gmail.com',2313245231,'2022-05-20',11,20000),
(112,'dharshan','shan','dharshan@gmail.com',3409675420,'2022-05-20',12,30000),
(113,'vasanth','vasan','vasanth@gmail.com',25674892037,'2022-05-20',13,40000),
(114,'karthic','kumar','karthic@gmail.com',5627649098,'2022-05-20',14,20000),
(115,'divya','prakash','dhivya@gmail.com',2343156534,'2022-05-20',15,55000),
(116,'arjun','venkit','arjun2gmail.com',2341564589,'2022-05-20',16,35000),
(117,'hemanth','hema','hema@gmail.com',3450987656,'2022-05-20',17,10000),
(118,'dhana','prakash','dhana@gmail.com',9098789098,'2022-05-20',18,80000),
(119,'siva','barath','siva@gmail.com',3450984567,'2022-05-20',19,60000),
(120,'srikanth','sri','sri@gmail.com',3450984509,'2022-05-20',20,65000)

select * from training

--1. Write a SQL query to find those employees who receive a higher salary than the employee with ID 16. Return first name, last name.
select fname,lname,salary from training
where salary >
(select salary from training where jobid=16)

--2. Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 11. Return first name, last name, job ID.
select fname,lname,jobid,hire_date from training
where hire_date = 
(select hire_date from training where jobid=11)

--3. Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.
select s.fname,s.lname,s.jobid from 
(select avg(salary) as averagesalary from training)as s1,training as s
where s.salary>s1.averagesalary;

create table Manager(
	e_id int,
	fname varchar(20),
	lname varchar(20),
	salary int
)
insert into Manager values (101,'Yamini','priya',50000),(102,'Bechambour','rues',60000),(103,'James','Rodriguz',70000)
--4. Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary.
--select t.fname,t.lname,t.jobid,t.salary,emp_id=(select e_id from Manager m where m.e_id=t.e_id)from 
--(select fname from manager)
--where m.fname='Yamini';

--select fname,lname,salary,e_id from training where (select fname from Manager where fname='Yamini')

----4. Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary.
select fname,lname,jobid,salary from training where fname=(select fname from training where fname='Yamini')

SELECT fname,lname,jobid,salary,e_id,manager
FROM training
WHERE e_id in
(SELECT e_id FROM Manager WHERE fname in ('Yamini'))
select * from training
select * from Manager

--5. Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.
select * from 
(select min(salary) as minimum from training)as t1,training as t
where t.salary between 2500 and t1.minimum

update training set salary=7000 where e_id=116

--sample
alter table training add manager varchar(20)
select * from training
select * from Manager

update training set manager='Yamini' where e_id between 101 and 105
update training set manager='Ranita' where e_id between 106 and 110
update training set manager='Harita' where e_id between 111 and 115
update training set manager='Harishmitha' where e_id between 116 and 120