SELECT 
    location, 
    ROUND(SUM(TotalRevenue), 2) AS revenue
FROM supply_chain
GROUP BY location
ORDER BY revenue DESC
LIMIT 5;

