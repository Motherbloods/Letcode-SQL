-- https://leetcode.com/problems/customers-who-never-order/description/
select
    Customers.name as Customers
from
    Customers
    LEFT JOIN Orders ON Customers.id = Orders.customerId
WHERE
    Orders.customerId IS NULL;