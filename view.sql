create view vWemployeeByDepartment
as
select id,Name,Salary,Gender,DeptName
from tblEmployee
join tblDepartment
on tblemployee.Departmentid=tblDepartment.Deptid

create View vWDepartment_Employees
as
select id,name,Salary,gender,DeptName
from tblEmployee
join tblDepartment
on tblEmployee.Departmentid=tblDepartment.Deptid
where tblDepartment.DeptName='IT'

create View vWEEmployeesNonConfidentialData
as
select id,name,gender,DeptName
from tblEmployee
join tblDepartment
on tblEmployee.Departmentid=tblDepartment.Deptid

create View vWEEmployeesCountByDepartment
as
select DeptName,count(id) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.Departmentid=tblDepartment.Deptid
group by deptNAme

create view vWEmployeesDataExpectSalary
as
select id,name,gender,departmentid
from tblEmployee

create view vWEmployeesDetailsByDepartment
as
select id,Name,Salary,gender,deptName
from tblEmployee
join tblDepartment
on tblEmployee.Departmentid=tblDepartment.Deptid

create view [dbo].[vWTotalSalesByProduct]
with sChemaBinding
AS
select Name,
sum(isnull((QuantitySold*UnitPrice),0))as TotalSales,
count_big(*) as TotalTransactions
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.Productid=dbo.tblProductSales.Productid
group by Name
GO

--Vigad view
Create View vWEmployeeDetails
@Gender nvarchar(20)
as
Select Id, Name, Gender, DepartmentId
from  tblEmployee
where Gender = @Gender
create view vWEmployeeDetails
@Gender nvarchar(30)
as
select id,_Name,Gender,Departmentid
from tblEmployee
where Gender= @Gender

Create View vWEmployeeDetailsSorted
as
Select Id, Name, Gender, DepartmentId
from tblEmployee
order by Id

Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable
