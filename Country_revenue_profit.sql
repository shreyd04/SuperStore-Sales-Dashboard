SELECT
category,
country,
profit,
sales
FROM SS_sales
WHERE category = 'Furniture' AND year = '2014'
ORDER BY profit DESC;