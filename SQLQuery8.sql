create database task8
use task8

create table Student
(
	studentid int primary key identity(1,1),
	studentname varchar(25),
	semester varchar(10),
	securedmarks int,
	totalmarks int 
)

insert into Student values('Joshua','Sem 1',420,500),
('Mithali','Sem 1',420,500),
('Rahul','Sem 1',410,500),
('Benjamin','Sem 1',320,500),
('Vishwa','Sem 1',422,500),
('Kohli','Sem 1',480,500),
('Luka','Sem 1',411,500),
('Paaru','Sem 1',380,500),
('Paathu','Sem 3',380,500),
('Chaaru','Sem 3',320,500),
('Thilak','Sem 3',378,500),
('Ram','Sem 3',326,500),
('Moideen','Sem 3',500,500)

select *from Student

create function Stu_Percentagee(@mark int,@totalmark int)
returns int
as begin
	declare @Tot int
	set @Tot = (@mark*100)/@totalmark
	return @Tot

end

-- calling percentage function
select studentid,studentname,semester,securedmarks,totalmarks,dbo.Stu_Percentagee(securedmarks,totalmarks) as Percentage from Student 

--2. Create user-defined function to generate a table that contains result of Sem 3 students.
create function Sem3(@sem varchar(10))
returns table
as
	return select * from Student where semester=@sem

select * from  dbo.Sem3('Sem 3')

--3. Write SQL stored procedure to retrieve all students details. (No parameters)
create procedure Stu_Detail
as
begin
	Select * from Student
end

exec Stu_Detail

--4. Write SQL store procedure to display Sem 1 students details. (One parameter)
create procedure Sem_Details(@sem1 varchar(20))
as
begin
	select * from Student where semester=@sem1
end

exec Sem_Details @sem1='Sem 1'

--5. Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)
create procedure Stu_Total(@total int output)
as
begin
	select @total = count(studentname) from Student
end

declare @tot int
exec Stu_Total @tot output
print 'Number_of_Students is '+ convert(varchar(10),@tot)

--6. Show the working of Merge Statement by creating a backup for the students details of only students in Sem 1.
select * into Studentbackup from Student where semester='Sem 1'
select * from Studentbackup;
select * from Student;

merge Studentbackup b
	using Student s
on (s.studentid=b.studentid)
when matched
	then update set 
		b.studentname=s.studentname,
		b.securedmarks=s.securedmarks
when not matched by target
	then insert (studentname,securedmarks,totalmarks)
	 values(s.studentname,s.securedmarks,s.totalmarks)
	when not matched by source
		then delete;

UPDATE Student set studentname='Ram' where studentid=10

