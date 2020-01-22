/*Brady Jacobson
Code Challenge 2*/

/*The creation of the database, schema, and three tables.*/
Create Database CodeChallenge2;

Create Schema Employ;

Create Table Employ.Department(
	ID int Primary Key identity(1,1),
	Name varchar(20) Not Null Unique,
	Location varchar(20) Not Null
);

create Table Employ.Employee(
	ID int Primary Key identity(1,1),
	FirstName varchar(20) Not null,
	LastName varchar(20) Not Null,
	SSN varchar(9) Not Null Unique,
	DeptID int FOREIGN KEY REFERENCES Employ.Department(ID)
);

create Table Employ.EmpDetails(
	ID int Primary Key identity(1,1),
	EmployeeID int FOREIGN KEY REFERENCES Employ.Employee(ID),
	Salary int not null,
	Address_1 varchar(30) Not Null,
	Address_2 varchar(30),
	City varchar(20) Not Null,
	State_1 varchar(20) Not Null,
	Country varchar(20) Not Null
);

/*Create 3 rows for each*/
insert into Employ.Department(Name,Location) values ('CS', 'Building_101');
insert into Employ.Department(Name,Location) values ('MATH', 'Building_103');
insert into Employ.Department(Name,Location) values ('SCIENCE', 'Building_224');
insert into Employ.Employee(FirstName, LastName, SSN, DeptID) values ('Brad','Cooper','123456789',1);
insert into Employ.Employee(FirstName, LastName, SSN, DeptID) values ('Chad','Nerd','987654321',3);
insert into Employ.Employee(FirstName, LastName, SSN, DeptID) values ('Dad','Jokes','555555555',3);
insert into Employ.EmpDetails(EmployeeID,Salary,Address_1,Address_2, City,State_1,Country) values (5,10000,'Oakland','Ivyland','Arlington','Texas','USA');
insert into Employ.EmpDetails(EmployeeID,Salary,Address_1,Address_2, City,State_1,Country) values (2,1500,'Late','Street','Salt Lake City','Utah','USA');
insert into Employ.EmpDetails(EmployeeID,Salary,Address_1, City,State_1,Country) values (1,20000,'Cold','Ontario','Somewhere in','Canada');

/*Add employee Tina Smith*/
insert into Employ.Employee(FirstName, LastName, SSN, DeptID) values ('Tina','Smith','121314151',2);
insert into Employ.EmpDetails(EmployeeID,Salary,Address_1,Address_2, City,State_1,Country) values (2,1500,'Late','Street','Salt Lake City','Utah','USA');
insert into Employ.EmpDetails(EmployeeID,Salary,Address_1, City,State_1,Country) values (6,40000,'Seattle Street','Seattle','Washington','USA');

/*Add Marketing to departments*/
insert into Employ.Department(Name, Location) values ('Marketing','Union Building');

/*List all employees in marketing*/
select * from Employ.Employee where Employ.Employee.DeptId = 4;

/*Report total salary of marketing*/
select sum(Employ.EmpDetails.Salary) from Employ.Employee Inner Join Employ.EmpDetails on Employ.Employee.ID = Employ.EmpDetails.EmployeeID where Employ.Employee.DeptID = 4;

/*Report total employees by department*/
select count(Employ.Employee.ID), Employ.Employee.DeptID from Employ.Employee group by Employ.Employee.DeptID;

/*Increase Tina Smith's salary to $90000*/
update Employ.EmpDetails Set Employ.EmpDetails.Salary = 90000 where Employ.EmpDetails.EmployeeID = 6;

/*Select all rows from each table to manually observe changes in records.*/
Select * from Employ.Department;
Select * from Employ.Employee;
Select * from Employ.EmpDetails;