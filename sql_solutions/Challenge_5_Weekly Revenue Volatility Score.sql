WITH table1 AS (
    SELECT 
        year, 
        week, 
        location, 
        ROUND(SUM(totalrevenue), 0) AS revenue
    FROM supply_chain3
    GROUP BY year, week, location
), 
table2 AS (
    SELECT
        COUNT(*) AS num_weeks,
        location, 
        ROUND(AVG(revenue), 0) AS average,
        ROUND(STDDEV_POP(revenue), 0) AS revenue_volatility,
        CASE
            WHEN ROUND(STDDEV_POP(revenue), 0) <= 15000 THEN 'Stable 👍'
            WHEN ROUND(STDDEV_POP(revenue), 0) BETWEEN 15001 AND 30000 THEN 'Moderate 👌'
            WHEN ROUND(STDDEV_POP(revenue), 0) > 30000 THEN 'Volatile 👎'
        END AS volatility_flag
    FROM table1
    GROUP BY location
    ORDER BY location
)
SELECT 
    num_weeks, 
    location, 
    revenue_volatility, 
    volatility_flag,
    RANK() OVER (ORDER BY revenue_volatility DESC) AS rank_num
FROM table2;

