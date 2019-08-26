use EmployeeDB;
go

-- Three insertions
insert into [model].Department ([Name], [Location])
values ("IT", "123 Gamer Drive"),
("RnD", "321 Bad Deal Lane"),
("Marketing", "420 Bulls Eye Blvd.");
go

insert into [model].Employee (Did, Firstname, Lastname)
values (1, "Greg", "Johnson"),
(2, "Fred", "McGee"),
(3, "Carlton", "James");
go

insert into [model].EmployeeDetails (Eid, Salary, Street, City, Province)
values (1, 50000, "33 ESRB st.", "Denton", "BC"),
(2, 45000, "34 ESRB st.", "Denton", "BC"),
(3, 38000, "35 ESRB st.", "Denton", "AB");
go

-- Tina Smith
insert into [model].Employee (Did, Firstname, Lastname)
values (2, "Tina", "Smith");

insert into [model].EmployeeDetails (Eid, Salary, Street, City, Province)
values (4, 75000, "36 ESRB st.", "Denton", "AB");
go

-- List marketing employees
select CE.Firstname, CE.Lastname 
from [model].Employee as CE 
inner join [model].Department as CD on CE.Did = CD.Did 
where  CD.[Name] = "Marketing";
go

-- Report total salary of Marketing
select sum(CED.Salary)
from [model].Employee as CE 
inner join [model].Department as CD on CE.Did = CD.Did
inner join [model].EmployeeDetails as CED on CE.Eid = CED.Eid
where CD.[Name] = "Marketing";
go

-- Increase Tina's Salary to 90000
update [model].EmployeeDetails 
set Salary = 90000
where [model].Employee.Eid = [model].EmployeeDetails.Eid and [model].Employee.Firstname = "Tina" and [model].Employee.Lastname = "Smith";
go