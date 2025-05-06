select * from pizza_sales

select SUM(total_price) AS Total_Revenue from pizza_sales

Select SUM(total_price) / COUNT(Distinct order_id) As Avg_Order_Value from pizza_sales

Select SUM(quantity)As Total_Pizza_Sold from pizza_sales

Select COUNT(Distinct order_id) As Total_Orders from pizza_sales

Select SUM(quantity) / COUNT(Distinct order_id) As Avg_pizza_per_order from pizza_sales

---Daily Trends---
Select DATENAME(DW,order_date) As Order_Day, COUNT(distinct order_id) As Total_Orders from pizza_sales
GROUP BY DATENAME(DW,order_date)

---Hourly Trends---
Select DATEPART(Hour,order_time) As Order_Hour, COUNT(distinct order_id) As Total_Orders from pizza_sales
GROUP BY DATEPART(Hour,order_time)
order by DATEPART(Hour,order_time)


Select pizza_size, SUM(total_price)*100/ (select sum(total_price) from pizza_sales) As Pct_Totalsales 
from pizza_sales
Group By pizza_size
order by Pct_Totalsales

Select pizza_category, sum(quantity) As Total_Pizza_Sold
from pizza_sales
group by pizza_category 
Order by Total_Pizza_Sold Desc

Select top 5 pizza_name, SUM(quantity) As Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold ASC