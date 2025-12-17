create database apple;

use apple;

create table employe(
emp_id int,
emp_name varchar(10),
dept_id int not null,
salary float
);

insert into employe(emp_id,emp_name,dept_id,salary)values
(1,'John',101,50000),
(2,'Emma',101,65000),
(3,'Raj',102,45000),
(4,'Meera',103,70000),
(5,'Ravi',102,48000),
(6,'Naina',103,52000),
(7,'Alex',101,52000);

select * from employe;

create table department(
dept_id int not null,
dept_name varchar(10)
);

insert into department(dept_id,dept_name)values
(101,'Sales'),
(102,'Marketing'),
(103,'Finance'),
(104,'HR');

select * from department;

# Q-1 Display employee name with their department name ?
select e.emp_name,d.dept_name
from employe e 
inner join department d on e.dept_id = d.dept_id;

# Q-2 List all employees including those with no matching department ?
select e.emp_name,d.dept_name
from employe e
right join department d on e.dept_id = d.dept_id;

# Q-3 List all departments even if no employees ?
select d.dept_name,e.emp_name
from employe e 
right join department d on e.dept_id = d.dept_id;

# Q-4 Show employees from Sales department ?
select e.emp_name,d.dept_name
from department d
left join employe e on e.dept_id = d.dept_id
where dept_name = 'Sales';

# Q-5 Find top 3 highest paid employees ?
select e.emp_name,salary
from employe e
order by salary desc
limit 3;

# Q-6 Find employees earning more than 50,000 from Marketing ?
select e.emp_name,dept_name,e.salary
from employe e
right join department d on e.dept_id = d.dept_id
where dept_name = 'Marketing' and salary > 50000;

# Q-7 Count employees in each department ?
select d.dept_name,count(emp_id) as emp_count
from department d 
left join employe e  on d.dept_id = e.dept_id
group by d.dept_name;

# Q-8 Show departments having more than 2 employees ?
select d.dept_name,count(emp_name) as emp_count
from department d 
left join employe e on d.dept_id = e.dept_id
group by d.dept_name
having count(emp_name) > 2;

# Q-9 Show highest salary in each department ?
select d.dept_name,max(salary)
from department d
left join employe e on d.dept_id = e.dept_id
group by d.dept_name
having max(salary);

# Q-10 Show employees whose salary is above department average ?
select e.emp_name,e.salary
from employe e
join department d on e.dept_id = d.dept_id
join (select dept_id, avg(salary) as avg_salary
from employe e 
group by dept_id)
a on e.dept_id = a.dept_id
where e.salary > a.avg_salary;

# Q-11 Show employees and their departments sorted by department name ?
select e.emp_name,d.dept_name
from employe e 
right join department d on e.dept_id = d.dept_id
order by d.dept_name,e.emp_name;

# Q-12 List the 2 lowest-paid employees with department names ?
select e.emp_name,d.dept_name,e.salary
from employe e 
inner join department d on e.dept_id = d.dept_id
order by salary
limit 2;

# Q-13 Show total salary expenditure per department ?
select d.dept_name,sum(e.salary) as total_salary
from department d 
left join employe e on d.dept_id = e.dept_id
group by d.dept_name
having sum(e.salary);

# Q-14 Show departments where total salary spent is more than 150,000 ?
select d.dept_name,sum(e.salary) as total_salary
from employe e
right join department d on d.dept_id = e.dept_id
group by d.dept_name
having sum(e.salary)>150000;

# Q-15 Show employees who belong to departments starting with 'S' ?
select e.emp_name,d.dept_name
from employe e 
left join department d on e.dept_id = d.dept_id
where d.dept_name like 'S%';

# Q-16 Find employees whose salary is the highest in their department ?
SELECT d.dept_name,max(e.salary)
FROM department d 
right JOIN employe e
ON d.dept_id = e.dept_id
group by d.dept_name
having max(salary);

# Q-17 Show employees and department sorted by salary descending ?
select e.emp_name,d.dept_name,salary 
from employe e 
right join department d on e.dept_id = d.dept_id
order by salary desc;

# Q-18 Count how many employees earn above 50,000 per department ?
select d.dept_name,count(e.emp_id)
from employe e
right join department d on e.dept_id = d.dept_id
where e.salary > 50000
group by d.dept_id,d.dept_name;

# Q-19 Show employee name, department, and salary for employees between 45,000 and 60,000 ?
select e.emp_name,d.dept_name,e.salary
from employe e 
right join department d on e.dept_id = d.dept_id
group by e.emp_name,d.dept_name,e.salary
having (salary between '45000' and '60000');

# Q-20 Find departments with no employees ?
select d.dept_name
from department d 
left join employe e on d.dept_id = e.dept_id
where e.emp_name is null;

## 16 ques 2nd way
select e.emp_name,salary as max_salary
from employe e
inner join (select dept_id, max(salary) as max_salary
from employe
group by dept_id)
d on e.dept_id = d.dept_id
and e.salary = d.max_salary;