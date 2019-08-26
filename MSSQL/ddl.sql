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

create table [model].Department
(
	Did int not null identity(1,1),
	[Name] nvarchar(50) not null,
	[Location] nvarchar(100) not null
);
go

create table [model].Employee
(
	Eid int not null identity(1,1),
	Did int not null,
	Firstname nvarchar(25),
	Lastname nvarchar(25)
);
go

create table [model].EmployeeDetails
(
	Emid int not null identity(1,1),
	Eid int not null,
	Salary decimal(10,2) not null,
	Street nvarchar(50),
	City nvarchar(25),
	Province nvarchar(25)
);
go

alter table [model].Department
    add constraint PK_Did primary key (Did);

alter table [model].Employee 
    add constraint PK_Eid primary key (Eid);

alter table [model].Employee
    add constraint FK_Did foreign key (Did) references [model].Department(Did);

alter table [model].EmployeeDetails
    add constraint PK_Emid primary key (Emid);

alter table [model].EmployeeDetails
    add constraint FK_Eid foreign key (Eid) references [model].Employee(Eid);
