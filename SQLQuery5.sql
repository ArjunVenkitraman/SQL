create database task5
use task5

CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Trainees
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-03-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin');

--1)Write an SQL query to get the count of employees in each department.
select count(DEPARTMENT) as 'DEPARTMENT_COUNT',DEPARTMENT from Trainees group by DEPARTMENT

--2)Write an SQL query to calculate the estimated induction program day for
SELECT TRAINEE_ID,JOINING_DATE,DATEADD(day, 5, JOINING_DATE) INDUCTION_PROGRAMME_DATE FROM Trainees

--3)Write an SQL query to retrieve the month in words from the Trainees table - JOINING_DATE Column.
SELECT TRAINEE_ID,DEPARTMENT,
      CHOOSE(MONTH([JOINING_DATE]),'January','February','March','April','May','June',
      'July','August','September','October','November','December') AS 'MONTH OF JOINING DATE'
  FROM Trainees;

  --4)Write an SQL query to perform the total and subtotal of salary in each department.
  SELECT coalesce (DEPARTMENT, 'DEPARTMENT TOTAL SALARY') AS DEPARTMENT,
  sum(SALARY) as TOTAL_SALARY FROM Trainees GROUP BY ROLLUP (DEPARTMENT)

  --5)Write an SQL query to retrieve first 3 records randomly.
  SELECT TOP 3 * FROM Trainees ORDER BY NEWID()

  --6)Show the working of composite key with any example.
  create table COMPOSITE
(
id int IDENTITY (1,1),
Dept_id int,
Dept_name varchar(25),
constraint pk_id Primary Key(id),
constraint uk_id_name Unique (Dept_id,Dept_name)
)

insert into COMPOSITE(Dept_id,Dept_name) values(201,'DEVELOPER')
insert into COMPOSITE(Dept_id,Dept_name) values(202,'DESIGNER')

SELECT * FROM COMPOSITE

--7)Show the working of IIF and CASE for the above table.
--CASE
SELECT FIRST_NAME,DEPARTMENT,SALARY,
CASE
    WHEN SALARY >= 200000 THEN 'PERSON IS SENIOUR DESIGNER'
    WHEN SALARY <= 100000 THEN 'PERSON IS JUNIOUR DESIGNER'
    ELSE 'DESIGNER'
END AS 'Employee Details'
FROM Trainees

--IIF

SELECT *,IIF(DEPARTMENT='HR','STAFF IS PALLAVI Katari','STAFF IS THANGAM Arulseeli') FROM Trainees

--8)Show the working of Sequence.
--SEQUENCE CREATION

CREATE SEQUENCE [dbo].[SequenceObject]
AS INT
START WITH 1
INCREMENT BY 1

--RETRIEVING SEQUENCE OBJECT

SELECT * FROM sys.sequences WHERE name = 'SequenceObject';

SELECT NEXT VALUE FOR [dbo].[SequenceObject];

--TABLE CREATION

CREATE TABLE EM
(
    Id INT PRIMARY KEY,
    Name NVARCHAR(50),
    Gender NVARCHAR(10)
);

SELECT * FROM EM

--INSERTING VALUES
INSERT INTO EM VALUES
(NEXT VALUE for [dbo].[SequenceObject], 'BenNY', 'Male');
INSERT INTO EM VALUES
(NEXT VALUE for [dbo].[SequenceObject], 'Saran', 'MALE');
INSERT INTO EM VALUES
(NEXT VALUE for [dbo].[SequenceObject], 'Sara', 'female');

--ALTERING SEQUENCE TO RESTART WITH 1

ALTER SEQUENCE [SequenceObject] RESTART WITH 1

--9)Show the working of creation of Synonym for a table in DB1 from DB2.

create database DB1

use DB1

--schema creation
create schema Traineess

--table creation
create table Traineess.Batch35
(
Trainee_ID int primary key,
TName varchar(25),
Designation varchar(25)
)

--inserting values
insert into Traineess.Batch35 values (011,'Antony','Developer'),(012,'Billa','Designer'),(013,'Christopher','Tester')

--select
select * from Traineess.Batch35

--datebase DB2 creation
create database DB2

use DB2

--synonym creation for table in DB1
create synonym tb_35 for DB1.Traineess.Batch35

--inserting values 
insert into tb_35 values (014,'Danny','Developer'),(015,'Elisa','Tester')

--select
select * from tb_35

--10)Show the working of IDENTITY_INSERT.
create table Students
(
rno int identity(1,1),
sname varchar(25),
department varchar(25),
constraint pk_id Primary Key(rno),
constraint uk_id_name Unique (sname)
)
insert into Students(sname,department) values ('Billa' ,'BCA'), ('Calvin' ,'BCA'),('David' ,'BCA'),('James' ,'BCA')

set identity_insert Students on

insert into Students(rno,sname,department) values(5,'Kiwi','BCA'),(6,'Lorenzo','BCA')

select * from Students

set identity_insert Students off

insert into Students(sname,department) values ('Martin','BCA'),('Naren','BCA')

select * from Students

