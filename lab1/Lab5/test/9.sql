.headers on
SELECT r.r_name AS region, COUNT(*) AS supp_cnt
FROM supplier
JOIN nation ON s_nationkey = n_nationkey
JOIN region r ON n_regionkey = r.r_regionkey
WHERE s_acctbal > (SELECT AVG(s2.s_acctbal) FROM supplier s2
                   JOIN nation n2 ON s2.s_nationkey = n2.n_nationkey
                   WHERE n2.n_regionkey = r.r_regionkey)
GROUP BY r.r_name;
