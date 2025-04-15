--1.	Create a stored procedure without parameters to show the number of students per department name.[use ITI DB]

create proc Shownu 
as
  select   count(St_Id) as NumberofStudent , D.Dept_Name as DepartmentName 
  from Student S inner join Department D on 
  S.Dept_Id = D.Dept_Id 
  group by Dept_Name  


  Shownu 


  --2.Create a stored procedure that will check for the # of employees in the project p1 
--if they are more than 3 print message to the user “'The number of employees in the project p1 is 3 or more'”
--if they are less display a message to the user “'The following employees work for the project p1'” 
--in addition to the first name and last name of each one. [Company DB] 

use Company_SD

alter proc CheckNumEmp @projectname varchar(20) , @Number int = null
as
    select @Number = count(Essn) from Project P inner join Works_for WF on 
	P.Pnumber = WF.Pno  inner join Employee E on WF.ESSn = E.SSN 

	if @Number > 3 
	 select 'The number of employees in the project' +@projectname  +  'is 3 or more'
	 else 
	 select'The following employees work for the project' + @projectname 

	 union all
	 select fname + ' ' + lname as Fullname from Project P 
	 inner join Works_for WF on 
	P.Pnumber = WF.Pno  inner join Employee E on WF.ESSn = E.SSN 

	CheckNumEmp 'Al Rawdah' 



	--3.Create a stored procedure that will be used in case there is an old employee has left the project 
--and a new one become instead of him. The procedure should take 3 parameters 
--(old Emp. number, new Emp. number and the project number) and it will be used to update works_on table. [Company DB]

create proc OldandNew @OldEmp int , @NewEmp int  , @ProjectNum int
as
   update Works_for 
   set @NewEmp = ESSN 
   where Pno = @pROJECTnum and ESSn = @OldEmp


  --Call  OldnewEmp ( , , )



  --4.	add column budget in project table and insert any draft values in it then 
--then Create an Audit table with the following structure 
--ProjectNo 	UserName 	ModifiedDate 	Budget_Old 	Budget_New 
--p2 	Dbo 	2008-01-31	95000 	200000

create table Audit 
(
   ProjectNo int primary key , 
   UserName varchar(100) not null , 
   ModifiedDate date , 
   Budget_Old money not null , 
   Budget_New money not null
)

--This table will be used to audit the update trials on the Budget column (Project table, Company DB)
--Example:
--If a user updated the budget column then the project number, user name that made that update, the date of the modification 
--and the value of the old and the new budget will be inserted into the Audit table
--Note: This process will take place only if the user updated the budget column


create trigger Audit_Updates
on project 
after update 
as 
    if update(budget)
	begin
	declare @old int , @new int , @projectNumber int
	select @old = budget from deleted
	select @new = budget from inserted
	select @projectNumber = Pnumber from inserted
	insert into Audit values (@ProjectNumber , SUSER_NAME() , getdate() , @old , @new)
	end


--5.Create a trigger to prevent anyone from inserting a new record in the Department table [ITI DB]
--“Print a message for user to tell him that he can’t insert a new record in that table”
use ITI

create trigger PreventInserting  
on Department
instead of insert
 as 
    select 'Can not insert new record'



--6.Create a trigger that prevents the insertion Process for Employee table in March [Company DB].
use Company_SD 

create trigger PreventDelete
on Employee 
instead of delete 
 as
    if format(getdate() , 'MM') = 'March'
	rollback


--7.	Create a trigger on student table after insert to add Row in Student Audit table (Server User Name , Date, Note)
--where note will be “[username] Insert New Row with Key=[Key Value] in table [table name]”
--Server User Name		Date 	Note 

Use ITI
Create Table Student_Audit
(
	UserName nvarchar(50) not null  ,
	ModifiedDate date  ,
	Note nvarchar(100) ,
)


create trigger InsertToAudit
on Student
after insert 
as
      insert into Student_Audit
	  values (SUSER_NAME() , getdate() , 'Insert New Row with key : '+ (select st_id from inserted) + 'in Table student')


--8.Create a trigger on student table instead of delete to add Row in Student Audit table 
--(Server User Name, Date, Note) where note will be“ try to delete Row with Key=[Key Value]”

create proc Delete_inAudit
on student 
instead of delete 
 as 
       insert into Student_Audit
	  values (SUSER_NAME() , getdate() , 'Try to delete Row With Key : '+ (select st_id from deleted) + 'in Table student')










