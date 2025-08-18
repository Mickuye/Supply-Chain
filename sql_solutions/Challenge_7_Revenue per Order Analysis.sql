#Daily Average
SELECT workdate,
  	  location,
      sum(ordercount) as total_order,
      round(sum(TotalRevenue),0) as total_revenue,
      round(sum(TotalRevenue)/nullif(sum(ordercount),0),0) as Revenue_per_Order
FROM supply_chain3
GROUP BY WorkDate, location;

#Monthly Average
SELECT year,
      month(workdate) as month,
      monthname(workdate) as month_no, location,
	    sum(ordercount) as count,
	    round(sum(totalrevenue),0) as revenue,
      round(sum(TotalRevenue)/nullif(sum(ordercount),0),0) as Revenue_per_Order
FROM supply_chain3
GROUP BY year, month(workdate), monthname(workdate),location;
