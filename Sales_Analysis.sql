create database COMPANY;
use COMPANY;
SELECT * from sales;

# -- Q1 : select all the orders shipped via 'Economy' mode with a total amount is greater than 25,000--

select * from sales where Ship_Mode='Economy' and Total_Amount>25000;

# -- Q2 : Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01

select * from sales
where Category='Technology' and Country='Ireland' and order_Date > '2020-01-01';

   # or
   
select * from sales where category = 'Technology'  and country = 'Ireland' and STR_TO_DATE(order_date, '%d/%m/%Y') > '2020-01-01';   

# -- Q3 : List the top 10 most profitable sales transaction in decending order.--

select * from sales order by Unit_Profit DESC LIMIT 10;  #top 10 trasactions

select * from sales order by Unit_Profit Desc LIMIT 10,20; #Skips 10 records,showing next 20 records

# -- Q4: find all customer whose name starts with 'J' and ends with 'n'

select * from sales where Customer_Name  like 'J%n' ;

# -- Q5 : Retrieve all product names that contain 'Acco' anyWhere in the name

select * from sales where Product_Name like '%Acco%' ;

# Q6 : Get the top 5 cities with the highest total sales amount --

select City,sum(Total_Amount) as Total_sales
from sales
Group by City
order by Total_sales DESC limit 5;

# -- Q7 : Display the second set of 10 records for Customer_Name and Total_Amount in decreasing order--

select Customer_Name,Total_Amount from sales 
order by Total_Amount desc limit 10,10; #skips first 10 record and gives next 10 records

# -- Q8 : Find the total revenue,average unit cost,and total number of orders

select sum(Total_Amount) as `Total revenue`,   #if you want print as total revenue then use ``(backtick)
 avg(unit_cost) as unit_cost,count(Order_ID) as no_of_order from sales;
 
 # --Count unique number of regions--
 
 select count(distinct region) as Region from sales; #count unique regions
     
 select distinct region from sales;  # shows distinct regions
 
 # -- Q10 : Find the number of orders placed by each customer--
 
 select Customer_name, count(Order_ID) as Order_count from sales group by Customer_name order by Order_count desc;
 
 # -- Q11 : Rank 5 products based on total sales using RANK()
 
 select Product_Name,SUM(Total_Amount) as Total_Sales, RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Sales_Rank
 from sales
 group by Product_Name
 LIMIT 5;
 
 
 