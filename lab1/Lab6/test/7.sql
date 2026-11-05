.headers on
SELECT strftime('%m', l_shipdate) AS month, SUM(l_quantity) 
AS tot_month
FROM lineitem
WHERE strftime('%Y', l_shipdate) = '1997'
GROUP BY month;
