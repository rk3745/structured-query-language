create table employees(
Emp_Id int primary key,
name varchar(50),
Department varchar(30),
Salary int,
Experience int,
Gender varchar(10)
);

insert into employees value
(1,'Alice','HR',40000,3,'female'),
(2,'Bob','Finance',60000,6,'male'),
(3,'Charlie','IT',55000,4,'male'),
(4,'David','IT',80000,10,'male'),
(5,'Eva','finance',45000,2,'female'),
(6,'Frank','HR',50000,7,'male'),
(7,'Grace','IT',30000,1,'female'),
(8,'Helen','Finance',70000,9,'female'),
(9,'IAN','HR',65000,8,'male'),
(10,'Julia','IT',48000,3,'female');

update employees set name = 'Alice' where emp_id = 1;
update employees set name = 'Bob' where emp_id = 2;
update employees set name = 'Charlie' where emp_id = 3;
update employees set name = 'David' where emp_id = 4;

select * from employees;

# Q-1 If salary is greater than 70000 then print 'high', if salary between 40000 and 70000 then medium, else low ?
select name,salary,
case
	when salary > 70000 then 'high'
		when salary between 40000 and 70000 then 'medium'
		else 'low'
	end as salary_level
from employee;

# Q-2 if experience is 8 or more years then bonus is 10000, if 5 or more years then 5000, if low then 3000 ?
select name,salary,
case
	when experience >= 8 then  10000
		when experience >= 5 then 5000
		else 3000
	end as bonus
from employee;

# Q-3 if gender is male then print mr.(name), if gender is female then print ms.(name) ?
select name,gender,
case
	when gender ='male' then concat("Mr",".",name)
		when gender ='female' then concat("Ms",".",name)
    end as Titled_name
from employee;
    
# Q-4 if experience is more than 8 years salary is greater than 60000 then display grade 'A', if experience middle 8 and 5 years then grade 'B' else 'C' ?
select name,experience,salary,
case
	when experience > 8 and salary > 60000 then 'A'
		when experience between 5 and 8 then 'B'
		else 'C'
    end as Grade
from employee;
    
# Q-5 If department IT then code D01, if department finance then code D02, if HR then D03 ?
select name,department,
case
	when department = 'IT' then 'D01'
		when department = 'Finance' then 'D02'
		when department = 'HR' then 'D03'
	end as department_code
from employee;
    
# Q-6 If department IT or Finance then print technical, else non-technial ?
select name,department,
case 
	when department in ('IT','finance') then 'technical'
		else 'Non-technical'
    end as dept_code
from employee;

# Q-7 If salary is above then avg salary, Display above salary , else below salary ?
 select Emp_id,name,salary,
 case
	when salary > (Select avg(salary) from employee) then 'above salary'
    else 'below salary'
    end as compare_status
    from employee;
    
# Another type:-
select name,salary,
	case
		when salary - 50000 > 0 then concat('above 50k by',salary - 50000)
        when salary - 50000 < 0 then concat('below 50k by',50000 - salary)
        else 'exactly 50k'
        end as salary_gap
        from employee;
  
# Display remarks using nested case 
select name,department,experience,
	case
		when department = 'IT' then
			case
				when experience > 5 then 'experienced IT staff'
                else 'new IT staff'
			end
		else 'other department'
	end as remarks
from employee;