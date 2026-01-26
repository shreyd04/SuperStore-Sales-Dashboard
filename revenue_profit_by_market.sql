SELECT
market,
SUM(sales) AS total_sales_market,
SUM(profit) AS total_profit_market,
SUM(sales) - SUM(profit) AS COGS_market,
CASE
    WHEN SUM(sales) = 0 THEN 0
    ELSE SUM(profit) / SUM(sales) * 100 
END AS profit_margin_market
FROM SS_sales
GROUP BY
market
ORDER BY market ASC;