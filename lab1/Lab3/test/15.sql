.headers on
SELECT SUM(c_acctbal) AS tot_acct_bal FROM customer JOIN nation ON c_nationkey = n_nationkey 
JOIN region ON n_regionkey = r_regionkey 
WHERE r_name = 'AMERICA' AND c_mktsegment = 'FURNITURE';
