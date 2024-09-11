create table Worker (
WORKER_ID int primary key not null,
FIRST_NAME varchar(125),
LAST_NAME varchar(125),
SALARY int,
DEPT_NAME varchar(125),
JOINING_DATE datetime
)


insert into Worker (WORKER_ID, FIRST_NAME, LAST_NAME, Salary, DEPT_NAME, JOINING_DATE)
values
(1, 'Rafiz-1', 'Uddin', 150000, 'CSE', '2024-09-09 09:00:00'),
(2, 'Rafiz-2', 'Uddin', 1500, 'CSE', '2024-09-09'),
(3, 'Rafiz-3', 'Uddin', 1500, 'CSE', '2024-09-09'),
(4, 'Rafiz-4', 'Uddin', 150000, 'Admin', '2024-09-09'),
(5, 'Sanjoy', 'Uddin', 1500, 'CSE', '2024-09-09'),
(6, 'Asad', 'Uddin', 150, 'CSE', '2024-09-09'),
(7, 'Rafiz-7', 'Uddin', 1500000, 'Admin', '2024-09-09'),
(8, 'Rafiz-8', 'Uddin', 1500, 'CSE', '2024-09-09'),
(9, 'Rafiz-9', 'Uddin', 1500, 'CSE', '2024-09-09'),
(10, 'Rafiz-10', 'Uddin', 15000000, 'CSE', '2024-09-09');

select substring(FIRST_NAME,1,3), JOINING_DATE from Worker;

