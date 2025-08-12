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

  **Challenge 1: Daily Order Volume Trends**
  
**Business Question:**
Calculate the daily totals of orders and pieces for each location, and show the 7-day moving average.

**Reason for its significance:**
Identifying volume and tracking daily orders helps pinpoint short-term demand trends. The 7-day moving average levels out daily variations, making it easier to spot consistent growth or declines without being distracted by outliers.

**SQL SOLUTION:**
[sql_solutions/challenge_1_daily_order_trends.sql](https://github.com/Mickuye/Supply-Chain/blob/c7e774c6806541019609b0f063cbd5663e416785/sql_solutions/challenge_1_daily_order_trends.sql)

**Fundamental observations:**
1.	This query calculates total orders, total pieces, and revenue for each location per day.
2.	Frequently high-moving-average locations can be prioritized for more product allocation and marketing efforts.
