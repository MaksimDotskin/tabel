create Clustered Index IX_tblEmployee_Name
on tblEmployee(Name)


create clustered index IX_tblEmployee_Gender_Salary
on tblEmployee(gender desc, Salary ASC)

create NonClustered index IX_tblEmployee_Name
on tblEmployee(Name)
  
Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)
create unique nonclustered index UIX_tblemployee_FirstName_LastName
on tblEmployee(First_name,Last_name)
ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)

alter table tblEmployee
add constraint UQ_tblEmployee_City
unique nonclustered(City)

CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY
create unique index IX_tblEmployee_City
on tblEmployee(City)
with ignore_dup_key

create nonclustered index IX_tblEmployee_Salary
on tblEmployee(Salary Asc)

select Salary,count (Salary) as total
from tblEmployee
group by Salary

