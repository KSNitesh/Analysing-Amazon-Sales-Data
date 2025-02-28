-- Import the data from file
create table amazon_sales (Region varchar,Country varchar,Item_Type varchar,Sales_Channel varchar,
							Order_Priority varchar,	Order_Date date,Order_ID numeric,Ship_Date date,
							Units_Sold numeric,Unit_Price numeric,Unit_Cost numeric,Total_Revenue numeric,
							Total_Cost numeric,Total_Profit numeric);
select * from amazon_sales;


-- KPI`s Requirement
-- Q1. Find out the Total Revenue.
select sum(total_revenue) as Total_Revenue from amazon_sales;

-- Q2. Determine Average Order Value.
select sum(total_revenue)/count(distinct order_id) as Avg_Order_Val from amazon_sales;

-- Q3. Find the quantity of Total Items Sold.
select sum(units_sold) as Total_Items_Sold from amazon_sales;

-- Q4. Find Total Orders Placed.
select count(distinct order_id) as Total_Orders_Placed from amazon_sales;

-- Q5. Calculate average Items Per Order.
select sum(units_sold)/count(distinct order_id) as Items_Per_Order from amazon_sales;


--Charts Requirement
-- Q1. Find out Daily Trend For Total Orders.
select to_char(order_date, 'day') as Order_Day, count(distinct order_id) as Total_Orders from amazon_sales group by to_char(order_date, 'day'); 

-- Q2. Find out Monthtly Trend For Total Orders.
select to_char(order_date, 'month') as Order_Month, count(distinct order_id) as Total_Orders from amazon_sales group by to_char(order_date, 'month'); 

-- Q3. Calculate Percentage of Sales by Item Types.
select item_type, sum(total_revenue) * 100 / (select sum (total_revenue)from amazon_sales)  as POS_ItemTypes  from amazon_sales group by item_type;

-- Q4. Calculate Percentage of Sales by Order Priority.
select order_priority, sum(total_revenue) * 100 / (select sum (total_revenue)from amazon_sales)  as POS_OrderPriority  from amazon_sales group by order_priority;

-- Q5. Calculate Percentage of Sales by Region.
select Region, sum(total_revenue) * 100 / (select sum (total_revenue)from amazon_sales)  as POS_Region  from amazon_sales group by Region;

-- Q6. Find Out Top 5 Items by Revenue.
select item_type, sum(total_revenue) as Revenue from amazon_sales group by item_type order by Revenue Desc limit 5;

-- Q7. Find Out Bottom 5 Items by Revenue.
select item_type, sum(total_revenue) as Revenue from amazon_sales group by item_type order by Revenue limit 5;

-- Q8. Find Out Top 5 Items by Quantity.
select item_type, sum(units_sold) as Quantity from amazon_sales group by item_type order by Quantity Desc limit 5;

-- Q9. Find Out Bottom 5 Items by Quantity.
select item_type, sum(units_sold) as Quantity from amazon_sales group by item_type order by Quantity limit 5;