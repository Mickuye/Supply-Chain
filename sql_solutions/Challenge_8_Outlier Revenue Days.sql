WITH table1 AS (
    SELECT 
        workdate, 
        location, 
        SUM(totalrevenue) AS revenue
    FROM supply_chain2
    GROUP BY workdate, location
), 
table2 AS (
    SELECT 
        location, 
        AVG(revenue) AS average,
        ROUND(2 * STDDEV_POP(revenue), 0) AS dev
    FROM table1
    GROUP BY location
)
SELECT 
    t1.workdate,
    t1.location,
    t1.revenue,
    t2.average,
    t2.dev,
    CASE
        WHEN t1.revenue > t2.average + t2.dev THEN '🚨 Outlier'
        ELSE NULL
    END AS flag
FROM table1 t1
JOIN table2 t2 
    ON t1.location = t2.location;
