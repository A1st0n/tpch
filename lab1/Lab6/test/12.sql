.headers on
SELECT COUNT(*) AS part_cnt
FROM (
    SELECT ps_partkey
    FROM partsupp
    JOIN supplier ON s_suppkey = ps_suppkey
    JOIN nation ON n_nationkey = s_nationkey
    WHERE n_name = 'UNITED STATES'
    GROUP BY ps_partkey
    HAVING COUNT(*) = 1);
