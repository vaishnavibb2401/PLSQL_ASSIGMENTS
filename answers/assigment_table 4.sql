

--Q1. Write a query to generate following output.

SELECT employee_id,first_name||' '||last_name Full_name,email,salary
FROM hr.employees

--Q2.Write a query to display job_id and number of manager under particular job.
-- Show only those jobs that have more than one manager.

 
select job_id,
       count(DISTINCT manager_id) AS no_of_managers
from hr.employees
where manager_id IS NOT NULL
group by job_id
having count(DISTINCT manager_id) > 1;

SELECT job_id,count(manager_id)
from hr.employees 
where manager_id>1
group by job_id;



--Q3. Display the country name and number of employees those working 
--in particular city that count of employee is greater than 30.
(Hint: Using Equijoin and Group by )

select co.country_name,
       count(e.employee_id) as employee_count
from hr.employees e
join hr.departments d
  on e.department_id = d.department_id
join hr.locations l
  on d.location_id = l.location_id
join hr.countries co
  on l.country_id = co.country_id
group by co.country_name
having count(e.employee_id) > 30
order by employee_count desc;


--Q4. Display cities name and number of departments
-- present those cities. And exculde departments there are no any employees.

select * from emp_dummy

create table dept_dummy
as select * from hr.departments

select * from dept_dummy
create table 
as select * from hr.employees

select * from 

--Q5. Display the salary range and number of employees how are salary in between of range. 


select low_sal,hig_sal,
count(*) as number_of_employees
from ( select
case
when salary between 1000 and 2999  then 1000
when salary between 3000 and 4999  then 3000
when salary between 5000 and 9999  then 5000
when salary between 10000 and 14999 then 10000
when salary between 15000 and 19999 then 15000
when salary between 20000 and 25000 then 20000
end as low_sal,
case
  
when salary between 1000 and 2999  then 2999
when salary between 3000 and 4999  then 4999
when salary between 5000 and 9999  then 9999
when salary between 10000 and 14999 then 14999
when salary between 15000 and 19999 then 19999
when salary between 20000 and 25000 then 25000
end as hig_sal
from hr.employees
)
group by low_sal, hig_sal
order by low_sal;


--Q6. Display Year list and number of Employees join in particular year.

select extract(year from hire_date) as join_year,
       count(*) as no_of_employees
from hr.employees
group by extract(year from hire_date)
order by join_year;



----Q7. Display Manager_id , Manager Full Name and Under number of employees only those 
--managers how have more than 5 employees under working. Result sort by manager_ID


select * from emp_dummy

select e.employee_id,e.first_name||' '||e.last_name full_name, 
count(e.employee_id)
 from emp_dummy e
 join emp_dummy s
 on e.manager_id = s.manager_id 
 group by 
 e.employee_id,
 e.first_name,
 e.last_name
 having count (s.employee_id)>5
 order by e.employee_id  
 








