create table employee(id integer, salary integer);

select * from employee

insert into employee values(1, 100)
insert into employee values(2, 300)
insert into employee values(3, 200)
insert into employee values(4, 500)
insert into employee values(5, 600)

select salary as SecondHighestSalary from(
select rank()over(order by salary desc) as rank_num, id,salary from employee) a where rank_num=2

create table employee1(id integer, salary integer)
insert into employee1 values(1, 100)

select * from employee1

select salary as SecondHighestSalary from(
select rank()over(order by salary desc) as rank_num, id,salary from employee1) a where rank_num=2;

-- solution for theabove problem
declare @result integer = (select count(*) as result from employee1)
if @result = 1
	select null as "SecondHighestSalary"
else 
select salary as SecondHighestSalary from(
select rank()over(order by salary desc) as rank_num, id,salary from employee) a where rank_num=2
-- end of the solution
 



select 
case when salary is not null then salary else 
'null' end as SecondHighestSalary from(
select rank()over(order by salary desc) as rank_num, id,salary from employee1) a where rank_num=2

