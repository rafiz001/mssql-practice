create table Account_Detail (
  Account_no int primary key,
  Acc_holder_name varchar(25),
  Amount int,
  Branch_Id varchar(20),
  Zone_Id varchar(20)
);

create table Branch (
  Br_Id varchar(20) primary key,
  Branch_Name varchar(20),
);

create table Zone (
  Zone_Id varchar(20) primary key,
  Name varchar(20),
)

insert into Account_Detail (Account_no,Acc_holder_name,Amount,Branch_Id,Zone_Id)
values 
('1992212','Mr. Nazmuzzaman','200000','B-101','Z-803'),
('1992213','Mr. Jibon','170000','B-102','Z-803'),
('1882212','Bushra','180000','B-103','Z-802'),
('1882213','Sajib','170000','B-104','Z-801');


insert into Branch (Br_Id, Branch_Name) 
values
('B-101','Bonani'),
('B-102','Romna'),
('B-103','Shaheb bazar'),
('B-104','Ullapara');

insert into Zone (Zone_Id, Name)
values
('Z-801','Sirajgonj'),
('Z-802','Rajshahi'),
('Z-803','Dhaka'),
('Z-804','Chittagong');
go
-- 1. Create a simple stored procedure “SPdetails” to find Acc_holder_name, Amount, Branch_Name and Zone_Name.
create proc SPdetails
as
begin
select Acc_holder_name, Amount, Branch_Name, Name as Zone_Name from Account_Detail
inner join 
Branch on Account_Detail.Branch_Id=Branch.Br_Id
inner join 
Zone on Account_Detail.Zone_Id=Zone.Zone_Id
end;
go
exec SPdetails;

-- 2. Create a simple stored procedure “SPaverage” to find Branch _name and Amount of Branch where amount will be greater than particular amount (say 17000). Here branch_name and amount will be passed by parameter
go
create proc SPaverage
@branch_name varchar(50),
@amount int
as begin
select branch_name, sum(amount) from ( 
select branch_name, amount from Account_Detail inner join Branch on Account_Detail.Branch_Id=Branch.Br_Id where Branch.Branch_Name=@Branch_name
) as temp 
group by branch_name having sum(amount)>@amount
end;
go
exec SPaverage 'Shaheb bazar',17000;

--3. Create a simple stored procedure “SPbalance” to find Amount of a particular zone. Here zone name will be passed by parameter and amount will be shown by using return value().
go 
create proc SPbalance
@zone varchar(20)
as begin
return (
select sum(amount) from ( 
select name as zone_name, amount from Account_Detail inner join Zone on Account_Detail.Zone_Id=Zone.Zone_Id where Zone.Name=@zone
) as temp 
group by zone_name
)
end;

go

declare @balance int
exec @balance=SPbalance 'Dhaka'
print @balance

--4. Create a simple stored procedure “SPamount” to Find all account holders name with their branch name and zone name whose name has substring ‘Mr.’ and Amount Less than Maximum Amount
go
create proc SPamount
as begin
select Acc_holder_name, branch_name, Name as zone_name from Account_Detail 
inner join Branch on Account_Detail.Branch_Id=Branch.Br_Id
inner join Zone on Account_Detail.Zone_Id=Zone.Zone_Id
where Amount<(select max(amount) from Account_Detail)
 and Acc_holder_name like '%Mr.%'
end;
go
exec SPamount;

-- 5. Create a simple stored procedure “SPdetailsInfo” to find number of customer of each Zone. Here number of customers need to be printed as output parameter and zone_name will be passed as parameter
go
create proc SPdetailsInfo
@zone_name varchar(20),
@customer int out
as begin
select @customer=count(Account_no) from (
select Account_no, Name as zone_name from Account_Detail 
inner join Zone on Account_Detail.Zone_Id=Zone.Zone_Id
where name=@zone_name
) as temp
group by zone_name
end;
go

declare @custNum int
exec SPdetailsInfo 'Dhaka', @custNum out
print 'customer number: '
print @custNum

--6. Create procedure like “spEmployeeSalaryDetails1” which has four parameter. three parameter match the StartAmount, EndAmount value, Branch_Name Value and another parameter return this value, in this procedure find the number of customer where StartAmount, EndAmount value, Branch_Name value pass by parameter.
go
create proc spEmployeeSalaryDetails1
@StartAmount int,
@EndAmount int,
@Branch_Name varchar(20),
@custNum int out
as begin
select @custNum=count(Account_no) from 
(select Account_no, Branch_Name, Amount from Account_Detail
inner join Branch on Account_Detail.Branch_Id=Branch.Br_Id
where (Amount between @StartAmount and @EndAmount)
    and Branch_Name=@Branch_Name
) as temp
group by Branch_Name
;
end ;
go
declare @custNum int
exec spEmployeeSalaryDetails1 170000,200000,'Shaheb bazar',@custNum out
print 'Customer number of given crieteria: '
print @custNum
go

--7. Create a simple stored procedure “SPdetailsInfo” to find Zone_name, number of customer of a specific Zone.
go
create proc SPdetailsInfo2
@zone varchar(20)
as begin
select zone_name, count(Account_no) as customer_number from 
(select Account_no, Name as zone_name from Account_Detail
inner join Zone on Zone.Zone_Id=Account_Detail.Zone_Id
where Name=@zone) as temp
group by zone_name
end;
go
exec SPdetailsInfo2 'Dhaka'

--8. Create a simple stored procedure “SPdetailsInfo1” to find Zone_name, number of Branch of a specific Zone(Zone name pass by parameter).
go
create proc SPdetailsInfo1
@zone varchar(20)
as begin
select zone_name,count(Branch_Id) as Branch_number from 
(select  Branch_Id, Name as zone_name from Account_Detail
inner join Zone on Zone.Zone_Id=Account_Detail.Zone_Id
where Name=@zone) as temp
group by zone_name
end;
go
exec SPdetailsInfo1 'Rajshahi'
