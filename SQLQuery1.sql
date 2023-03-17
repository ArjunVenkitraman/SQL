create database task1
use task1

CREATE TABLE Trainees (
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);
INSERT INTO Trainees values (101,'Lionel','Messi',5000,'2022-10-10 10:10:10','Forward')
INSERT INTO Trainees values (102,'Cristano','Ronaldo',6000,'2022-10-11 11:11:11','Forward')
INSERT INTO Trainees values (103,'Neymar','Junior',1000,'2022-10-12 10:10:10','winger')
INSERT INTO Trainees values (104,'Luiz','Suarez',9000,'2022-10-13 10:10:10','Forward')
INSERT INTO Trainees values (105,'Philippe','Coutinho',7000,'2022-10-14 10:10:10','mid-fielder')
INSERT INTO Trainees values (106,'Ronaldinho','Gaucho',2000,'2022-10-15 10:10:10','Forward')
INSERT INTO Trainees values (107,'Paulo','Dybala',3000,'2022-10-10 10:10:10','Forward')
INSERT INTO Trainees values (108,'Pele','nio',8000,'2022-10-11 10:10:10','Forward')
INSERT INTO Trainees values (109,'Diego','Maradona',1000,'2022-10-12 10:10:10','Forward')
INSERT INTO Trainees values (110,'Marco','Ruiz',5000,'2022-10-13 10:10:10','Forward')
INSERT INTO Trainees values (111,'Zinadine','Zidane',9000,'2022-10-14 10:10:10','mid-fielder')
INSERT INTO Trainees values (112,'Angel','Dimaria',8000,'2022-10-15 10:10:10','winger')
INSERT INTO Trainees values (113,'Kylian','Mbappe',3000,'2022-10-10 10:10:10','Forward')
INSERT INTO Trainees values (114,'Eden','Hazard',4000,'2022-10-11 10:10:10','winger')
INSERT INTO Trainees values (115,'Johan','Cruiff',6000,'2022-10-12 10:10:10','Forward')
INSERT INTO Trainees values (116,'Lizandro','Martinez',4000,'2022-10-13 10:10:10','Defender')
INSERT INTO Trainees values (117,'Manuel','Neuar',7000,'2022-10-14 10:10:10','Keeper')
INSERT INTO Trainees values (118,'MarkAndre','Terstegen',3000,'2022-10-15 10:10:10','Keeper')
INSERT INTO Trainees values (120,'De','Bruine',9000,'2022-10-10 10:10:10','mid-fielder')
INSERT INTO Trainees values (121,'Virgil','Vandgik',5000,'2022-10-11 10:10:10','Defender')

select * from Trainees
update Trainees set FIRST_NAME='Virgi' where Trainee_ID=121
select * from Trainees where FIRST_NAME like 'J%' COLLATE SQL_Latin1_General_CP1_CS_AS;
select * from Trainees where FIRST_NAME like '[J-T]%' COLLATE SQL_Latin1_General_CP1_CS_AS;

select * from Trainees where SALARY between 2000 and 5000
select * from Trainees where FIRST_NAME like '%i'
select DISTINCT SALARY from Trainees
select * from Trainees where DEPARTMENT='Forward' or DEPARTMENT='Defender'
select * from Trainees where Trainee_ID < 106
select * from Trainees order by Trainee_ID offset 5 rows fetch first 10 rows only
select top 5 with TIES FIRST_NAME,SALARY from Trainees ORDER BY SALARY desc
select * from Trainees order by DEPARTMENT desc
select * from Trainees where LAST_NAME like '__a%'
