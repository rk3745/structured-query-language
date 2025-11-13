create database school;

use school;

create table student1(
st_id int,
st_name varchar(15),
st_age int);

insert into student1(st_id,st_name,st_age) values(1,"rahul",20),
insert into student1(st_id,st_name,st_age) values(2,"abhishek",19);

select * from student1;

insert into student(st_id,st_name,st_age) values(2,"rahul",20),(3,"abhishek",19);

alter table student add email varchar(20);

alter table student modify email int;

alter table student change email email_id varchar(20);

alter table student rename students;

select * from students;

truncate table students;

drop table students;

create table student(
id int not null unique,
name varchar(20) not null,
age int not null check(age>=18),
gender varchar(1) not null,
phone varchar(10) not null unique,
city varchar(15) not null default 'agra');

insert into student(id ,name,age ,gender ,phone ,city) values
(1,"Rahul",20,"M",99106,"delhi"); 

select * from student3;

insert into student(id ,name,age ,gender ,phone ,city) values
(2,"abhishek",20,"M",88103,"gzb"); 

select * from student;

insert into student(id ,name,age ,gender ,phone ,city) values
(3,"salman",19,"M",98783,"noida");

select * from student;

insert into student(id ,name,age ,gender ,phone ,city)values 
(4,"sakshi",18,"f",943837,"delhi");

select * from student;

insert into student(id,name,age,gender,phone,city)values
(6,"keshav",20,"m",98978,"noida");

select * from student;

create table student9(
id int not null unique,
name varchar(20) not null,
age int not null check(age>=18),
gender varchar(1) not null,
phone varchar(10) not null unique,
city varchar(15) not null default 'agra');

insert into student9(id,name,age,gender,phone,city)values
(1,"ram kumar",19,"m","4022155","agra"),
(2,"sarita kumari",21,"f","4034421","delhi"),
(3,"salman khan",20,"m","4056221","agra"),
(4,"juhi chawla",18,"f","4089821","bhopal"),
(5,"anil kapoor",22,"m","4025221","agra"),
(6,"john abraham",21,"m","4033776","delhi");

select * from student9;

select name, gender from student9;

select name as NAME, gender as Gender from student9;

select * from student9;

select * from student9 where city = "delhi";

select * from student9 where gender = "m";

select * from student9 where gender = "f";

select * from student9 where age<20;

select * from student9 where age>18;

select * from student9 where age=18;

select * from student9 where city != "delhi";

select * from student9 where city <> "delhi";

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

update celebrities
set phone="402355" where id=1;

select * from celebrities;

update celebrities
set percentage="75" where id=2;

select * from celebrities;

update celebrities
set percentage="67", age="25" where id=5;

select * from celebrities;

update celebrities set age="20" where id IN(6,7);

select * from celebrities;

set sql_safe_updates=0;

update celebrities set age="21";

select * from celebrities;

select * from celebrities
where percentage>40 and percentage<50;

select * from celebrities
where percentage >=30 and percentage<=60;

select *  from celebrities
where percentage>30 or percentage<60;

select * from celebrities where city = "delhi"or"agra";

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

## AGGREGATE FUNCTIONS

select count(name) from celebrities;

select count(*) from celebrities;

select count(distinct city) from celebrities;

select * from celebrities;

select count(city) from celebrities;

select max(percentage) from celebrities;

select min(percentage) as min from celebrities;

select sum(percentage) as percentage from celebrities;

select avg(percentage) as percentage from celebrities;

select min(percentage) from celebrities where city = "agra";

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

## STRING FUNCTIONS

select id ,upper(name) as Name,percentage as Percentage from celebrities;

select id ,ucase(name) as name,percentage from celebrities;

select id ,lower(name) as name,percentage from celebrities;

select id ,lcase(name) as name,percentage from celebrities;

select id, name, character_length(name) as characters from celebrities;

select id, name, char_length(name) as characters from celebrities;

select id, name, length(name) as characters from celebrities;

select id, city, char_length(city) as characters from celebrities;

select id, concat(name,percentage) as name from celebrities;

select id, concat(name,"-",percentage) as name from celebrities;

select id, concat(name," ",percentage) as name from celebrities;

select concat("rahul"," ","sharma") as my_name;

select concat("-","rahul","hello","class") as my_name;

select concat_ws(" ","rahul","hello","class") as my_name;

select "	Rahul sharma 	" as my_name;

select ltrim("	Rahul sharma 	");

select rtrim("	Rahul sharma 	");

select trim("	Rahul sharma 	");

select position("world" in "hello world");

select position("o" in "hello world");

select instr("hello world","ell");

select instr("hello world","or");

select locate("ell","hello world");

select locate("l","hello world",3);

select locate("o","hello world",2);

select substring("rahul sharma",3);

select substring("rahul sharma",5);

select substring("rahul sharma",3,6);

select mid("rahul sharma",-6,3);

select substring("rahul sharma",-12,5);

select substring("rahul sharma",1,5);

select substring_index("www.rahulsharma.net",".",1);

select substring_index("www.rahulsharma.net",".",2);

select substring_index("www.rahulsharma.net",".",3);

select substring_index("www.rahulsharma.net","a",2);

select substring_index("www.rahulsharma.net","a",3);

select substring_index("www.rahulsharma.net","h",2);

select left("rahul sharma",3);

select left("rahul sharma",5);

select right("rahul sharma",5);

select rpad("rahul sharma",20,"-");

select rpad("rahul sharma",20,"*");

select lpad("rahul sharma",20,"*");

select space(100);

select reverse("rahul sharma");

select replace("rahul sharma","rahul","Rahul");

select strcmp("rahul sharma","rahul sharma");

select strcmp("rahul sharma","rahul");

select strcmp("rahul","rahul sharma");

select format(235.3568,3);

select field("a","x","a","k");

select field("a","X","A","k");

select field("b","X","A","k");

select field(5,0,1,2,3,4,5);

select field(6,0,1,2,3,4,5);

select field("a","b","c","a");

select field("a","x","a","a");

select field("a","a","a","a");

select find_in_set("rahul","abhishek,salman,sanskar,rahul");

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

## Time Functions

select current_time();

select curtime();

select current_timestamp();

select localtime();

select localtimestamp();

select time("2025-10-14 12:42:00");

select hour("2025-10-14 12:42:00");

select minute("2025-10-14 12:42:00");

select second("2025-10-14 12:42:00");

select timediff("12:42:00","11:42:00");

select timediff("12:42:00","12:40:00");

select timediff("12:40:30","12:30:30");
