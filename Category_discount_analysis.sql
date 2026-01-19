  CREATE TABLE category_discount_analysis AS
  SELECT
    year,
    category,
    SUM(sales) AS total_sales_category,
    SUM(profit) AS total_profit_category,
    SUM(discount) AS total_discount,
    CASE
        WHEN SUM(sales) = 0 THEN 0
        ELSE SUM(profit) / SUM(sales) * 100 
        END AS profit_margin_category
    FROM SS_sales
    GROUP BY
    year , category
    ORDER BY year ASC;

    