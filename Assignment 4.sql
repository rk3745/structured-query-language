create database amazon;

use amazon;

create table employees(
id int primary key,
name varchar (100),
position varchar (100),
salary decimal (10,2),
date_of_joining date
);

insert into employees(id,name,position,salary,date_of_joining)values
(1,'Joe Doe','Manager',55000.00,'2020-01-15'),
(2,'Jane Smith','Developer',48000.00,'2019-07-10'),
(3,'Alice johnson','Designer',45000.00,'2021-03-22'),
(4,'Bob Brown','Developer',50000.00,'2018-11-01');

select * from employees;

# Q-1 Write a query to retrieve all employees who are Developers ?
select * from employees where position = "developer";

# Q-2 Write a query to update the salary of Alice Johnson to 46000.00 ?
update employees set  salary = 46000.00 where id = 3; select * from employees;

# Q-3 Write a query to delete the employee record for Bob Brown ?
delete from employees
where id = 4;
select * from employees;

# Q-4 Write a query to find the employees who have a salary greater than 48000 ?
select * from employees where salary > 48000;

# Q-5 Write a query to add a new column email to the employees table ?
alter table employees add email varchar(20); select * from employees;

# Q-6 Write a query to update the email for John Doe to john.doe@company.com ?
update employees set email = "john.doe@company.com" where id = 1; select * from employees;

# Q-7 Write a query to retrieve only the name and salary of all employees ?
select id,name
from employees;

# Q-8 Write a query to count the number of employees who joined after January 1, 2020.
select count(*)
from employees
where date_of_joining > '2020-01-01';

# Q-9 Write a query to order the employees by salary in descending order ?
select * from employees order by salary desc;


# Q-10 Write a query to drop the email column from the employees table ?
alter table employees drop column email; select * from employees;

# Q-11 Write a query to find the employee with the highest salary ?
select * from employees order by salary desc limit 1;