-- https://leetcode.com/problems/nth-highest-salary/description/
CREATE FUNCTION getNthHighestSalary (N INT) RETURNS INT BEGIN DECLARE result INT;

SET
  N = N - 1;

SELECT DISTINCT
  salary INTO result
FROM
  Employee
ORDER BY
  salary DESC
LIMIT
  N, 1;

RETURN IFNULL (result, NULL);

END;