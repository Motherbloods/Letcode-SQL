-- https://leetcode.com/problems/department-top-three-salaries/description/

# Write your MySQL query statement below

select Department.name as Department, Employee.name as Employee, Employee.salary as Salary from Employee inner join Department on Department.id = Employee.departmentId where (Employee.departmentId,Employee.salary) in (
    select e.departmentId, e.salary from Employee e where(
        select count( distinct e2.salary)
        from Employee e2 where e2.departmentId = e.departmentId and e2.salary >= e.salary
    ) <=3
)

--claude
WITH RankedSalaries AS (
    SELECT 
        e.departmentId,
        e.name AS Employee,
        e.salary AS Salary,
        d.name AS Department,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS salary_rank
    FROM 
        Employee e
    JOIN 
        Department d ON e.departmentId = d.id
)
SELECT 
    Department,
    Employee,
    Salary
FROM 
    RankedSalaries
WHERE 
    salary_rank <= 3
ORDER BY 
    Department, Salary DESC, Employee