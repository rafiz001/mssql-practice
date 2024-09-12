create database rafiz;
use rafiz;
create table teacher (
TID int primary key identity,
FirstName varchar(120),
LastName varchar(120),
Dept varchar(50),
Age int,
Salary int
);

create table department (
deptID int primary key identity,
deptName varchar(120),
location varchar(120)
);

insert into teacher (FirstName, LastName, Dept, Age, Salary) values 
('Mizanur', 'Rahman','CSE',28,35000),
('Delwar', 'Hossain','CSE',26,33000),
('Shafiul', 'Islam','EEE',24,30000),
('Faisal', 'Imran','CSE',30,50000),
('Ahsan', 'Habib','English',28,28000);

insert into department (deptName, location) values
('CSE', 'Talaimari'),
('EEE', 'Talaimari'),
('English', 'Kazla'),
('BBA', 'Talaimari');


--1. Update the Salary of Teacher by 15% whose DeptName is 'CSE, otherwise update by 
--10% Salary.
update teacher set Salary = case
when Dept = 'CSE' then  Salary*1.15
else  Salary*1.10
end;

--2. Write a query to insert/copy the values of all attributes from one table to another using 
--(ID in) subquery.


--3. Write a query to find firstname and lastname as fullname , age whose salary is 
--maximum.
select FirstName+' '+LastName as fullname from teacher where Salary in (select max(Salary) from teacher);
select * from teacher;

--4. Write a query to find firstname, age,dept whose age is between 23 to 27.
select FirstName, Age, Dept from teacher where Age between 23 and 27;

--5. Write a query to find TID,firstname whose salary is less than average salary.
select TID, FirstName from teacher where Salary < (select avg(Salary) from teacher );

--6. Write a query to delete all ID where age is greater than 25 using subquery.
select *  from teacher where TID in (select TID from teacher where Age > 25);

--7. Write a query to update Dept by 'English' where Dept is 'ECE' using subquery
update teacher set Dept = 'English' where TID in (select TID from teacher where Dept = 'ECE' );

--8. Write a query to update salary by multiplying the salary by 100 where salary is 
--greater than 5000 using subquery.
update teacher set Salary = Salary*100 where TID in (select TID from teacher where Salary > 5000);

--9. Write a query to find the name that starts with 'k/s' using a subquery.
select FirstName from teacher where FirstName like '[ks]%';

--10. Find the Firstname,salary for all the teachers of CSE who have a higher salary than 
--Meraj Ali using subquery
select FirstName, Salary from teacher where (Dept = 'CSE' and Salary > (select Salary from teacher where FirstName = 'Mizanur' and LastName = 'Rahman' ));

--11. Find out the id,names of all teachers who belong to the same department as the 
--teacher 'Meraj' who is in department CSE and age is 26.
select TID as id, FirstName+' '+LastName as name from teacher where dept = (select top 1 dept from teacher where FirstName = 'Delwar' and age = 26);

--12. What will be the outcome of the following query? 
--13. What will be the outcome of the query that follows?

--14. Find TID, salary, deptID whose salary is greater than average salary
select TID, FirstName from teacher where Salary > (select avg(Salary) from teacher );

--15. Find min salary from Teacher for each department where min salary is less than 
--average salary
select min(salary), dept from teacher group by dept having min(salary)<avg(salary);

--16. Find firstname,lastname,Dept where location name is kajla using subquery.
select FirstName, LastName, Dept from teacher where Dept = (select deptName from department where location = 'Kazla' );

--17. Write a query to find the TID,firsname,salary where the length of the firstname is at 
--least 6
select TID,FirstName,salary from teacher where len(FirstName)>=6;


--***. Find teacher whose salary is top 3rd most.
select top 1 * from  (select top 3 * from teacher order by salary desc) as temp order by salary;