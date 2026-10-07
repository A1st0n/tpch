.headers on
SELECT r_name, MAX(s_acctbal) AS max_bal
FROM supplier
JOIN nation ON s_nationkey = n_nationkey
JOIN region ON n_regionkey = r_regionkey
GROUP BY r_name
HAVING MAX(s_acctbal) > 9000;
