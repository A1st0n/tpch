.headers on
SELECT COUNT(*) AS suppliers_cnt
FROM (
    SELECT ps_suppkey
    FROM partsupp
    JOIN supplier ON s_suppkey = ps_suppkey
    JOIN nation ON n_nationkey = s_nationkey
    WHERE n_name = 'PERU'
    GROUP BY ps_suppkey
    HAVING COUNT(DISTINCT ps_partkey) > 40);
