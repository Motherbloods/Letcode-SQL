--https://leetcode.com/problems/department-highest-salary/description/
SELECT
    Department.name AS Department,
    Employee.name AS Employee,
    Employee.salary As Salary
FROM
    Employee
    INNER JOIN Department ON Department.id = Employee.departmentId
WHERE
    Employee.salary >= (
        SELECT
            Max(e2.salary)
        FROM
            Employee e2
        WHERE
            e2.departmentId = Employee.departmentId
    )
    --dari claude menggunakan IN
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM
    Employee e
    JOIN Department d ON e.departmentId = d.id
WHERE
    (e.departmentId, e.salary) IN (
        SELECT
            departmentId,
            MAX(salary)
        FROM
            Employee
        GROUP BY
            departmentId
    )
ORDER BY
    d.name,
    e.name