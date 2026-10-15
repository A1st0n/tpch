.headers on
SELECT n_name AS country,
  (SELECT COUNT(*) FROM customer WHERE c_nationkey = n_nationkey) AS cust_cnt,
  (SELECT COUNT(*) FROM supplier WHERE s_nationkey = n_nationkey) AS supp_cnt
FROM nation
JOIN region ON n_regionkey = r_regionkey
WHERE r_name = 'ASIA'
ORDER BY n_name;
