SELECT 
segment,
SUM(sales) AS total_sales_segment,
SUM(profit) AS total_profit_segment,
CASE
    WHEN SUM(sales) = 0 THEN 0
    ELSE SUM(profit) / SUM(sales) * 100 
END AS profit_margin_segment
FROM SS_sales
GROUP BY
segment
ORDER BY segment ASC;