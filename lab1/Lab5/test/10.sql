.headers on
SELECT COUNT(*) AS cust_cnt
FROM customer
JOIN nation ON c_nationkey = n_nationkey
JOIN region ON n_regionkey = r_regionkey
WHERE r_name NOT IN ('AMERICA', 'EUROPE');
