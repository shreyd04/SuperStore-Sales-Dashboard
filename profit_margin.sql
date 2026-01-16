CREATE TABLE Profit_margin_By_Year AS
SELECT 
    year,
    SUM(profit) AS total_profit,
    SUM(sales) AS total_sales,
    CASE 
        WHEN SUM(sales) = 0 THEN 0
        ELSE (SUM(profit) / SUM(sales)) * 100
    END AS profit_margin_percentage
    FROM SS_sales
    GROUP BY 
    year
    ORDER BY year ASC;

    --Product category wise profit margin
    SELECT
    year,
    category,
    SUM(sales) AS total_sales_category,
    SUM(profit) AS total_profit_category,
    SUM(sales) - SUM(profit) AS COGS_category,
    CASE
        WHEN SUM(sales) = 0 THEN 0
        ELSE SUM(profit) / SUM(sales) * 100 
        END AS profit_margin_category
    FROM SS_sales
    GROUP BY
    year , category
    ORDER BY year ASC;