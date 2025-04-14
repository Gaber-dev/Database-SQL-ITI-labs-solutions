--- 1:Display the Department id, name and id and the name of its manager.
select Dnum , Dname , ssn , Fname + ' '+ Lname as Name
from Departments inner join Employee
on Employee.SSN = Departments.MGRSSN


---2.	Display the name of the departments and the name of the projects under its control.
select  Dname , Pname 
from Departments inner join  Project
on  Project.Dnum = Departments.Dnum


--- 3.	Display the full data about all the dependence associated with the name of the employee they depend on him/her.
select D.* , fname + ' ' + lname as fullname 
from Dependent D left outer join Employee E
on D.ESSN = E.SSN

--4.	Display the Id, name and location of the projects in Cairo or Alex city.
select pnumber , pname , plocation 
from project 
where city in ('Cairo','Alex')

--5.Display the Projects full data of the projects with a name starts with "a" letter.
select P.*
from Project P where pname like 'a%'

--6.display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
select* 
from Employee 
where Dno=30 and salary between 1000 and 2000

--7.	Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.
select fname + '  ' + lname as Name
from Employee E inner join Works_for WF
on E.SSN = WF.ESSn and hours >=10 
inner join Project P
on P.Pnumber = WF.Pno and P.Pname = 'AL Rabwah'


-- 8.Find the names of the employees who directly supervised with Kamel Mohamed.
select a.fname + ' '+ a.lname as Name 
from Employee a , Employee b
where a.Superssn = b.SSN
and b.Fname + ' ' + b.Lname = 'Kamel Mohamed'



--9.	Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
select Fname +' '+Lname AS FULlname ,Pname  
from Employee E inner join Works_for WF
on E.SSN = WF.ESSn inner join Project P 
on P.Pnumber = WF.Pno
order by Pname 

--10.For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.

select pnumber , Dname , Lname , Address , Bdate 
from  Project P inner join Departments D
on  P.Dnum = D.Dnum and city = 'Cairo'
inner join Employee E
on E.SSN = D.MGRSSN


-- 11. Display All Data of the managers

select a.* 
from   Employee a ,   Departments b 
where a.SSN = b.MGRSSN

-- 12.	Display All Employees data and the data of their dependents even if they have no dependents

select  E.*  , D.*
from Employee E left join Dependent D
on  E.SSN = D.ESSN

--13.	Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233, salary=3000.

insert into Employee([Fname],[Lname],[SSN],[Bdate],[Address],[Sex],[Salary],[Superssn],[Dno])
Values('Aya','Kenawy',102672,'04-04-1990','PTS','F',3000,112233,30)


--14.	Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, but don’t enter any value for salary or supervisor number to him.
insert into Employee  
([Fname],[Lname],[SSN],[Bdate],[Address],[Sex],[Dno])
VALUES('Omnya','Ahmed',102660,'03-05-1992','PTS','F',30)

--15.	Upgrade your salary by 20 % of its last value.

update Employee
set Salary+=Salary*.2
where SSN = 112233