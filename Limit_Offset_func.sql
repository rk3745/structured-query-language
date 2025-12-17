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

## LIMIT & OFFSET

select * from celebrities;

select * from celebrities limit 2;

select * from celebrities limit 3;

select * from celebrities where city ="agra" limit 2;

select * from celebrities where city ="agra" order by city limit 2;

select * from celebrities where city ="agra" order by name desc limit 2;

select * from celebrities limit 3,3;

select * from celebrities limit 1,3;

select * from celebrities limit 3,2;

select * from celebrities limit 1,8;