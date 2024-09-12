create table Worker (
WORKER_ID int primary key not null identity,
FIRST_NAME varchar(125),
LAST_NAME varchar(125),
SALARY int,
DEPARTMENT varchar(125),
JOINING_DATE datetime
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

--1. Write an SQL query to print first three characters of FIRST_NAME from Worker table.
select substring(FIRST_NAME,1,3) from Worker;

--2. Write an SQL query to print details of the Workers who have joined from Feb 2014 to
-- March 2014.
select * from Worker where JOINING_DATE between '2014-02-01' and '2014-03-31';

--3. Write an SQL query to print details of the Workers who have served for at least 6 months.
select * from Worker where datediff(month,JOINING_DATE,CURRENT_TIMESTAMP) > 6;

--4. Write an SQL query to update all worker salary whose title is manager.
update  Worker set SALARY = 7000000 where DEPARTMENT = 'manager';

--5. Write an SQL query to update all worker bonus 10% whose joining_date before ‘2014-
--04-11 09:00:00’ otherwise bonus update 5% and also check department name is ‘Admin’.
update  Worker set SALARY = iif(JOINING_DATE < '2014-04-11 09:00:00', SALARY*1.10, SALARY*1.05) where DEPARTMENT = 'Admin';
--or
update  Worker set SALARY = 
case
when JOINING_DATE < '2014-04-11 09:00:00' then SALARY*1.10
else SALARY*1.05
end
where DEPARTMENT = 'Admin';

--6. Write an SQL query to delete all workers who have not taken any bonus.
-- ⚠️

--7. Write an SQL query to print details for Workers with the first name “Rana” and “Sajib”
--from Worker table.
select * from Worker where FIRST_NAME in ('Rana','Sajib');

--8. Write an SQL query to print details of workers excluding first names, “Rana” and “Sajib”
--from Worker table.
select * from Worker where FIRST_NAME not in ('Rana','Sajib');

--9. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from Worker where FIRST_NAME like '%a%';

--10. Write an SQL query to print details of the Workers whose FIRST_NAME starts with ‘k’.
select * from Worker where FIRST_NAME like 'K%';

--11. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘r’
-- and contains seven alphabets.
select * from Worker where FIRST_NAME like '%______r';

--12. Write an SQL query to find the position of the alphabet (‘n’) in the FIRST_NAME
-- column ‘Sanjoy’ from Worker table.
select charindex('n',FIRST_NAME) from Worker where FIRST_NAME = 'Sanjoy';

--13. Find the average salary of employees for each department.
select avg(salary) as avg_salary, department from Worker group by department;

--14. List all the employees who have maximum or minimum salary in each department
-- ⚠️

--15. Write an SQL query to find the position of the alphabet (‘r’) in the FIRST_NAME
-- column ‘Rana’ from Worker table.
select charindex('r',FIRST_NAME) from Worker where FIRST_NAME = 'Rana';

--16. Write an SQL query to print the FIRST_NAME from Worker table after removing white
-- spaces from the right side.
select rtrim(FIRST_NAME) from Worker;

--17. Write an SQL query that fetches the unique values of FIRST_NAME from Worker table
-- and prints its length.
select distinct FIRST_NAME, len(FIRST_NAME) from Worker;

--18. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’
-- with ‘A’.
select replace(FIRST_NAME,'a','A') from Worker;

