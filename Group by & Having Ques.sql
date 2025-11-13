create database employees;

use employees;

create table sales_account(
sale_id int not null,
Product varchar(20),
Category varchar(20),
Quantity int,
Price int,
Region varchar(20),
Sales_Person varchar(20),
Sales_date date
);

insert into sales_account(sale_id,product,category,quantity,price,region,sales_person,sales_date)values
(1,'Laptop','Electronics',5,50000,'East','John','2024,01-05'),
(2,'Mobile','Electronics',10,20000,'West','Mary','2024,01-10'),
(3,'Chair','Furniture',20,1500,'East','John','2024,02-15'),
(4,'Table','Furniture',8,5000,'North','Steve','2024,02-18'),
(5,'Laptop','Electronics',7,55000,'South','Mary','2024,03-01'),
(6,'Mobile','Electronics',15,18000,'East','John','2024,03-05'),
(7,'Sofa','Furniture',3,25000,'West','Steve','2024,03-20'),
(8,'Laptop','Electronics',2,52000,'North','Mary','2024,04-02'),
(9,'Chair','Furniture',30,1200,'South','John','2024,04-12'),
(10,'Mobile','Electronics',12,22000,'West','Steve','2024,04-15');

select * from sales_account;

# Q-1 Find the total sales amount of each region ?
select region,sum(price)
from sales_account
group by region
having sum(price);

# Q-2 Find total sales quantity sold by each sales person ?
select sales_person,sum(quantity)
from sales_account
group by sales_person
having sum(quantity);

# Q-3 Show categories where total quantity sold is more than 30 ?
select category,sum(quantity) as total_quantity
from sales_account
group by category
having sum(quantity) > 30;

# Q-4 Find total revenue by each category ?
select category,sum(quantity*price) as Total_revenue
from sales_account
group by category
having sum(quantity*price);

# Q-5 Find sales person who sold total quantity more than 20 ?
select sales_person,sum(quantity) as Total_sold
from sales_account
group by sales_person
having sum(quantity) > 20;

# Q-6 Find region-wise average sale price ?
select region,avg(price)
from sales_account
group by region;

# Q-7 Find total revenue of each sales person and show only those having revenue above ₹300000 ?
select sales_person,sum(quantity*price) as total_revenue
from sales_account
group by sales_person
having sum(quantity*price) > 300000;

# Q-8 Find how many products each category has ?
select category,count(product)
from sales_account
group by category
having count(product);

# Q-9 Find total sales per month ?
select monthname(sales_date) as month,
sum(price) as total_sales
from sales_account
group by monthname(sales_date);

# Q-10 Find each region's maximum sale price ?
select region,max(price) as max_sale_price
from sales_account
group by region
having max(price);

# Q-11 Find each category average quantity sold, but show only where avg > 10 ?
select category,avg(quantity) 
from sales_account
group by category
having avg(quantity) > 10;

# Q-12 Find total revenue by region and category ?
select region,category,sum(quantity*price)
from sales_account
group by region,category
having sum(quantity*price);

# Q-13 Find how many sales each salesperson made in each region ?
select sales_person,region,count(price) as sales
from sales_account
group by sales_person,region
having count(price);

# Q-14 Find the region where total quantity sold exceeds 20 ?
select region,sum(quantity) as total_quantity
from sales_account
group by region
having sum(quantity)>20;

# Q-15 Find salesperson who sold is more than one region ?
select sales_person,count(region)
from sales_account
group by sales_person,region
having count(region) > 1;

# Q-16 Find category having total revenue b/w ₹200000 and ₹1000000 ?
select category,sum(quantity*price) as total_revenue
from sales_account
group by category
having sum(quantity*price between 200000 and 1000000);

# Q-17 Find top 1 category with the highest total sales ?
select category,sum(quantity*price) as top_1_category
from sales_account
group by category
having sum(quantity*price);

# Q-18 Find salesperson's average sale value per transaction ?
select sales_person,avg(price) as per_transaction
from sales_account
group by sales_person
having avg(price);

# Q-19 Find category with minimum average price greater than ₹ 20000 ?
select category,avg(price)
from sales_account
group by category
having avg(price) > 20000;

# Q-20 Find region and sales person combination where revenue >₹200000 ?
select region,sales_person,sum(quantity*price) as total_revenue
from sales_account
group by region,sales_person
having sum(quantity*price) > 200000;
