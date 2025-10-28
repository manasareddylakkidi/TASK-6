select * from EMPLOYEE


select * from employees
select * from departments


select emp_id,salary from employees

select emp_id,first_name,salary from employees
WHERE salary>4000;

select emp_id,last_name,first_name,salary,Gmail from employees
ORDER BY salary desc;

select emp_id,sum(salary) as total_salary from employees
GROUP BY emp_id;

select emp_id,sum(salary) as total_salary from employees
GROUP BY emp_id
ORDER BY total_salary desc;



--------------JOINS----------------------------------


select e.emp_id,e.first_name,e.department_id,d.department_name from employees as e
inner join departments as d
on e.department_id=d.department_id

select e.emp_id,e.first_name,e.department_id,d.department_name from employees as e
left join departments as d
on e.department_id=d.department_id

select e.emp_id,e.first_name,e.department_id,d.department_name from employees as e
right join departments as d
on e.department_id=d.department_id


--------------SUBQUERIES-------------
SUBQUERY: A sub query is a query inside a query.
It can be in the select ,from or where clause.
It useful to filter,aggregate ,or calculate values dynamically.

1,SUBQUERY IN WHERE CLAUSE:------------------------------

select emp_id from employees
where emp_id IN(
select emp_id from departments
where salary<4000
);

inner query:----------------------------------------------
select emp_id from employees where salary > 5000;

select first_name,(select sum(salary) from departments
where employees.department_id=departments.department_id)as total_salary from employees;


---------AGGREGATION FUNCTIONS----------------
1)SUM():Adds up numeric values
2)AVG():Calculate avg
3)COUNT():count rows or non-null values
4)MAX():finds max values
5)MIN():finds min values

1)SUM()

select sum(salary) as total_salary from employees

select avg(salary) as avg_salary from employees

select max(salary) as max_salary from employees

select min(salary) as min_salary from employees

select count(salary) as count_salary from employees


---------------CREATE VIEW ANALYSIS---------------------

VIEW: a View is a virtual table created from the result of an sql query...
*It doesnt store data physically..it just store the query


create view vw_deptsummarize
as
select d.department_name,
cast(isnull(sum(salary),0)as int)as totalsal,
cast(isnull(avg(salary),0)as int)as avgsal,
count(*) as empcount,
max(salary)as maxsal,
min(salary)as minsal from departments as d left join employees as e
on d.department_id=e.department_id
group by d.department_name

-------optimize queries with indexses-------------------------









---------------TASK 6-------------------------------------------------------------------------


A)  select emp_id,joining_of_date,MONTH (joining_of_date)as joindate
from employees


B)  select MONTH(joining_of_date)as month,
sum(salary)as salary
from employees
GROUP BY
 MONTH(joining_of_date)
 ORDER BY
    month;

select 
YEAR(joining_of_date)as joinng_yr,
MONTH(joining_of_date)as joining_month,
SUM(salary)as salary from employees
GROUP BY YEAR(joining_of_date),MONTH(joining_of_date)


 C)    select sum(salary) as total_revenue from employees

 D)   select count(DISTINCT emp_id) as emp_volume from employees

  E)   select * from employees
       order by emp_id asc;
	      
	   select * from employees
	   order by emp_id desc,joining_of_date asc;


  F)  select 
             YEAR(joining_of_date) as join_year,
			 MONTH(joining_of_date)as join_month,
			 sum(salary)as salary 
			 from employees
			 where joining_of_date BETWEEN '2025-01-01' AND '2025-12-31'
			 GROUP BY
			      YEAR(joining_of_date),month(joining_of_date)
             ORDER BY
			       join_year,join_month






