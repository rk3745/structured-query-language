use school;

# Like Operators 

# Display students who are from delhi
select * from students_data where city ="Delhi";

# Display students whose marks greater than 80 or city delhi
select * from students_data where marks>80 and city = "delhi";

# Display students who are not from mumbai
select * from students_data where not city ="mumbai";

# Display students who are either from delhi or kolkata
select * from students_data where city = "delhi" or city = "kolkata";

# Display students who are not from Delhi or Mumbai
select * from students_data where not (city = "delhi" or city = "Mumbai");

# Display students whose marks are between 70 and 90
select * from students_data where marks between 70 and 90;

# Display students whose age is not between 20 and 22
select * from students_data where age not between 20 and 22;

# Display students whose name start with 's'
select * from students_data where name like "s%";

# Display students whose name end with 'a'
select * from students_data where name like "%a";

# Display students whose name contain 'an'
select * from students_data where name like "%an%";

# Display students whose name are exactly 5 characters long
SELECT * from students_data where name like "_____";

# Display students whose name start with 'A' or 'P'
select * from  students_data where name like "A%" or "P%";

# Display students whose name end with 'r'
select * from students_data where name like "%r";

# Display students whose name contain 'na' everywhere
select * from students_data where name like "%na%";

# Display students whose name contain double letters like "ee" or "ss"
select * from students_data where name like "%ee%" or "%ss%";

# Display students who course is either BCA or MCA and marks above 80
select * from students_data where course = ("BCA" or "MCA") and marks>80;

# Display male students with marks greater than 70
select * from students_data where gender = "m" and marks>70;

# Display students whose city name starts with 'D' or 'M'
select * from students_data where city like "d%" or city like "m%";

# Display students whose course name contains 'tech' using REGEXP
select * from students_data where course regexp "tech";

# Display students who are from Delhi OR have marks between 80 and 90
select * from students_data where city = "delhi" and marks between 80 and 90;

select * from students_data;

select * from students_data where age>20 and gender = "m";

select * from students_data where course = "BTech" and gender = "m";

select * from students_data where name like "%si%";

select * from students_data where city like "%uru";