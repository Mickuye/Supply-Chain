create table Supply_chain2
like supply_chain;

WITH TotalSum AS (	
    SELECT workDate, customer, location,
           SUM(ordercount) AS totalorder,
           SUM(Numberofpieces) AS totalpieces,
           SUM(totalrevenue) AS revenue
    FROM supply_chain2
    GROUP BY customer, location, workdate
), 
Row_Num AS (
    SELECT workdate, customer, location, totalorder, totalpieces, revenue,
           ROW_NUMBER() OVER(PARTITION BY customer, location ORDER BY workdate) AS Row_No
    FROM TotalSum
), 
MovingAvg AS (
    SELECT *,
           CASE
               WHEN Row_No > 6 
               THEN AVG(revenue) OVER (PARTITION BY customer, location ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) 
               ELSE NULL
           END AS `7-movgAvg`
    FROM Row_Num
)
SELECT *
FROM MovingAvg;
