create database project;
use project;
create table pizza_order (
 ord_id int,
 ord_date date,
 ord_time time
 );
 create table dairy_dataset(
 Location varchar(30),
 Total_Land_area_acres double,
 Number_of_Cows int,
 Farm_Size varchar(30),
Date_ date,
Product_ID int,
Product_Name varchar(30),
Brand varchar(30),
Quantity_liters double,
Price_per_Unit double,
Total_Value double,
Shelf_Life_days int,
Storage_Condition varchar(30),
Production_Date date,
Expiration_Date date,
Quantity_Sold_liters int,
Price_per_Unit_sold double,
Approx_Total_RevenueINR double,
Customer_Location varchar(30),
Sales_Channel varchar(30),
Quantity_in_Stock_liters int,
Minimum_Stock_Threshold_liters double,
Reorder_Quantity_liters double);

select Product_Name, round(sum(Approx_Total_RevenueINR),2) as Revenue  from dairy_dataset group by Product_Name order by revenue desc;

select Brand,  round(sum(Approx_Total_RevenueINR),2) as Revenue from dairy_dataset group by Brand order by Revenue desc limit 1;

select monthname(Date_),  round(sum(Approx_Total_RevenueINR),2) as Revenue from dairy_dataset group by monthname(Date_) order by monthname(Date_) desc;

select Product_Name, Quantity_in_Stock_liters, Minimum_Stock_Threshold_liters  from dairy_dataset where Minimum_Stock_Threshold_liters > Quantity_in_Stock_liters;
 
 select Product_Name,Quantity_in_Stock_liters,Reorder_Quantity_liters from dairy_dataset where Reorder_Quantity_liters>Quantity_in_Stock_liters;
 
 select Sales_Channel, round(sum(Approx_Total_RevenueINR),2) from dairy_dataset group by Sales_Channel;
 
 select Customer_Location, sum(Quantity_Sold_liters) as purchase_volume from dairy_dataset group by Customer_Location order by purchase_volume desc limit 5;
 
 select Product_Name, round(avg(Price_per_Unit_sold),2) as average from dairy_dataset group by Product_Name order by average desc;

select Product_Name, Price_per_Unit, Price_per_Unit_sold, round(Price_per_Unit-Price_per_Unit_sold) from dairy_dataset;

select Product_Name, Shelf_Life_days from dairy_dataset where Shelf_Life_days<10;

select Brand, avg(Shelf_Life_days) as Average_shelf_life from dairy_dataset group by Brand order by Average_shelf_life desc ;

select Farm_Size, avg(Number_of_Cows) from dairy_dataset group by Farm_Size;

select Location, sum(Total_Land_area_acres) from dairy_dataset group by Location order by sum(Total_Land_area_acres) desc;

select Location, round(avg(Quantity_liters),2) as average_prod_quantity from dairy_dataset group by Location order by average_prod_quantity desc limit 3;

select Product_Name, round(Price_per_Unit-Price_per_Unit_sold,2) as profit from dairy_dataset ;

select Brand, round(Price_per_Unit_sold-Price_per_Unit) as profit from dairy_dataset order by profit desc limit 1;

select year(Date_), round(sum(Approx_Total_RevenueINR),2) as yearly_revenue_growth from dairy_dataset group by year(Date_) order by yearly_revenue_growth desc ;

select Product_Name, year(Date_), sum(Quantity_Sold_liters) from dairy_dataset group by  Product_Name, year(Date_);

select Product_Name, Quantity_in_Stock_liters, Minimum_Stock_Threshold_liters  from dairy_dataset where Minimum_Stock_Threshold_liters > Quantity_in_Stock_liters;

 select Product_Name, Quantity_in_Stock_liters, Date_, Expiration_Date from dairy_dataset where Date_>Expiration_Date ;

select Brand, avg(Shelf_Life_days) from dairy_dataset group by Brand;

select Product_Name, Customer_Location, count(Quantity_Sold_liters) from dairy_dataset group by Customer_Location, Product_Name;

select count(order_id) as total_orders from order_details;

select sum(order_details.quantity*pizzas.price) as total_revenue from order_details join pizzas on order_details.pizza_id=pizzas.pizza_id;

select  price, pizza_id from pizzas order by price desc limit 1;

select pizzas.size, sum(order_details.quantity) from order_details join pizzas on pizzas.pizza_id=order_details.pizza_id group by pizzas.size order by sum(order_details.quantity) desc limit 1 ;

select pizza_types.name, sum(order_details.quantity) as most_ordered_pizza from pizza_types join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id join order_details on pizzas.pizza_id=order_details.pizza_id group by pizza_types.name order by most_ordered_pizza desc limit 5;

select pizza_types.category, sum(order_details.quantity) from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id join order_details on pizzas.pizza_id = order_details.order_id group by pizza_types.category order by sum(order_details.quantity) desc;

select hour(pizza_order.ord_time) as hours, count(order_details.quantity) from pizza_order join order_details 
on pizza_order.ord_id = order_details.order_id group by hours order by count(order_details.quantity) desc;

select pizza_types.category, count(pizzas.pizza_id) from pizza_types join pizzas 
on pizzas.pizza_type_id = pizza_types.pizza_type_id 
join order_details on pizzas.pizza_id= order_details.pizza_id 
group by pizza_types.category;

select date(pizza_order.ord_date) as orders_by_date, avg(order_details.quantity) from pizza_order join order_details 
on pizza_order.ord_id = order_details.order_id group by orders_by_date order by  avg(order_details.quantity) desc;

select pizzas.pizza_type_id, sum(pizzas.price*order_details.quantity) from pizzas join order_details 
on pizzas.pizza_id = order_details.pizza_id group by  pizzas.pizza_type_id 
order by sum(pizzas.price*order_details.quantity) desc limit 3;









