.headers on
SELECT s_name, s_acctbal 
FROM supplier 
JOIN nation ON s_nationkey = n_nationkey 
JOIN region ON n_regionkey = r_regionkey WHERE r_name = 'ASIA' AND s_acctbal > 5000;
