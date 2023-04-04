create database task16
use task16

create table simple(
	emp_id int primary key,
	name varchar(20)
)

insert into simple values(1,'Raheem'),(2,'Sterling')

--1. Create a DML trigger to restrict DML operations on Saturday and Sunday.
ALTER TRIGGER triggerdml
ON simple
FOR INSERT, UPDATE, DELETE
AS
BEGIN
  IF DATEPART(DW,GETDATE()) IN (3,7)
  BEGIN
    PRINT 'DML OPERATIONS ARE RESTRICTED ON Saturday and Sunday'
    ROLLBACK TRANSACTION
  END
END

insert into simple values(3,'Rodriguz')

--2. Create a DML trigger to restrict delete operations between 11:00AM to 15:00PM.

ALTER TRIGGER trigger_time ON simple
FOR INSERT, UPDATE, DELETE
AS
BEGIN
  IF DATEPART(HH,GETDATE()) between 10 and 15
  BEGIN
    PRINT 'Transaction restricted b/w 11 to 15'
    ROLLBACK TRANSACTION
  END 
END

insert into simple values(3,'Rodriguz')

--3. Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed.
alter trigger trigger_notify on database
for 
create_table,alter_table,drop_table,rename
as 
begin
print 'You have performed DDL statements'
rollback tran
end

create table spoti(id int)


