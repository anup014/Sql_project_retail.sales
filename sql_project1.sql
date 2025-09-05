# PROJECT RETAIL_SALES DATA ANALYSIS
create database project_1;
use project_1;
create table retail_sales(
transactions_id int primary key ,
sale_date date,
sale_time time,
customer_id int ,
gender varchar(20),
age int,
category varchar(15),
quantiy int,
price_per_unit float,
cogs float,
total_sale float
);
select*from retail_sales;
use project_borah1;
select * from retail;

#write a SQL query to retrieve all columns for sale made on 2022-11-05
select transactions_id,sale_date,sale_time,customer_id,gender,age,category,quantity,price_per_unit,cogs,total_sale from retail where sale_date="2022-11-05";

#write a SQL query to retrieve all transaction where the category is"Clothing" and the quantity sold is more than 3
select * from retail where category="Clothing"  and sale_date between "2022-11-01" and "2022-12-01" and quantity>3;

#write a Sql query to calculate the total_sales for each category
select category,sum(total_sale) as net_sale,count(quantity) as total_orders from retail  group by category;

#write a SQL  query to find the average age of customers who purchased items from the "Beauty" category
select category,round(avg(age),2) as Average_age from retail where category="Beauty";

#write a SQL query to show transactions having total_sale more than 1000
SELECT * from retail where total_sale>1000;

#write a SQL query to find dthe total no. of transaction made by each gender in each category
select count(transactions_id) as total_transaction,gender,category from retail group by gender,category;

#write a SQL query to calculate the average sale for each month 
select year,max(Average_sale) as top from(select year(sale_date) as year,  month(sale_date) as months,round(avg(total_sale),2) as Average_sale
from retail group by year, months) as monthly_avg group by year order by year  ;

#write a SQL query to find the top 5 customer based on the highest sales
select customer_id,sum(total_sale) as total_sales from retail  group by customer_id order by total_sales desc limit 5;

#write a SQL query to find the no. of unique customers who purchased items from each category
select count(distinct(customer_id)) as Unique_customer,category from retail group by category;

SELECT 
    MIN(sale_time) AS first_order_time,
    MAX(sale_time) AS last_order_time
FROM retail;

#write a SQL query to create each shift on the basis of time and evaluate the number of orders in each shift
alter table retail
add column shift varchar(20);
update retail set shift=case 
when hour(sale_time) between 6 and 12 then "Morning"
when hour(sale_time) between 12 and 18 then "evening"
else "night"
end limit 2000;

select count(customer_id),shift from retail group by shift;
select sum(quantity) as total_order,shift from retail group by shift;



