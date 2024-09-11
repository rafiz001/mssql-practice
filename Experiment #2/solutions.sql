--1. Create a table Employee with following schema:
--(WORKER_ID(PK), FIRST_NAME, LAST_NAME, SALARY, DEPT_NAME)
create table Employee (
WORKER_ID int,
FIRST_NAME varchar(125),
LAST_NAME varchar(125),
SALARY int,
DEPT_NAME varchar(125)
)

--2. Add a new column; JOINING_DATE to the existing relation.
alter table Employee add  JOINING_DATE  date;

--3. Change the datatype of SALARY.
alter table Employee alter column SALARY float;

--4. Change the name of column/field DEPT_NAME to DEPARTMENT.
--❌

--5. Modify the column width of the DEPARTMENT field of EMPLOYEE table
alter table Employee alter column DEPT_NAME varchar(100);

----assignment 2:

--1. Allow NULL for all columns except WORKER_ID.
alter table Employee alter column WORKER_ID int not null;

--2. Add constraints to check, while entering the SALARY value (i.e) SALARY > 100. 
alter table Employee add check (SALARY > 100);

--3. Define the field FIRST_NAME as UNIQUE. 
alter table Employee add unique(FIRST_NAME)

--4. Create a primary key constraint for the column (WORKER_ID).
alter table Employee add primary key (WORKER_ID);

----assignment 3:

--1. Insert at least 10 rows in the table.
insert into Employee (WORKER_ID, FIRST_NAME, LAST_NAME, Salary, DEPT_NAME, JOINING_DATE)
values
(1, 'Rafiz-1', 'Uddin', 150000, 'CSE', '2024-09-09'),
(2, 'Rafiz-2', 'Uddin', 1500, 'CSE', '2024-09-09'),
(3, 'Rafiz-3', 'Uddin', 1500, 'CSE', '2024-09-09'),
(4, 'Rafiz-4', 'Uddin', 150000, 'Admin', '2024-09-09'),
(5, 'Sanjoy', 'Uddin', 1500, 'CSE', '2024-09-09'),
(6, 'Asad', 'Uddin', 150, 'CSE', '2024-09-09'),
(7, 'Rafiz-7', 'Uddin', 1500000, 'Admin', '2024-09-09'),
(8, 'Rafiz-8', 'Uddin', 1500, 'CSE', '2024-09-09'),
(9, 'Rafiz-9', 'Uddin', 1500, 'CSE', '2024-09-09'),
(10, 'Rafiz-10', 'Uddin', 15000000, 'CSE', '2024-09-09');

--2. Display all the information of EMPLOYEE table.
select * from Employee;

--3. Display all the information of 1 st 5 employees of EMPLOYEE table with
--    FIRST_NAME+LASTNAME as FULL_NAME.
select top 5 FIRST_NAME+" "+LAST_NAME as FULL_NAME from Employee;

--4. Display the complete record of employees working in Admin Department
select * from Employee where DEPT_NAME = 'Admin';

--5. Find the name of employees whose salary is greater than 10000
select FIRST_NAME from Employee where SALARY > 10000;

--6. Write down the SQL Query to find out whose salary is greater than Sanjoy.
select * from Employee where SALARY > (select SALARY from Employee where FIRST_NAME = 'Sanjoy');

--7. Update the Salary of Worker by 95000 whose ID is 8 .
update Employee set SALARY = 95000 where WORKER_ID = 8;

--8. Delete the record of employee whose FIRST_NAME is Asad.
delete from Employee where FIRST_NAME = 'Asad';




select * from Employee;
