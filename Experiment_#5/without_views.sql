
CREATE TABLE salesman (
  salesman_id int primary key,
  name varchar(25),
  city varchar(25),
  commission float
);

create table customer (
  customer_id int primary key,
  cust_name varchar(25),
  city varchar(25),
  grade int,
  salesman_id int,
  foreign key (salesman_id) references salesman(salesman_id)

);

create table orders (
ord_no int primary key,
purch_amt float,
ord_date date,
customer_id int,
salesman_id int,
foreign key (salesman_id) references salesman(salesman_id),
foreign key (customer_id) references customer(customer_id)
);

insert into salesman (salesman_id, name, city, commission) values 
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', null, 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

insert into customer (customer_id,cust_name,city,grade,salesman_id) values 
(3002,'Nick Rimando','New York',100,5001),
(3005,'Graham Zusi','California',200,5002),
(3001,'Brad Guzan','London',null,5005),
(3004,'Fabian Johns','Paris',300,5006),
(3007,'Brad Davis','New York',200,5001),
(3009,'Geoff Camero','Berlin',100,5003),
(3008,'Julian Green','London',300,5002),
(3003,'Jozy Altidor','Moscow',200,5007);

insert into orders (ord_no, purch_amt,ord_date,customer_id,salesman_id) values 
(70001, 150.5, '2012-10-05', 3005, 5002),
(, , , , )
(, , , , )
(, , , , )
(, , , , )
(, , , , )
(, , , , )
(, , , , )
(, , , , )
(, , , , )
(, , , , )
(, , , , )
