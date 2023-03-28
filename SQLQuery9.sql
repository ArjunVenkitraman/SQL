--1. Write a Stored Procedure in SQL using conditional statements to search for a record from the students table (created in SQL Task 8) based on studentname column.
alter procedure student_p(@name varchar(20))
as
begin
 if((select studentname from Student
 where studentname=@name)=@name
 )
 begin 
 print 'Name is : '+@name+' found '
 end
 else
 begin
	print 'Sorry not able to find 😢'
 end
 end

 exec student_p 'Rahul'

--2. Write a Stored procedure in SQL to give remarks for the secured marks column in the students table (created in SQL Task 8) using CASE statement.
alter procedure remarks
 as 
 begin
 select studentname,securedmarks,
 case securedmarks
 when '420' then 'Well done'
 when '410' then 'do well'
 when '320' then 'can do'
 else 'DO BETTER'
 end 
 as remarks from Student
 end;

 exec remarks
 
 --3. Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)

--Table variable
DECLARE @marks TABLE (
    studentname VARCHAR(25),
    securedmarks int
);
INSERT INTO @marks
select studentname,securedmarks from Student;
select * from @marks;

--Tempory table
SELECT
   studentname,securedmarks,totalmarks
INTO #tempstudent
FROM
    Student
WHERE
    securedmarks>=400;
select * from #tempstudent

--temporary stored procedures
CREATE TABLE ##GlobalTempstu
(
 studentname varchar(20),
 securedmarks int, 
)
insert into ##GlobalTempstu values('Ram',100)

select * from ##GlobalTempstu