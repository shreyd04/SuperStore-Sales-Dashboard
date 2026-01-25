CREATE TABLE operating_profit_margin AS
SELECT
year,
category,
SUM(sales) AS total_revenue,
SUM(profit) AS total_profit,
SUM(sales) - SUM(profit) AS cogs,
SUM(shipping_cost) AS total_shipping_cost,
SUM(sales) - SUM(profit) - SUM(shipping_cost) AS operating_profit
FROM SS_sales
GROUP BY
year , category
ORDER BY year ASC;

-- Operating profit margin percentage
SELECT
year,
category,
SUM(sales) AS total_revenue,
SUM(profit) AS total_profit,
SUM(sales) - SUM(profit) AS cogs,
SUM(shipping_cost) AS total_shipping_cost,
SUM(sales) - SUM(profit) - SUM(shipping_cost) AS operating_profit,
CASE
    WHEN SUM(sales) = 0 THEN 0
    ELSE (SUM(sales) - SUM(profit) - SUM(shipping_cost)) / SUM(sales) * 100
END AS operating_profit_margin_percentage
FROM SS_sales
GROUP BY
year , category
ORDER BY year ASC;

SELECT
SUM(operating_profit) AS total_operating_profit
FROM operating_profit_margin
WHERE year = '2014'