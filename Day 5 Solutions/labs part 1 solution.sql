use ITI

--1.	Retrieve number of students who have a value in their age. 
select count(St_id) 
from Student 
where St_Age is not null

-- 2.	Get all instructors Names without repetition
select distinct Ins_Name
from instructor 

-- --3.	Display student with the following Format (use isNull function)
--Student ID	Student Full Name	Department name

select St_id as 'Student ID' , isnull(St_fname + ' ' + St_lname , 'Student Full Name') as 'Student Full name' ,D.Dept_Name  as 'Department Name'
from Student S inner join Department  D
on S.Dept_Id = D.Dept_Id

----4.	Display instructor Name and Department Name 
--Note: display all the instructors if they are attached to a department or not

select Ins_Name  , D.Dept_Name from Instructor I 
left join Department D on 
I.Dept_Id = D.Dept_Id

-- --5.	Display student full name and the name of the course he is taking
--For only courses which have a grade 

select  S.St_Fname + ' ' + S.St_Lname as 'Full name' , Crs_Name as 'Course Name' 
from Student S inner join Stud_Course SC on
S.St_Id = SC.St_Id  inner join Course  C
on SC.Crs_Id = C.Crs_Id and Grade is not null 

--6.Display number of courses for each topic name

select count(Crs_Id) , Top_Name 
from Course C inner join Topic T on
C.Top_Id = T.Top_Id 
group by Top_Name

----7.	Display max and min salary for instructors
select max(salary) as 'Max Salary' , min(salary) as 'Minimum salary' 
from Instructor

-- 8.	Display instructors who have salaries less than the average salary of all instructors.

select*
from instructor 
where salary <(select avg(salary) from Instructor)

--9.	Display the Department name that contains the instructor who receives the minimum salary.

select D.Dept_Name as'Department Name' 
from Department D inner join Instructor I on
D.Dept_Id = I.Dept_Id and salary = (select min(salary) from Instructor)


--10.Select max two salaries in instructor table.

select top(2) salary
from Instructor 
order by Salary desc

----11.	 Select instructor name and his salary but if there is no salary display instructor bonus keyword. “use coalesce Function”

select Ins_Name as 'Instructor Name' , coalesce (convert (nvarchar(20) ,salary) , 'Instructor Bonus' )as 'Salary'
from Instructor

--12.	Select Average Salary for instructors

select avg(salary) as 'Average Salary'
from Instructor

--13.	Select Student first name and the data of his supervisor

select S.St_Fname as 'Student first name' , super.*from Student  S inner join student super
on S.St_super  = super.St_Id

--14.	Write a query to select the highest two salaries in Each Department for instructors who have salaries. “using one of Ranking Functions”

select*from(select * , Row_Number()over (partition by Dept_Id order by salary) as RK from Instructor 
where salary is not null) as NewTable where RK<=2


--15.	 Write a query to select a random  student from each department.  “using one of Ranking Functions”

select*from(select * , rank() over(partition by Dept_Id order by newid()) as Rk from Student) as NewTable where RK<2