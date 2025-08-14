CREATE TEMPORARY TABLE supply_chain3
LIKE supply_chain;

INSERT INTO supply_chain3
SELECT *
FROM supply_chain;

ALTER TABLE supply_chain3
ADD COLUMN year INT,
ADD COLUMN week INT;

UPDATE supply_chain3
SET 
  year = YEAR(workdate),
  week = WEEK(workdate, 1);

ALTER TABLE supply_chain3
DROP COLUMN yearweek;

WITH table1 AS (
    SELECT
        year, week, customer, location,
        SUM(ordercount) AS TotalCount,
        SUM(numberofpieces) AS TotalPieces,
        SUM(totalrevenue) AS revenue
    FROM supply_chain3
    GROUP BY year, week, customer, location
), 
table2 AS (
    SELECT *,
           LAG(revenue) OVER (PARTITION BY customer, location ORDER BY year, week) AS lag_sales
    FROM table1
), 
table3 AS (
    SELECT *,
           ROUND(((revenue - lag_sales) / NULLIF(lag_sales, 0)) * 100, 0) AS per_change
    FROM table2
)
SELECT year, week, customer, location, MAX(per_change) AS Highest_price_change
FROM table3
GROUP BY year, week, customer, location
ORDER BY per_change DESC 
LIMIT 5;
