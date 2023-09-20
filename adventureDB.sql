-- 32 Mitme avaldisega tabeliväärtusega funktsioonid
create Function fn_ILTVF_GetEmployees()

Returns Table 
as
Return(select EmployeeKey as id,FirstName,CAST(BirthDate as date)as DOB 
	From DimEmployee)


create Function fn_MSTVF_GetEmployees()

Returns @Table Table (id int,Name varchar(20),DOB Date)
as
Begin
Insert into @Table
select EmployeeKey as id,FirstName,CAST(BirthDate as Date)
from DimEmployee

return
End

Select * from fn_ILTVF_GetEmployees()
Select * from fn_MSTVF_GetEmployees()


update fn_ILTVF_GetEmployees() set Firstname='Sam1' where id=1;

-- 33 Funktsiooniga seotud tähtsad kontseptsioonid

alter function fn_GetEmployeeNameByld(@id int)

returns nvarchar(20)
with encryption
as
begin
return (select FirstName from DimEmployee where EmployeeKey=@id)
end


alter function fn_GetEmployeeNameByld(@id int)

returns nvarchar(20)
with SchemaBinding
as
begin
return (select FirstName from dbo.DimEmployee where EmployeeKey=@id)
end


create function fn_GetEmployeeNameByld(@id int)

returns nvarchar(20)
as
begin
return (select FirstName from DimEmployee where EmployeeKey=@id)
end


--34 Ajutised tabelid
--lokaalne autine tabel
create procedure spCreateLocalTempTable
as
begin
Create table #PersonDetails(id int,Name nvarchar(20))

insert into #PersonDetails values(1,'Mike')
insert into #PersonDetails values(2,'Max')
insert into #PersonDetails values(3,'Bogdan')

select * from #PersonDetails;
end

--globaalne
create table ##EmployeeDetails(id int,Name nvarchar(20))

--35 Ineksid serveris

alter table DimEmployee
add Salary int;

UPDATE DimEmployee
SET Salary = 4000
WHERE EmployeeKey = 1;jne

select * from DimEmployee where Salary>5000 and Salary<7000;

create index IX_tbEmployee_Salary
on DimEmployee(salary ASC)

















