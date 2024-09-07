--https://leetcode.com/problems/employee-bonus/description/
select
    Employee.name as name,
    Bonus.bonus as bonus
from
    Employee
    left join bonus on Bonus.empId = Employee.empId
where
    Bonus.bonus < 1000
    or Bonus.bonus is null