use EmployeeDB;
go

insert into [Company].Department ([Name], [Location])
values ("GameStop", "123 Gamer Drive"),
("Best Buy", "321 Bad Deal Lane"),
("Target", "420 Bulls Eye Blvd.");
go

insert into [Company].Employee (Did, Firstname, Lastname)
values (1, "Greg", "Johnson"),
(2, "Fred", "McGee"),
(3, "Carlton", "James");
go

insert into [Company].EmployeeDetails (Eid, Salary, Street, City, Province)
values (1, 50000, "33 ESRB st.", "Denton", "BC"),
(2, 45000, "34 ESRB st.", "Denton", "BC"),
(3, 38000, "35 ESRB st.", "Denton", "AB");
go