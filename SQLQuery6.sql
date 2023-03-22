create database Task6
use Task6

create table salesman(
 salesman_id int,
 name varchar(20),
 city char(20),
 commission decimal(2,2)
)

insert into salesman values(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris', 0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12)

create table customer (
  customer_id int,
  cust_name varchar(20),
  city char(10),
  grade int,
  salesman_id int
)

--inserting values
insert into Customer values
(3002,'Nick Rimando','New York',100,5001),
(3007,'Brad Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007)

insert into Customer(customer_id,cust_name,city,salesman_id)values(3001,'Brad Guzan','London',5005)

create table Orders
(
ord_no int primary key,
purch_amt decimal (4,2),
ord_date date,
customer_id int,
salesman_id int
)
--alter table
alter table Orders alter column purch_amt numeric (8,2)

insert into Orders values
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70013,75.29,'2012-08-17',3003,5007),
(70011,3045.6,'2012-04-25',3002,5001)

--1)From the above tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
select salesman.name,customer.cust_name,salesman.city,customer.city from salesman inner join customer on salesman.city=customer.city

--2)From the above tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company.Return Customer Name, customer city, Salesman, commission.
select s.salesman_id,s.commission,c.cust_name,c.city from salesman as s inner join customer as c on s.salesman_id=c.salesman_id where commission > 0.12

--3)From the above tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman,commission.
select s.salesman_id,s.commission,c.cust_name,c.grade,o.ord_no,o.purch_amt,o.ord_date from salesman as s inner join customer as c on s.salesman_id = c.salesman_id inner join orders as o on c.customer_id=o.customer_id  

--4)From the above tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt,cust_name, city.
select c.cust_name,c.city,o.ord_no,o.purch_amt from customer as c inner join Orders as o on c.customer_id = o.customer_id where purch_amt>500 and purch_amt<2000

--5)From the above tables write a SQL query to display the customer name,customer city, grade, salesman, salesman city. The results should besorted by ascending customer_id.
select c.cust_name,c.city,c.grade,s.salesman_id,s.city from salesman as s inner join customer as c on s.salesman_id=c.salesman_id order by c.customer_id