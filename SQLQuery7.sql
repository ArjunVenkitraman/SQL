create database task7
use task7

create table Students(
	studentid int primary key identity(1,1),
	stu_name char(20),
	department char(20),
	score int
)
insert into Students(stu_name, department, score) values
('Ajay','BCA',87),
('Haarika','B.COM PA',85),
('Madhu','B.SC CS',87),
('Iniyan','BCA',75),
('Zoya','B.SC CS',95),
('Dhee','BCA',94),
('Naren','BCA',94),
('Shreya','B.COM PA',92),
('Elango','B.SC CS',85),
('Karthika','B.SC IT',97),
('Francis','B.COM IT',92),
('Umran','B.SC CS',77),
('Calvin','B.COM PA',90),
('Gayathri','B.SC CS',80),
('Xavier','B.SC IT',78),
('Jagan','B.COM IT',81),
('Bharti','B.SC IT',83),
('Logesh','B.COM PA',85),
('Vichu','BCA',78),
('Pragya','B.SC CS',75),
('Walter','B.COM IT',86),
('Ravin','BCA',80),
('Tanya','B.COM IT',95),
('Sam','B.SC IT',90),
('Yazmin','BCA',84)

--select
select * from Students

--1)Create a non-clustered index for department.
create index dep on Students(department);

--2)Create a filtered index for department='BCA'
create nonclustered index stu_dept on Students(department)where department='BCA' 

--3)Create a view for students in BCA department.
create view BCA_view
as
select * from Students where department='BCA'

select * from BCA_view 

--4)Apply Rank() for all the students based on score.
select score, 
rank () over (order by score desc) as Ranking_Score
from Students

--5) Apply Dense_Rank() for students in each department based on score.
select score,
dense_rank() over (order by score desc) as Rank_score
from Students

create table Manager(
	id int primary key,
	name char(20)
)

insert into Manager values(1,'Superman'),(2,'Batman'),(3,'Spiderman'),(4,'Sandman')

select * from Manager

create table Employee(
	eid int primary key,
	ename char(20),
	mid int references Manager(id) default 5,
	department char(10)
)

insert into Employee values(1,'Gavi',1,'Football'),(2,'Henderson',2,'Cricket'),(3,'Spinnachola',3,'Def'),(4,'Virgil',4,'Def')

create view employe_manager
as
select eid,ename,mid,department
from Employee as e
	full join Manager as m on e.mid = m.id

select * from employe_man

--2)Show the working of 'on delete cascade on update set default' for the above tables

alter table Employee drop constraint [FK__Employee__mid__4BAC3F29]

alter table Employee add constraint FK__Employee foreign key(mid) references Manager(id) on delete cascade on update set default 

select * from Manager
select * from Employee

update Manager set id=5 where id=1
delete manager where id=2