use AdventureWorks2019

with cte as (select BusinessEntityID,JobTitle,NationalIDNumber from HumanResources.Employee
where VacationHours<(select AVG(VacationHours) from HumanResources.Employee)),
ctedepartamento as (select D.Name,EDH.BusinessEntityID 
from HumanResources.EmployeeDepartmentHistory EDH, HumanResources.Department  D
where D.DepartmentID=EDH.DepartmentID)
select cte.BusinessEntityID,P.FirstName,P.LastName,cte.JobTitle,ctedepartamento.Name from cte
join Person.Person P 
on cte.BusinessEntityID=P.BusinessEntityID
join ctedepartamento
on ctedepartamento.BusinessEntityID=cte.BusinessEntityID



select * from HumanResources.EmployeeDepartmentHistory,HumanResources.Shift
where HumanResources.EmployeeDepartmentHistory
