.headers on
SELECT r_name AS region, COUNT(*) AS cust_cnt
FROM customer
JOIN nation 
ON c_nationkey = n_nationkey
JOIN region 
ON n_regionkey = r_regionkey
WHERE c_acctbal > (SELECT AVG(c_acctbal) FROM customer)
  AND c_custkey IN (SELECT o_custkey FROM orders)
GROUP BY r_name;
