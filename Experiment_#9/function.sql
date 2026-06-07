create table tbl_management(
 mgt_id varchar(100) primary key,
 mgt_name varchar(200),
 joining_date date,
 salary int,
 position varchar(100)
 );
 create table tbl_emp(
 emp_id varchar(100) primary key,
 emp_name varchar(200),
 joining_date date,
 salary int,
 division varchar(50)
 );
 create table tbl_project(
 p_id varchar(100),
 p_name varchar(200),
 mgt_id varchar(100),
 e_id varchar(100),
 p_cost int,
 delivery_date date
 );
 go
 insert into tbl_management (mgt_id, mgt_name, joining_date,salary,position)
 values
 ('M2015','Keshob','2001-01-18',250000,'Managing Director'),
 ('M2016','Rana','2003-01-30',180000,'Secretary'),
 ('M2017','Jasim','2004-04-12',150000,'Join Secretary'),
 ('M2018','Rajon','2004-06-18',140000,'Join Secretary');
 insert into tbl_emp (emp_id,emp_name,joining_date,salary,division)
 values
 ('E1001','Suman','2003-04-25',92000,'Software'),
 ('E1002','Rasel','2004-03-13',86000,'Network'),
 ('E1003','Hossain','2004-06-21',82000,'Software'),
 ('E1004','Polash','2005-05-05',9800,'Network')
 insert into tbl_project (p_id,p_name,mgt_id,e_id,p_cost,delivery_date)
 values
 ('P3001','Office Automation','M2016','E1001',2050000,'2016-05-08'),
 ('P3002','Repair Hub','M2016','E1004',1200000,'2017-06-14'),
 ('P3003','Server Installation','M2018','E1001',1500500,'2018-02-13'),
 ('P3004','Network Setup','M2017','E1002',2505000,'2018-03-12')
 go
 
--1. Write a sql query to show Project name, cost and Rank according to cost, 
--assign employee name and rearrange the project according to cost ascending order.
 print '(1)'
 select p_name,
        p_cost, 
        rank() over (order by p_cost desc) as rank,
        emp_name
 from tbl_project
 inner join tbl_emp on tbl_emp.emp_id=tbl_project.e_id
 order by p_cost asc;
 
--2. Write a sql create UDF query to show Project name, cost and assign
--employee name and rearrange the project according to cost ascending order.
--Where Project name and employee name pass by parameter.
print '(2)'
go
create function projectOfEmployee(@pr_name varchar(100),@empl_name varchar(100))
returns @projEmp table (project varchar(100), cost int, employee varchar(100))
as begin 
insert into @projEmp 
          select p_name,
                 p_cost,
                 emp_name
          from tbl_project
          inner join tbl_emp on tbl_emp.emp_id=tbl_project.e_id
          where p_name=@pr_name and emp_name=@empl_name
          order by p_cost asc;
return;
end;
go
select * from projectOfEmployee('Office Automation','Suman');

