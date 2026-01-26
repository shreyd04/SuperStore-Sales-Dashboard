SELECT 
SUM(shipping_cost) AS total_shipping_cost,
SUM(profit) AS total_profit,
category
FROM SS_sales
GROUP BY
category
ORDER BY
category ASC;