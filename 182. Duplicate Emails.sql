--https://leetcode.com/problems/duplicate-emails/
select DISTINCT
    email
from
    Person
group by
    email
having
    count(email) > 1