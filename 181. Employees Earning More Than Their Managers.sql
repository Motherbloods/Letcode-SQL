-- https://leetcode.com/problems/employees-earning-more-than-their-managers/description/

select name as Employee from Employee where Employee.Salary > (select Salary from Employee as dua where dua.id = Employee.managerId)