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

## Arithmatic Operators:

select 5+6;

select 5+6 as total;
select 6-5 as difference;
select 5*6 as total;
select 12/6 as total;

select id, name, (percentage+5) as "new percentage" from celebrities;

select pi();

select round(4.51);
select round(4.49);
select round(-4.49);
select round(1234.987,1);

select ceil(1.23);
select floor(1.23);

select pow(2,2);
select pow(2,3);
select pow(2,4);

select sqrt(16);
select sqrt(4);
select sqrt(2);

select round(sqrt(2),2);

select rand();
select rand()*100;

select floor(7+rand()*6);
select floor(7+rand()*6);
select floor(7+rand()*6);

select abs(-56);
select abs(-56.25);
select abs(56.25);

select sign(25);
select(0);
select sign(-1000);