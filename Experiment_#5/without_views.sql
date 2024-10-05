
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
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);


-- 1. Write a query to create a view for those salesmen belongs to the city New York.
select * from salesman where city = 'New York';

-- 2. Write a query to create a view for all salesmen with columns salesman_id, name and city.
select salesman_id, name, city from salesman;

-- 3. Write a query to find the salesmen of the city New York who achieved the commission more than 13%.
select * from salesman where city = 'New York' and commission > 0.13;

-- 4. Write a query to create a view to getting a count of how many customers we have at each level of a grade.
select count(*) as count, grade from customer group by grade;

-- 5. Write a query to create a view to keeping track the number of customers ordering, number of salesmen attached, average amount of orders and the total amount of orders in a day.
select count(customer_id) as Customer, count(salesman_id) as Salesmen, avg(purch_amt) as Average_Purchase, sum(purch_amt) as Total_Purchase from orders where ord_date = '2012-10-10';

-- 6. Write a query to create a view that shows for each order the salesman and customer by name.
select orders.*, salesman.name as salesman_name, customer.cust_name as customer_name from orders 
inner join customer on orders.customer_id=customer.customer_id
inner join salesman on orders.salesman_id=salesman.salesman_id;

-- 7. Write a query to create a view that finds the salesman who has the customer with the highest order of a day.
select name from salesman where salesman_id = 
(select salesman_id from orders where )
where 
