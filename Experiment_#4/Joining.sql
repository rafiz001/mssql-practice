create table Worker (
WORKER_ID int primary key not null identity,
FIRST_NAME varchar(125),
LAST_NAME varchar(125),
SALARY int,
DEPARTMENT varchar(125),
JOINING_DATE datetime
);

create table Bonus (
WORKER_REF_ID int not null,
BONUS_DATE date,
BONUS_AMOUNT varchar(125)
);

create table Title (
WORKER_REF_ID int not null,
WORKER_TITLE varchar(125),
AFFECTED_FROM date
);

insert into Worker ( FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT, JOINING_DATE)
values
( 'Rana', 'Hamid', 100000, 'HR', '2014-02-20 09:00:00'),
( 'Sanjoy', 'Saha', 80000, 'Admin', '2014-06-11 09:00:00'),
( 'Mahmudul', 'Hasan', 300000, 'HR', '2014-02-20 09:00:00'),
( 'Asad', 'Zaman', 500000, 'Admin', '2014-02-20 09:00:00'),
( 'Sajib', 'Mia', 500000, 'Admin', '2014-06-11 09:00:00'),
( 'Alamgir', 'Kabir', 200000, 'Account', '2014-06-11 09:00:00'),
( 'Foridul', 'Islam', 75000, 'Account', '2014-01-20 09:00:00'),
( 'Keshob', 'Ray', 90000, 'Admin', '2014-04-11 09:00:00');

insert into Bonus ( WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT)
values
( 1, '2019-02-20', 5000),
( 2, '2019-06-11', 3000),
( 3, '2019-02-20', 4000),
( 4, '2019-02-20', 4500),
( 5, '2019-06-11', 3500),
( 6, '2019-06-12', null);

insert into Title ( WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
values
( 1, 'Manager', '2019-02-20'),
( 2, 'Executive', '2019-06-11'),
( 8, 'Executive', '2019-06-11'),
( 5, 'Manager', '2019-06-11'),
( 4, 'Asst. Manager', '2019-06-11'),
( 7, 'Executive', '2019-06-11'),
( 6, 'Lead', '2019-06-11'),
( 3, 'Lead', '2019-06-11');

--1. List all the employees except ‘Manager’ & ‘Asst. Manager’.
select * from Worker inner join Title on Worker.WORKER_ID = Title.WORKER_REF_ID where Title.WORKER_TITLE not in ('Manager','Asst. Manager');
--13. Write an SQL query to fetch the list of employees with the same salary.
select * from worker inner join (select salary from worker group by salary having count(salary)>1) as sameSalaries on worker.salary=sameSalaries.salary;
