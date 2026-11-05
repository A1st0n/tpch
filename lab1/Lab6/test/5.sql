.headers on

SELECT COUNT(*) AS customer_cnt
FROM (
    SELECT o_custkey
    FROM orders
    WHERE strftime('%Y-%m', o_orderdate) = '1995-11'
    GROUP BY o_custkey
    HAVING COUNT(*) <= 3);
