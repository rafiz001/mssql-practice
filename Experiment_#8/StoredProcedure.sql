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
