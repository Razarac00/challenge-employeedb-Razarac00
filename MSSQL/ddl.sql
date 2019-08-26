-- Create a new database called 'EmployeeDB'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'EmployeeDB'
)
CREATE DATABASE EmployeeDB
GO

use EmployeeDB;
go

create schema [Company];
go

create table [Company].Department
(
	Did int not null identity(1,1),
	Name nvarchar(50) not null,
	Location nvarchar(100) not null
);
go

create table [Comapny].Employee
(
	Eid int not null identity(1,1),
	Did int not null,
	Firstname nvarchar(25),
	Lastname nvarchar(25)
);
go

create table [Company].EmployeeDetails
(
	Emid int not null identity(1,1),
	Eid int not null,
	Salary decimal(10,2) not null,
	Street nvarchar(50),
	City nvarchar(25),
	Province nvarchar(25)
);
go

alter table [Company].Department
    add constraint PK_Did primary key (Did);

alter table [Company].Employee 
    add constraint PK_Eid primary key (Eid);

alter table [Company].Employee
    add constraint FK_Did foreign key (Did) references [Company].Department(Did);

alter table [Company].EmployeeDetails
    add constraint PK_Emid primary key (Emid);

alter table [Company].EmployeeDetails
    add constraint FK_Eid foreign key (Eid) references [Company].Employee(Eid);
