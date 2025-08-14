SELECT 
  Location, 
  ROUND(STDDEV_POP(TotalRevenue),2) AS Revenue_volatility,
  Rank() OVER(ORDER BY STDDEV_POP(TotalRevenue) DESC) AS Rank_no
FROM supply_chain2
GROUP BY Location;
