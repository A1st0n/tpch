.headers on
SELECT n_name, SUM(s_acctbal) 
AS total_acct_bal 
FROM supplier 
JOIN nation 
ON s_nationkey = n_nationkey 
GROUP BY n_name;
