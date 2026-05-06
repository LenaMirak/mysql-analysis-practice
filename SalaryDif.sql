-- max salary in marketing dep
with markMaxSal as (select d.department, max(emp.salary) as MaxSalary_mark
from db_employee  emp
inner join db_dept d
on emp.department_id = d.id
where d.department = "marketing"),

-- max salary in engeeniring g dep
engMaxSal as (select d.department, max(emp.salary) as MaxSalary_eng
from db_employee  emp
inner join db_dept d
on emp.department_id = d.id
where d.department = "engineering")

select markMaxSal.MaxSalary_mark - engMaxSal.MaxSalary_eng
from markMaxSal, engMaxSal;