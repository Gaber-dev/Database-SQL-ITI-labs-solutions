create database mydb2 -- i created it using wizard but i want to apply using code else

create Table Employee(
   FName varchar(20),
   LName varchar(20),
   SSN int primary key , 
   BDate Date,
   Address varchar(20),
   SEX varchar (10),
   Salary money ,
   SuperSSN int foreign key REFERENCES Employee(SSN),
   DNO int --foreign key REFERENCES Department(DNumber)
)





create table Department
(
   Dname varchar(30),
   DNumber int primary key,
   MGRSSN int foreign key REFERENCES Employee(SSN)
)

--Add constrains to Employee table
Alter table Employee
Add constraint FK_Employee_Department
    Foreign key(DNO) REFERENCES Department(DNumber)



create table DEPT_LOCATIONS(
   DNumber int foreign key REFERENCES Department(DNumber),
   DLocation varchar(50),
   primary key(DNumber , DLocation)
)



create table Project(
  PName varchar(20),
  PNumber int primary key,
  Plocation varchar(20),
  DNum int REFERENCES Department(DNumber)
)


create table WORKS_ON(
  ESSN int foreign key REFERENCES Employee(SSN),
  PNO int foreign key REFERENCES Project(PNumber),
  Hours int ,
  primary key (ESSN , PNO)
)



create table Dependent(
  ESSN int foreign key REFERENCES Employee(SSN),
  Dependent_Name varchar(30),
  SEX varchar(10),
  BDate date,
  Relationship varchar(15),
  primary key(ESSN ,Dependent_Name)
)

select * from Employee

-----------------------------------------------------------

--insert
insert into Department 
values('CS' , '1' , Null)

update Department
set MGRSSN = 1001
where Dname='CS'


insert into Employee 
values('Gaber' , 'Mohamed' , 1001 , '11-29-2002' , 'Alexandria' , 'Male' , '25000' , NULL ,1)



INSERT INTO Employee (FName, LName, SSN, BDate, Address, SEX, Salary, SuperSSN, DNO)
VALUES 
('Bob', 'Johnson', 1002, '1990-05-12', 'Alexandria', 'M', 3000, 1001, 1),
('Carol', 'Brown', 1003, '1992-03-20', 'Giza', 'F', 3200, 1001, 1);



INSERT INTO DEPT_LOCATIONS (DNumber, DLocation)
VALUES 
(1, 'Cairo'),
(1, 'Alexandria');


INSERT INTO Project (PName, PNumber, PLocation, DNum)
VALUES 
('Payroll System', 2001, 'Cairo', 1),
('Hiring App', 2002, 'Giza', 1);


insert into WORKS_ON
values(1002 , 2001 , 4),
(1003 , 2002 , 5),
(1001 , 2001 , 2)

insert into Dependent
values(1001 , 'Marawan Gaber' , 'Male' , '05-05-2024' , 'Father'),
(1002 , 'Mark boob' , 'Male' , '05-05-2022' , 'Father');


select * from Employee
select * from Department
select * from DEPT_LOCATIONS
select * from Project
select * from WORKS_ON
select * from Dependent