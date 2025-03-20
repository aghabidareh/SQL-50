# Write your MySQL query statement below
select e.employee_id, e.department_id
from Employee e
join (select employee_id, count(department_id) count_dep
from Employee
group by employee_id) dop
using(employee_id)
where count_dep = 1 or
primary_flag='Y';