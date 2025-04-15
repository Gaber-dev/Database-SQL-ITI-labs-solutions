use iti
--1.Create a scalar function that takes date and returns Month name of that date.

create function GETmonth(@Date date)
returns nvarchar(10)
begin
  declare @nameofmonth nvarchar(10)
  set @nameofmonth = format(@Date , 'MM')
  return @nameofmonth

end
select dbo.GETmonth('11-29-2002') --Calling scalar function==> [must set dbo.methodname()]



--2.Create a multi-statements table-valued function that takes 2 integers and returns the values between them.
create function valuesbetw(@v1 int , @v2 int)
returns @t table 
(
  betweenthem int
)

    as 
begin
     while @v1+1 < @v2 
      begin
      set @V1+=1
      INSERT into @t
      select @v1
       end
return
end

select*from valuesbetw(3 , 7) -- Calling


--3.Create inline function that takes Student No and returns Department Name with Student full name.

create function studfull(@st_number int)
returns table
as return
(
   select D.Dept_Name , S.St_Fname + ' ' + S.St_Lname as Fullname
   from student S
   left join Department D on S.Dept_Id = D.Dept_Id and S.Dept_Id = @st_number
)

select * from dbo.studfull(2)


 /*4.Create a scalar function that takes Student ID and returns a message to user 
    1.If first name and Last name are null then display 'First name & last name are null'
   2.If First name is null then display 'first name is null'
    3.If Last name is null then display 'last name is null'
    4.Else display 'First name & last name are not null'   */

	create function messageuser(@st_id int)
	returns varchar(100)

	begin

	declare @message varchar(100)
	declare @Firstname varchar(100)
	declare @Lastname varchar(100)

	select @Firstname = st_fname , @Lastname = st_lname from student where st_id = @st_id 
	
	if @Firstname is null and @Lastname is null 
	set @message = 'First name & last name are null'
	
	else if @Firstname is null  
	set @message = 'first name is null'
	
	else if @Lastname is null  
	set @message = 'last name is null'
	
	else 
	set @message = 'First name & last name are not null'
	
	return @message
	
	end

	select dbo.messageuser(1) --Calling



	---5.	Create inline function that takes integer which represents manager ID 
	--and displays department name, Manager Name and hiring date 

	create function DETAILSmanager(@managerID int)
	returns table
	as return
	(
	 select D.Dept_Name , I.Ins_Name , D.Manager_hiredate
	 from Department D inner join Instructor I on
	 D.Dept_Manager = I.Ins_Id and D.Dept_Manager = @managerID

	)
	select* from dbo.DETAILSmanager(2)


	 /* 6.	Create multi-statements table-valued function that takes a string
If string='first name' returns student first name
If string='last name' returns student last name 
If string='full name' returns Full Name from student table 
Note: Use “ISNULL” function  */


     create function GETNAME(@string nvarchar(100))
	 returns @t table 
	 (
	   studentname varchar(100)
	 )
	 as 
	 begin
	 if @string = 'first name'
	 insert into @t
	 select isnull(st_fname , 'first name') from Student

	 else if @string = 'last name'
	  insert into @t
	 select isnull(st_lname , 'last name')from Student

	 else if @string = 'full name'
	  insert into @t
	 select isnull(st_fname + ' ' + st_lname , 'full name')from Student

	 return

	 end

	 select * from GETNAME('first name')





	 --7.	Write a query that returns the Student No and Student first name without the last char

	 select st_id as 'Student No' , SUBSTRING(St_Fname , 0, len(st_Fname)) from Student -- 0 here mean start from index 0 in char

	 ----8.	Wirte query to delete all grades for the students Located in SD Department

	 delete Stud_Course from Stud_Course inner join student S on Stud_Course.St_Id = S.St_Id 
	 inner join Department D on S.Dept_Id = D.Dept_Id
	 where D.Dept_Name = 'SD'

