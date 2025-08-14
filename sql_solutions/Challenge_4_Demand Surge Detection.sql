SELECT *
FROM supply_chain2;

WITH table1 AS (
    SELECT 
        workdate, 
        customer, 
        location,
        SUM(numberofpieces) AS TotalPieces,
        SUM(totalrevenue) AS Revenue
    FROM supply_chain2
    GROUP BY workdate, customer, location
), 
table2 AS ( 
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY customer, location 
               ORDER BY workdate
           ) AS Row_num
    FROM table1
),
table3 AS (
    SELECT *,
           CASE
               WHEN Row_num >= 7 
               THEN AVG(TotalPieces) OVER (
                        PARTITION BY customer, location 
                        ORDER BY workdate 
                        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
                    )
               ELSE NULL
           END AS 7movgAvg
    FROM table2
),
table4 AS (
    SELECT *, 
           7movgAvg * 1.5 AS Per_Surge
    FROM table3
)
SELECT *,
       CASE 
           WHEN TotalPieces > Per_Surge THEN '🚨 Spike Detected'
           ELSE NULL
       END AS Surge_Flag
FROM table4;
