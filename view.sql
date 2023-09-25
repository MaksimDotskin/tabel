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
