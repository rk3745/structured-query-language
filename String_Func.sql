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