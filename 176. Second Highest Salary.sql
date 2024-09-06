-- https://leetcode.com/problems/second-highest-salary/description/

-- # Write your MySQL query statement below
select ifnull((select salary  from Employee order by salary desc limit 1,1), null) as SecondHighestSalary