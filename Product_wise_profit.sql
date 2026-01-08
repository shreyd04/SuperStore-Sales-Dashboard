SELECT DISTINCT
category,
product_name,
sales_year,
profit
FROM Product_Profit
WHERE category = 'Furniture'
AND sales_year = 2015

CREATE TABLE ProductProfit_original AS
SELECT 
s.*,
p.sales_year,
p.profit
FROM Product_Profit p
JOIN SS_sales s USING (category, product_name)
ORDER BY profit ASC;
DROP TABLE IF EXISTS ProductProfit_original;

SELECT 
    product_name, 
    COUNT(*) AS product_count
FROM SS_sales
GROUP BY product_name
ORDER BY product_count DESC;

SELECT 
    category,
    product_name,
    sales_year,
    SUM(profit) AS total_yearly_profit,
    COUNT(*) AS product_count
FROM ProductProfit_original
GROUP BY category, product_name, sales_year
ORDER BY sales_year ASC , total_yearly_profit DESC , product_count ASC;

WITH ProductRanks AS (
    SELECT 
        sales_year,
        category,
        product_name,
        SUM(profit) AS total_profit,
        COUNT(*) AS transaction_count,
        -- Rank 1 for Highest Profit
        RANK() OVER(PARTITION BY EXTRACT(YEAR FROM order_date), category 
                    ORDER BY SUM(profit) DESC) as rank_highest,
        -- Rank 1 for Lowest Profit
        RANK() OVER(PARTITION BY EXTRACT(YEAR FROM order_date), category 
                    ORDER BY SUM(profit) ASC) as rank_lowest
    FROM ProductProfit_original
    GROUP BY sales_year, category, product_name , order_date
)
SELECT 
    sales_year,
    category,
    product_name,
    total_profit,
    transaction_count,
    CASE 
        WHEN rank_highest = 1 THEN 'Highest Profit'
        WHEN rank_lowest = 1 THEN 'Lowest Profit'
    END AS performance_label
FROM ProductRanks
WHERE rank_highest = 1 OR rank_lowest = 1
ORDER BY sales_year ASC, category, total_profit DESC;

WITH ProductRanks AS (
    SELECT 
        sales_year,
        category,
        product_name,
        COUNT(*) AS number_of_sales, 
        RANK() OVER(PARTITION BY EXTRACT(YEAR FROM order_date), category 
                    ORDER BY SUM(profit) DESC) as rank_highest,
        RANK() OVER(PARTITION BY EXTRACT(YEAR FROM order_date), category 
                    ORDER BY SUM(profit) ASC) as rank_lowest
    FROM ProductProfit_original
    GROUP BY sales_year, category, product_name, order_date
)
SELECT 
    sales_year,
    category,
    product_name,
    number_of_sales, 
    CASE 
        WHEN rank_highest = 1 THEN 'Highest Profit'
        WHEN rank_lowest = 1 THEN 'Lowest Profit'
    END AS performance_label
FROM ProductRanks
WHERE rank_highest = 1 OR rank_lowest = 1
ORDER BY sales_year DESC, category DESC;