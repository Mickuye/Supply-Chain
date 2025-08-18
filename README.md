Case Research Title:  **Supply Chain Analytics __ SQL challenges to Business challenges**

This project study delves into a real-world supply chain dataset that encompasses daily transactional data from customers across various locations, along with details on orders, quantities, and revenue.

**Business Challenges:**
This organization operates across multiple locations and concurrently handles a large number of orders and product pieces daily. However, these operations are carried out without identifying important criteria that can be instrumental to the business’s growth positively – identifying demand surges, revenue volatility, and growth trends. 
The primary aim of this study is to tackle ten advanced business challenges using MYSQL. Additionally, it incorporates techniques such as window functions, Common Table Expressions (CTEs), ranking, and aggregation to enhance the analysis.

This Analysis primarily aimed to deliver usable intelligence for:
1.	Operational efficiency – for Identifying Surges and Seasonality.
2.	Financial performance – Identifies top revenue contributors and outliers.
3.	Risk management – scaling revenue volatility.
4.	Strategic planning – for comparing top-performing locations. 

Each Challenges are addressed with:
1.	Business Question
2.	Reason for its significance
3.	SQL Solution
4.	Fundamental observations

  **CHALLENGE 1: Daily Order Volume Trends**
  
**Business Question:**
Calculate the daily totals of orders and pieces for each location, and show the 7-day moving average.

**Reason for its significance:**
Identifying volume and tracking daily orders helps pinpoint short-term demand trends. The 7-day moving average levels out daily variations, making it easier to spot consistent growth or declines without being distracted by outliers.

**SQL SOLUTION:**
[sql_solutions/Challenge_1_Daily_order_trends.sql](https://github.com/Mickuye/Supply-Chain/blob/c7e774c6806541019609b0f063cbd5663e416785/sql_solutions/challenge_1_daily_order_trends.sql)

**Fundamental observations:**
1.	This query calculates total orders, total pieces, and revenue for each location per day.
2.	Frequently high-moving-average locations can be prioritized for more product allocation and marketing efforts.


   **CHALLENGE 2: Top Revenue Locations**
   
**Business Question:**
Pinpoint the top 5 locations by total revenue over the entire period

**Reason for its significance:**
Identifying the location generating the highest revenue helps the management to focus resources and operational improvements on these areas, and also serves as a benchmark for underperforming locations

**SQL Solution:**
[sql_solutions/Challenge_2_Top_Revenue_Locations.sql](https://github.com/Mickuye/Supply-Chain/blob/8c8c3b6909be029d077a1efa1e57981e7e7f2fde/sql_solutions/Challenge_2_Top_Revenue_Locations)

**Fundamental Observations:**
1.	The top 5 revenue locations are: Chicago, the highest with 34% and revenue of 18,247,261, Los Angeles (10,714,018, 20%), Atlanta (9,924,237, 18%), Dallas (7,662,425, 14%), and lastly Sacramento (7,230,477, 13%)
2.	Overall, Chicago’s Strong performance can serve as a benchmark for Miami (3,767,785, 3%), which is the least performing location in the company overall. The same procedures implemented in Chicago could also be applied in Miami.
   

  **CHALLENGE 3: Week-over-Week Revenue Growth**

**Business Question:**
Evaluate the week-over-week percentage change in revenue by location using the LAG() function.

**Reason for its significance:**
Growth trends are identified by tracking week-over-week revenue changes, sudden drops, or seasonal fluctuations. This aids the management in making decisions concerning performance changes, optimizing marketing campaigns, and improving resource allocation.
 
**SQL Solution:**
[sql_solutions/Challenge_3_Week-over-Week Revenue Growth.sql](https://github.com/Mickuye/Supply-Chain/blob/9b805276b43476e882de7f6b89210dcf8acc81b0/sql_solutions/Challenge_3_Week-over-Week%20Revenue%20Growth)

**Fundamental Observations:**
1.	The highest week-over-week revenue was 3330%, in week 1, 2021, driven by high demand surges in Atlanta.
2.	Other notable spikes include 2917% in Birmingham (week 40, 2020), 2400% in Los Angeles (week 47, 2020), and 2261% in Los Angeles (week 8, 2020).
3.	The analysis shows that while some locations maintained consistent growth, others had large swings in revenue, pointing to instability that may require targeted interventions.
   

    **CHALLENGE 4: Demand Surge Detection**
  	
**Business Question:**
Flag days where a location experiences spikes in the number of pieces of over 50% above its 7-day moving average.

**Reason for its significance:**
Distinguishing demand surges allows the business to brace for unexpected spikes in sales in order to prevent stockouts and optimize inventory allocation. This also spots out high-demand days.

**SQL Solution:**
[sql_solutions/Challenge_4_Demand Surge Detection.sql](https://github.com/Mickuye/Supply-Chain/blob/d20d2c393a71471b2ecc79c3aaa0a998c25de3d2/sql_solutions/Challenge_4_Demand%20Surge%20Detection)

**Fundamental Observations:**
A brief overview of the data shows Atlanta’s customer, Amazon, experienced significant spikes on January 13 and 14, 2020, with pieces sold exceeding 338% of the 7-day moving average (225.7 pieces), using the spike flag to indicate demand levels that are above normal or unusual market activity.


  **CHALLENGE 5: Weekly Revenue Volatility Score**
  
**Business Question:**
compute the revenue standard deviation per location & rank them by volatility

**Reason for its significance:**
Revenue volatility indicates how much sales fluctuate over time. Locations with high volatility may suggest unstable demand patterns, necessitating improved forecasting, more flexible inventory management, or adaptive marketing strategies.
NB: You are being asked to measure how much each location's revenue fluctuates over time, not just how much they earn, but how unstable their revenue is.
Calculating revenue volatility helps identify which locations have unstable or inconsistent revenue patterns, allowing for better risk management and forecasting decisions. 

**SQL Solution:**
[sql_solutions/Challenge_5_Weekly Revenue Volatility Score.sql](https://github.com/Mickuye/Supply-Chain/blob/670c73e5a093a2102d55f1672944cfc8fc67429e/sql_solutions/Challenge_5_Weekly%20Revenue%20Volatility%20Score.sql)

**Fundamental Observations:**
•	What This Tells Us: Each location has 116 weeks of data, so it's consistent across.
•	Average: This is the mean weekly revenue for each location.
•	Revenue_volatility: This is how much the weekly revenue jumps or dips, on average, around the mean.

1.	Chicago revenue jumps up/down by 61,980 around its mean of 157,304. This is a high volatility score, suggesting unpredictable performance.
•	meaning: Average weekly revenue = 157,304
•	Revenue_volatility= +/- 61,980 (up 219,284 and down 95,324).

2.	New York, being the least stable, moves up/down by 12,145 around its mean of 34,109. 
Although with a smaller revenue, it's relatively stable and showing consistent performance.
•	meaning: Average weekly revenue = 34,109
•	Revenue_volatility= +/- 12,145 (up 46,254 and down 21,964).


   **CHALLENGE 6: Seasonality Pattern**

**Business Question:**
Extract the month from the date, calculate the average monthly pieces, and detect which months consistently show peaks or troughs.

**Reason for its significance:**
Understanding seasonal patterns helps the business forecast demand changes and align production, inventory according. Additionally, identifying peak and low-demand months ensures better resource allocation.

**SQL Solution:**
[sql_solutions/Challenge_6_Seasonality Pattern.sql](https://github.com/Mickuye/Supply-Chain/blob/1419fdef2bafb437bfb4f0b76ffdaaa73d3bc1dd/sql_solutions/Challenge_6_Seasonality%20Pattern.sql)

**Fundamental Observations:**
1.	Atlanta YoY trends (February 2020-2022): A mild peak was recorded in 2020 at +4% and in 2021 at +3% above the monthly average, indicating an early sign of seasonal consistency. However, the demand shifted in 2022, suggesting that demand weakened compared to prior years.
2.	While for Birmingham, the YoY (February 2020-2022) trend across all three years experienced mild troughs throughout (-4 in 2020, -6 in 2021, and -10 in 2022), indicating a historically low-demand month for this location in February.


   **CHALLENGE 7: Revenue per Order Analysis**

**Business Question:**
Calculate the average revenue per order by location and show trends over time (daily/monthly averages).

**Reason for its significance:**
Calculating revenue by order indicates how much value each transaction brings. An upward trend signal that shows that customers are either purchasing more or purchasing higher value products, while on the other hand, an inverse signal for a decline.

**SQL Solution:**
[sql_solutions/Challenge_7_Revenue per Order Analysis](https://github.com/Mickuye/Supply-Chain/blob/c350cf3436acc4e40edd485eca1873393cdba1e4/sql_solutions/Challenge_7_Revenue%20per%20Order%20Analysis.sql)

**Fundamental Observations:**
	**Daily Overview Analysis**
•	Chicago indicates an upward trend from the 2nd and 4th of January 2020, increasing from 116 to 147 revenue per order, before dipping in trend. 

**Monthly Overview Analysis**
•	Chicago indicates a decline in its revenue by order between January to March, from 123 to 108. Conversely, an upward trend for Atlanta from 122 to 134, suggesting stronger customer spending growth.


