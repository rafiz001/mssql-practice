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


