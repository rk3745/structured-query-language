create database sales;

use sales;

CREATE TABLE Sales(
SaleID INT PRIMARY KEY,
ProductName VARCHAR(50),
SaleDate DATE,
Quantity INT,
Price DECIMAL(10,2)
);

INSERT INTO Sales(SaleID, ProductName, SaleDate, Quantity, Price)VALUES
(1,'Laptop','2024-01-01', 10, 1000.00),
(2,'Mouse', '2024-01-02', 50, 20.00),
(3,'Keyboard', '2024-01-03', 30, 30.00),
(4,'Monitor', '2024-01-04', 20, 200.00),
(5,'Laptop', '2024-01-05', 5, 1000.00),
(6,'Mouse', '2024-01-06', 70, 20.00),
(7,'Keyboard', '2024-01-07', 40, 30.00),
(8,'Monitor', '2024-01-08', 15, 200.00),
(9,'Laptop', '2024-01-09', 8, 1000.00),
(10,'Mouse', '2024-01-10', 26, 20.00);

select* from sales;

# Q-1 total Quantity Sold Per Product ?
select productname,sum(quantity)
from sales
group by productname;

select productname,count(quantity)
from sales
group by productname;

# Q-2 Average Price Per Product ?
select productname,avg(price)
from sales
group by productname;

# Q-3 Total Sales Per Product exceeding 1000 ?
select productname,sum(quantity*price)
from sales
group by productname;

# Q-4 Products with total Quantity Sold greater than 50 ?
select productname,sum(quantity)
from sales 
group by productname
having sum(quantity)>50;

# Q-5 Number of Sales Transactions Per Product ?
select productname,count(quantity) as total_transactions
from sales
group by productname;
