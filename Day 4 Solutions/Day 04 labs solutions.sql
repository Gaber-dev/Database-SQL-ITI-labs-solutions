-- 1.	Display (Using Union Function)
/*a.	 The name and the gender of the dependence that's gender is Female and depending on Female Employee.
b.	 And the male dependence that depends on Male Employee.
*/
select D.Dependent_name , D.Sex
from Dependent D inner join Employee E
on E.SSN = D.ESSN and E.Sex = 'F'
and D.Sex = 'F'
union all
select D.Dependent_name , D.Sex 
from Dependent D inner join Employee E 
on E.SSN =D.ESSN and E.Sex = 'M' 
and D.Sex = 'M'

-- 2.	For each project, list the project name and the total hours per week (for all employees) spent on that project.

select P.Pname , sum(WF.Hours)
from Project P left join Works_for WF 
on P.Pnumber = WF.Pno 
group by Pname

--3.	Display the data of the department which has the smallest employee ID over all employees' ID.

select D.*
from Departments D left join Employee E 
on D.Dnum = E.Dno where
E.SSN = (select min(SSN) from Employee)

-- 4.	For each department, retrieve the department name and the maximum, minimum and average salary of its employees.

select D.Dname , D.Dnum ,  min(Salary) , max(salary) , Avg(Salary)
from Departments D left join Employee E
on D.Dnum = E.Dno
group by D.Dname , D.Dnum

--5.	List the full name of all managers who have no dependents.

select Fname +' '+Lname as fullname , SSN FROM Employee a inner join Departments b
on a.SSN = b.MGRSSN 
and not exists (select * from Dependent where b.MGRSSN = Dependent.ESSN)

-- 6.	For each department-- if its average salary is less than the average salary of all employees-- display its number, name and number of its employees.

 select D.Dnum  , D.Dname , count(E.SSN) , Avg(salary)
 from Departments D left join Employee E 
 on D.Dnum = E.Dno 
 group by D.Dnum , D.Dname
 having Avg(salary) < (select avg(salary) from Employee)
 
 --7.	Retrieve a list of employees names and the projects names they are working on ordered by department number and within each department, ordered alphabetically by last name, first name.
 select fname + ' ' + lname As fullname , Pname , Dno
 from Employee E inner join Works_for WF 
 on E.SSN =WF.ESSn inner join Project P
 on WF.Pno = P.Pnumber  inner join Departments D
 on P.Dnum = D.Dnum
 order by lname , fname , D.Dname

 --8.	Try to get the max 2 salaries using subquery

 select top(2)salary as maxSalary from Employee 
where salary in (select max(salary) from Employee group by Dno) 
order by maxSalary  

--9.	Get the full name of employees that is similar to any dependent name
select distinct  E.Fname + ' ' + E.Lname
from Employee E inner join Dependent D
on E.SSN = D.ESSN 
and D.Dependent_name like '%'+Fname +' '+Lname+'%'

--10.	Display the employee number and name if at least one of them have dependents (use exists keyword) self-study.
select Fname +' '+Lname as name ,SSN FROM Employee a 
where  exists (select * from Dependent where a.SSN = Dependent.ESSN)

--11.	In the department table insert new department called "DEPT IT" , with id 100, employee with SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'
insert into Departments 
values('DEPT IT',100,112233,'1-11-2006')

/*12.	Do what is required if you know that : Mrs.Noha Mohamed(SSN=968574)  moved to be the manager of the new department (id = 100), and they give you(your SSN =102672) her position (Dept. 20 manager) 

a.	First try to update her record in the department table
b.	Update your record to be department 20 manager.
c.	Update the data of employee number=102660 to be in your teamwork (he will be supervised by you) (your SSN =102672)
*/

update Departments
set MGRSSN = 968574
,[MGRStart Date]=GETDATE()
where Dnum =100
update Departments
set MGRSSN = 102672
,[MGRStart Date]=GETDATE()
where Dnum =20
update Employee
set Dno = 20
where SSN=102672
update Employee
set Superssn = 102672
where SSN=102660


/*13.	Unfortunately the company ended the contract with Mr. Kamel Mohamed (SSN=223344) so try to delete his data from your database in case you know that you will be temporarily in his position.
Hint: (Check if Mr. Kamel has dependents, works as a department manager, supervises any employees or works in any projects and handle these cases).
*/
delete from Dependent where ESSN=223344
update Departments
set MGRSSN = 102672
where MGRSSN =223344
update Employee
set Superssn = 102672
where Superssn =223344
update Works_for
set ESSn = 102672
where ESSn =223344
delete from Employee where SSN=223344


--14.	Try to update all salaries of employees who work in Project ‘Al Rabwah’ by 30%
update Employee 
set Salary += Salary*.3
from Employee e inner join Works_for w on e.SSN= w.ESSn inner join Project p 
on p.Pnumber = w.Pno and p.Pname='Al Rabwah'
