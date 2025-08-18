WITH table1 AS (
    SELECT *,
           MONTHNAME(workdate) AS month,
           MONTH(workdate) AS month_no
    FROM supply_chain3
),

table2 AS (
    SELECT 
        location, 
        YEAR, 
        month, 
        month_no, 
        AVG(NumberOfPieces) AS average
    FROM table1
    GROUP BY location, year, month_no, month
),

table3 AS (
    SELECT *,
           LAG(average) OVER (
               PARTITION BY location 
               ORDER BY year, month_no
           ) AS lag_sales
    FROM table2
)

SELECT *,
       ROUND((average - lag_sales) / NULLIF(lag_sales, 0) * 100, 0) AS month_over_month_change,
       CASE 
           WHEN ROUND((average - lag_sales) / NULLIF(lag_sales, 0) * 100, 0) >= 30 THEN '⏫ Strong Peak'
           WHEN ROUND((average - lag_sales) / NULLIF(lag_sales, 0) * 100, 0) BETWEEN 1 AND 29 THEN '🔼 Mild Peak'
           WHEN ROUND((average - lag_sales) / NULLIF(lag_sales, 0) * 100, 0) BETWEEN -29 AND -1 THEN '🔽 Mild Troughs'
           WHEN ROUND((average - lag_sales) / NULLIF(lag_sales, 0) * 100, 0) <= -31 THEN '⏬ Strong Troughs'
           WHEN ROUND((average - lag_sales) / NULLIF(lag_sales, 0) * 100, 0) = 0 THEN 'Neutral'
           ELSE NULL
       END AS season_flag
FROM table3;
