create database task12

use task12

--employee table creation

create table employee
(
empid int primary key,
first_name varchar(255),
last_name varchar(255)
)

--call outcome table creation

create table callout
(
callid int primary key,
outcome_text char(128)
)

--country table creation

create table country
(
couid int primary key,
country_name char(128),
country_name_eng char(128),
country_code char(8)
)

--city table creation

create table city
(
cityid int primary key,
cityname char(128),
lat decimal(9,6),
long decimal(9,6),
country_id int references country(couid)
)

--customer table creation

create table customer
(
custid int primary key,
cust_name varchar(255),
city_id int references city(cityid),
customer_address varchar(255),
next_calldate date,
ts_inserted datetime
)

--call table creation

create table call
(
call_id int primary key,
employee_id int references employee(empid),
customer_id int references customer(custid),
start_time datetime,
end_time datetime,
callout_id int references callout(callid)
)



