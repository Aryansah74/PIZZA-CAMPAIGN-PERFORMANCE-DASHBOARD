SELECT SUM(total_price) AS Total_Revenue FROM dbo.pizza_sales
select(sum(total_price) / count(distinct order_id)) as Avg_order_Value 
from dbo.pizza_sales;
select sum(quantity) as Total_pizza_sold from dbo.pizza_sales;
select count(distinct order_id) as Total_orders from dbo.pizza_sales
select cast(cast(sum(quantity) As Decimal(10,2))/
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales
select datename(dw, order_date) as Order_day, Count(distinct order_id) As Total_orders
from pizza_sales
group by datename(dw, order_date);
select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)
order by total_orders desc

select * from pizza_sales

select pizza_category, cast(sum(total_price) as decimal(10,2)) as Total_revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_category

select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales where datepart(quarter, order_date)=1) as decimal(10,2)) AS PCT
from pizza_sales
where datepart(quarter, order_date)=1
group by pizza_size
order by PCT desc

select top 5 pizza_name, sum(total_price) as Total_revenue from pizza_sales
group by pizza_name
order by Total_revenue ASC

select top 5 pizza_name, count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders desc

