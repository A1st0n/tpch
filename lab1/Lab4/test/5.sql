.headers on
SELECT n_name, COUNT(*) AS supp_cnt
FROM supplier
JOIN nation ON s_nationkey = n_nationkey
WHERE n_name IN ('JAPAN', 'CHINA')
GROUP BY n_name;
