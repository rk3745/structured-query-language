create database celeb;

use celeb;

create table celebrities(
id int not null unique,
name varchar(20) not null,
percentage varchar (2) not null,
age int not null check(age>=18),
gender varchar(1) not null,
phone varchar(10) not null unique,
city varchar(15) not null default 'agra');

insert into celebrities(id,name,percentage,age,gender,phone,city)values

(1,"ram kumar",45,19,"m","4022155","agra"),
(2,"sarita kumari",55,21,"f","4034421","delhi"),
(3,"salman khan",62,20,"m","4056221","agra"),
(4,"juhi chawla",47,18,"f","4089821","bhopal"),
(5,"anil kapoor",74,22,"m","4025221","agra"),
(6,"john abraham",64,21,"m","4033776","delhi"),
(7,"shahid kapoor",52,21,"m","4022784","delhi");

select * from celebrities;

## DATE FUNCTIONS

select current_date();

select curdate();

select sysdate();

select now();

select date();

select month("2025-10-09 09:54:21");

select monthname("2025-10-09 09:54:21");

select year("2025-10-09 09:54:21");

select quarter("2025-10-09 09:54:21");

SELECT DAY("2025-10-09 09:54:21");

select dayofmonth("2025-10-09 09:54:21");

select dayname("2025-10-09 09:54:21");

select dayname("2025-10-14 09:54:21");

select weekday("2025-10-09 09:54:21");

select dayofweek("2025-10-09 09:54:21");

select dayofweek("2025-10-14 08:57:00");

select dayofyear("2025-10-09 09:54:21");

select week("2025-10-09 09:54:21");

select weekday("2025-10-14 12:19:00");

select yearweek("2025-10-09 09:54:21");

select last_day("2025-10-09 09:54:21");

select extract(month from "2025-10-09 09:53:21");

select extract(year from "2025-10-09 09:53:21");

select extract(day from "2025-10-09 09:53:21");

select extract(day from "2025-10-09");

select adddate("2025-10-14",interval 10 day);

select adddate("2025-10-14",interval 1 month);

select adddate("2025-10-14",interval 1 year);

select date_add("2025-10-14",interval 5000 minute);

select subdate("2025-10-14",interval 1 month);

select subdate("2025-10-14",interval 1 year);

select datediff("2025-10-14","2025-09-14");

select datediff("2025-10-14","2024-10-14");
