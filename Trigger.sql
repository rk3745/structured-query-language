create database store;

use store;

# Q1. Create a trigger that updates an inventory table whenever a new sale is recorded in the sales table.
# Specifically, when a new sale is inserted into the sale table, the trigger should decrease the quantity of the corresponding product in the inventory table.

create table inventory(product_id int primary key, product_name varchar(100), quantity int);

create table sales(sale_id int auto_increment primary key, product_id int, amount decimal(10,2), sale_date date, quantity_sold int);

# Q2. Insert sample data into the inventory table:
insert into inventory (product_id, product_name, quantity) values
(1,"Product A",100),
(2,"Product B",150),
(3,"Product C",200);

select * from inventory;

# Q3. Create the trigger.
delimiter //

create trigger after_sales_insert
after insert on sales
for each row
begin
update inventory
set quantity = quantity - new.quantity_sold
where product_id = new.product_id;
end //

delimiter ;

# Q4. Insert a new sale to test the trigger:
insert into sales(product_id, amount, sale_date, quantity_sold) values
(1,50.00,"2024-07-01",10);

select * from inventory;
select * from sales;

# create table in delete 
create table employee(emp_id int primary key, name varchar(100), department varchar(100));

create table deleted_employees_log(log_id int auto_increment primary key, emp_id int, name varchar(100), department varchar(50), deleted_at datetime);

delimiter //

create trigger after_employee_delete
after delete on employee
for each row
begin
insert into deleted_employees_log(emp_id, name, department, deleted_at)
values(old.emp_id, old.name, old.department, now());
end //

delimiter ;

insert into employee(emp_id, name, department)values
(1,"Alice","HR"),
(2,"Bob","IT"),
(3,"Charlie","Finance");

select * from employee;
delete from employee where emp_id = 1;
select * from deleted_employees_log;

# Create Table 

create table employees(emp_id int primary key, name varchar(50), salary decimal(10,2));

create table employee_log(log_id int auto_increment primary key, emp_id int, action varchar(50), log_time timestamp default current_timestamp);

insert into employees(emp_id, name, salary)values
(1,"Rahul",50000.00),
(2,"Abhi",40000.00),
(3,"Adesh",30000.00),
(4,"Vikas",20000.00);

select * from employees;

# Ques1: trigger to log insert activity.
delimiter // 

create trigger after_employee_inserted
after insert on employees
for each row
begin
insert into employee_log(emp_id, action)
values(new.emp_id,"Inserted");
end //

delimiter ;

INSERT INTO EMPLOYEES(emp_id,name, salary)
values(5,"rahul",90000.00);

select * from employee_log;


# Q-3 Trigger to convert employee name to uppercase.
delimiter //
CREATE TRIGGER trg_uppercase_name
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
SET NEW.name = UPPER(NEW.name);
end //

delimiter ;

INSERT INTO employees(emp_id, name, salary)
VALUES (6, 'rahul sharma',90000.00);

SELECT * FROM EMPLOYEES;

# Q-4 Trigger to prevent negative salary ?
delimiter //
create trigger trg_before_insert_salary
before insert on employees
for each row
begin
	if new.salary < 0 then
		signal sqlstate '45000'
		set message_text = 'Salary cannot be negative';
	end if;
end // 

delimiter ;

insert into employees(emp_id,name, salary)values (7,'Vikas',-10000.00);

# Q-5 Trigger to restrict salary reduction ?
DELIMITER //
CREATE TRIGGER RESTRICT_SALARY_REDUCTION
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
	IF NEW.SALARY < old.salary then
		signal sqlstate '45000'
        set message_text = "Salary reduction is not allowed";
	end if;
end // 

delimiter ;

update employees
set salary = 45000.00
where emp_id = 1;

# Q-6 Trigger to log name changes ?
delimiter // 
create trigger log_name_changes
after update on employees
for each row
begin
	if old.name <> new.name then
		insert into name_change_log(
			emp_id,
            old_name,
            new_name
		)
        values(
        old.emp_id,
        old.name,
        new.name
        );
	end if;
end //

delimiter ;

UPDATE employees
set name = "Rahul"
where emp_id = 1;

select * from name_change_log;

# Q-7 Set default Salary ?
delimiter //
create trigger default_salary
before insert on employees
for each row
begin
if new.salary is null then
set new.salary = 50000;
end if ; 
end //

delimiter ;

insert into employees(emp_id, name)values (7, "Adesh");
select * from employees;

# Q-8 Create a trigger to automatically increase salary by 10% ?
DELIMITER //
CREATE TRIGGER Inc_salary
before insert on employees
for each row
begin
set new.salary = new.salary * 1.10;
end //

delimiter ;

insert into employees values(7,"Abhi",50000);

select * from employees;

# Q-9 Create a trigger to store old and new salary change ?
DELIMITER // 
CREATE TRIGGER TRG_LOG_CHANGE
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
INSERT into employees_log(emp_id, action)
values(new.emp_id, concat_ws(' ', 'salary changed from', old.salary,'to',new.salary));
end //

delimiter ;

create table employees_log(log_id int auto_increment primary key, emp_id int, action varchar(50), log_time timestamp default current_timestamp);

UPDATE employees SET SALARY = 55000 WHERE emp_id = 2;

select * from employees_log;

SELECT * FROM employees;

# Q-10 CREATE A TRIGGER TO COUNT TOTAL EMPLOYEES ?
create table employee(
emp_id int primary key,
name varchar(50)
);
#create count table
create table employee_count (
total_emp int
);
insert into employee_count values (0);

#trigger
delimiter //
create trigger trg_count_employee
after insert on employee
for each row 
begin
update employee_count
set total_emp = total_emp + 1;
end //
delimiter ;
set sql_safe_updates=0;
insert into employee values
(1, 'Siya'),
(2, 'jay');

select * from employee_count;
select * from employee;