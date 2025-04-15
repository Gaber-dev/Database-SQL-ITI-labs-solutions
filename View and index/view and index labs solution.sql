use iti

--1.	 Create a view that displays student full name, course name if the student has a grade more than 50. 
create view View_Info
as 
  select S.St_Fname + ' ' + S.St_Lname as Fullname , Crs_Name , C.Grade as Grade
  from Student S inner join Stud_Course C on S.St_Id = C.St_Id  and Grade>50
                 inner join Course  on C.Crs_Id = course.Crs_Id


				 select * from View_Info 


--2.Create an Encrypted view that displays manager names and the topics they teach.
create view Manager_Details
with encryption
as
select I.Ins_Name as ManagerName , T.Top_Name as TopicName from Department D
inner join Instructor I on D.Dept_Manager = I.Ins_Id 
inner join Ins_Course IC on I.Ins_Id = IC.Ins_Id
inner join Course C on IC.Crs_Id = C.Crs_Id
inner join Topic T on C.Top_Id = T.Top_Id   -- Instructor ==> Instructor course ==> course ==> Topic

select * from Manager_Details


--3.Create a view that will display Instructor Name, Department Name for the ‘SD’ or ‘Java’ Department
create view Displayinfo
as
select I.Ins_Name as InstructorName , D.Dept_Name as DepartmentName
from Instructor I inner join Department D on I.Dept_Id = D.Dept_Id 
and Dept_Name in ('SD' , 'Java')

select * from Displayinfo


--4.Create a view “V1” that displays student data for student who lives in Alex or Cairo. 
--Note: Prevent the users to run the following query 
--Update V1 set st_address=’tanta’
--Where st_address=’alex’;

alter view V1
with encryption
as 
   select * from student where St_Address in ('Alex' , 'Cairo')
   

   update V1 
   set st_address='tanta'
   where St_Address = 'alex'


   select * from V1

   -------------------------------------------------------------------------------------------------
   
--5.Create a view that will display the project name and the number of employees work on it. “Use Company DB”
use Company_SD
create view DisplayProjInfo
as
select P.Pname as ProjectName , count(SSN) as NumberofEmployee from Project P inner join Works_for WF
on P.Pnumber = WF.Pno inner join Employee E on WF.ESSn = E.SSN
group by Pname

select * from DisplayProjInfo


----6.	Create the following schema and transfer the following tables to it 
--1.	Company Schema 
--2.	Department table (Programmatically)
--3.	Project table (by wizard)
--4.	Human Resource Schema
--5.	  Employee table (Programmatically)

create schema Company
alter schema Company transfer Department
create schema HR
alter schema HR transfer Employee

----------------------------------------------------------------------------------------------------
use iti
--7.Create index on column (manager_Hiredate) that allow u to cluster the data in table Department. What will happen?
create nonclustered index M_hiredate on Department(manager_Hiredate) -- No clustere index will happen because it have already primary key on table


--8.	Create index that allow u to enter unique ages in student table. What will happen?
Create unique index Unique_Age on Student(st_age)   --duplicate key was found for the object name 'dbo.Student'


