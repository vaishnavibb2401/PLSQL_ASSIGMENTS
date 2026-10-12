
--------------------------Employee------------

CREATE TABLE EMPLOYEE (
EMP_ID NUMBER,
FIRST_NAME VARCHAR2(20),
LAST_NAME VARCHAR2(20),
SALARY NUMBER,
JOINING_DATE DATE,
DEPARTMENT VARCHAR2(20)
);
SELECT * FROM EMPLOYEE;

insert into employee values (1,'John','Abraham',1000000,to_date ('01-JAN-13','DD-MM-YY' ),'Banking');
insert into employee values (2,'Michael','Clarke',800000,to_date ('01-JAN-13','DD-MM-YY' ),'Insurance');
insert into employee values (3,'Roy','Thomas',700000,to_date ('01-FEB-13','DD-MM-YY' ),'Banking');
insert into employee values (4,'Tom','Jose',600000,to_date ('01-FEB-13 ','DD-MM-YY' ),'Insurance');
insert into employee values (5,'Jerry','Pinto',650000,to_date ('01-FEB-13 ','DD-MM-YY' ),'Insurance');
insert into employee values (6,'Philip','Mathew',750000,to_date ('01-JAN-13','DD-MM-YY' ),'Services');



--------------------------------------Incentives------------------------------

create table incentives (
Employee_ref_id number,
Incentive_date date,
Incentive_amount number
);

select * from incentives;

insert into incentives values (1,to_date('01-Feb-13','dd-mm-yy'),5000);
insert into incentives values (2,to_date('01-Feb-13','dd-mm-yy'),3000);
insert into incentives values (3,to_date('01-Feb-13','dd-mm-yy'),4000);
insert into incentives values (1,to_date('01-jan-13','dd-mm-yy'),4500);
insert into incentives values (2,to_date('01-jan-13','dd-mm-yy'),3500);


/*select UPPER(to_char(incentive_date,'DD-MON-YY')),incentive_amount from incentives;*/


-- 1.	Write create table syntax for employee table and Incentive table

select * from employee;

select * from incentives;

--2.	Write syntax for insert data into table of employee table and Incentive table

-- employee table insert query 

insert into employee values (1,'John','Abraham',1000000,to_date ('01-JAN-13','DD-MM-YY' ),'Banking');
insert into employee values (2,'Michael','Clarke',800000,to_date ('01-JAN-13','DD-MM-YY' ),'Insurance');
insert into employee values (3,'Roy','Thomas',700000,to_date ('01-FEB-13','DD-MM-YY' ),'Banking');
insert into employee values (4,'Tom','Jose',600000,to_date ('01-FEB-13 ','DD-MM-YY' ),'Insurance');
insert into employee values (5,'Jerry','Pinto',650000,to_date ('01-FEB-13 ','DD-MM-YY' ),'Insurance');
insert into employee values (6,'Philip','Mathew',750000,to_date ('01-JAN-13','DD-MM-YY' ),'Services');

-- incentives table insert query 

insert into incentives values (1,to_date('01-Feb-13','dd-mm-yy'),5000);
insert into incentives values (2,to_date('01-Feb-13','dd-mm-yy'),3000);
insert into incentives values (3,to_date('01-Feb-13','dd-mm-yy'),4000);
insert into incentives values (1,to_date('01-jan-13','dd-mm-yy'),4500);
insert into incentives values (2,to_date('01-jan-13','dd-mm-yy'),3500);


--3.	Get First_Name,Last_Name from employee table
 
select first_name ,last_name from employee;

--4.	Get First_Name from employee table using alias name “Employee Name”

select first_name as employee_name from employee;

--5.	Get First_Name from employee table in upper case

select upper(first_name)from employee;

--6.	Select first 3 characters of FIRST_NAME from EMPLOYEE

select substr(first_name,1,3) from employee;

--8.	Get position of 'o' in name 'John' from employee table
select instr('john','o'),first_name from employee
where first_name= 'John';

--9.	Get FIRST_NAME from employee table after removing white spaces from right side.
select first_name ,rtrim(first_name)from employee;

--10.	Get First_Name from employee table after replacing 'o' with '$'

select first_name, replace(first_name,'o','$')from employee;

--11.	Get First_Name and Last_Name as single column from employee table separated by a '_'

select first_name ,last_name , first_name||'_'||last_name as full_name from employee;

--12.	Get FIRST_NAME, Joiningyear, Joining Month and Joining Date from employee table


SELECT first_name,joining_date, extract(month from joining_date) AS joining_month
FROM employee;

--13.	Get all employee details from the employee table order by First_Name Ascending

--select * from employee;

select * from  employee 
order by first_name;

--14.	Get all employee details from the employee table order by First_Name Ascending and Salary Descending?

select * from employee 
order by first_name ,salary desc;

select * from employee 
order by salary desc, first_name ;

--15.	Get employee details from employee table whose employee name is “John”

select * from employee 
where first_name ='John';


--16.	Get employee details from employee table whose employee name are “John” and “Roy”

select * from employee
where first_name in('John','Roy');


--17.	Get employee details from employee table whose employee name are not “John” and “Roy”.

select * from employee 
where first_name != 'John' and 
first_name != 'Roy';

--another way
 
select * from employee 
where first_name not in ('John','ROy');

--18.	Get employee details from employee table whose first name starts with 'J'.

select * from employee
where first_name like 'J%';

--19.	Get employee details from employee table whose first name contains 'o'.

select * from employee 
where first_name like '%o%';

--20.	Get employee details from employee table whose first name ends with 'n'.

select * from employee
where first_name like '%n';

--21.	Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.

select * from employee 
where first_name like '%___n';

--22.	Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.

select * from employee 
where first_name like 'J___';

--23.	Get employee details from employee table who’s Salary greater than 600000.

select * from employee 
where salary > 600000;

--24.	Get employee details from employee table whose joining year is “2013”.

select * from employee 
where to_char( joining_date,'yy' )=13;

--25.	Get employee details from employee table whose joining month is “January”.


select * from employee 
where to_char( joining_date,'mon' )='jan';

--26.	Get employee details from employee table who joined before January 1st 2013.

select * from employee 
where joining_date < to_date('01-JAN-13','dd-mon-yy');

-- 27.	Get employee details from employee table who joined after January 31st

select * from employee
where joining_date > to_date('31-JAN-13','dd-mon-yy');

--28.	Get Joining Date and Time from employee table

select  to_char(joining_date, 'DD-MON-YYYY HH24:MI:SS') AS joining_date_time from employee;

--29.	Get Joining Date, Time including milliseconds from employee table



--30.	Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.---------------ask


SELECT e.first_name,
       (i.incentive_date - e.joining_date) AS days_difference
FROM employee e
JOIN incentives i
ON e.employee_id = i.employee_ref_id;


--31.	Get department, total salary with respect to a department from employee table.
select * from employee;

select department,sum(salary)from employee
group by department;

--32.	Get department, total salary with respect to a department from employee table order by total salary descending.

select department, sum(salary) total_salary from employee
group by department 
order by total_salary desc ;

--33.	Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.


select department,count(department)no_of_employees,sum(salary)total_salary from employee
group by department 
order by total_salary desc;

--34.	Get department wise average salary from employee table order by salary ascending?

select department,avg(salary)avg_salary from employee 
group by department 
order by avg_salary ;

--35.	Get department wise maximum salary from employee table order by salary ascending?

select department ,max(salary)max_salary from employee
group by department 
order by max_salary;

--36.	Get department wise minimum salary from employee table order by salary ascending?

select department ,min(salary)min_salary from employee
group by department 
order by min_salary;

--37.	Select no of employees joined with respect to year and month from employee table.

select count (*), 
extract (year from joining_date)as joining_year ,
extract (month from joining_date) as joining_months 
from employee
group by  
extract (year from joining_date),
extract (month from joining_date) 

--38.	Select department,total salary with respect to a department from employee table where total salary greater than 800000 order by Total_Salary descending


select department,sum(salary)total_salary from employee
group by department 
having sum(salary) > 800000
order by total_salary desc;

--39.	Select employee details from employee table if data in incentive table?---ask

select   distinct e.emp_id, e.first_name,e.last_name,e.salary
from employee e
inner join incentives i  
on e.emp_id = i.employee_ref_id
order by e.emp_id 
 
select * from employee


--40.	Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table


select emp_id ,
       first_name,
       last_name ,
       salary,
case 
  when first_name ='John'then salary *0.20 
  when first_name ='ROy' then salary * 0.10
    else salary * 0.15
end as calculated 
from employee

--41.	Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as 'Services Dept' from employee table.

select first_name,
       last_name ,
       department ,
case 
     when department = 'Banking'then 'bank_dept'
     when  department = 'Insurance'then 'insurance_dept'
     when department =  'Services' then 'service_dept'
end as department_name_updated
from employee;


--42.	Delete employee data from employee table who got incentives in incentive table

DELETE FROM employee
WHERE emp_id IN (
    SELECT employee_ref_id
    FROM incentives
);
select * from employee

rollback
--43.	Select first_name, incentive amount from employee and incentives table for those employees who have incentives.


select * from incentives

select first_name,i.incentive_amount from employee e 
inner join incentives i 
on e.emp_id =i.employee_ref_id


--44.	Select first_name, incentive amount from employee and incentives table for those 
--employees who have incentives and incentive amount greater than 3000

select first_name,i.incentive_amount from employee e
inner join incentives i 
on e.emp_id =i.employee_ref_id
where incentive_amount > 3000

--45.	Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives
select first_name,i.incentive_amount from employee e
full outer join incentives i 
on e.emp_id =i.employee_ref_id

--46.	Select first_name, incentive amount from employee and incentives table for all employees even if they didn't
-- get incentives and set incentive amount as 0 for those employees who didn't get incentives.


select first_name,nvl(i.incentive_amount,0) from employee e
full outer join incentives i 
on e.emp_id =i.employee_ref_id


--47.	Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join

select first_name,i.incentive_amount from employee e
left join incentives i 
on e.emp_id =i.employee_ref_id

--48.	Select max incentive with respect to employee from employee and incentives table using sub query.
SELECT 
    e.emp_id,
    e.first_name,
    e.last_name,
    m.max_incentive
FROM employee e
JOIN (
        SELECT employee_ref_id, MAX(incentive_amount) AS max_incentive
        FROM incentives
        GROUP BY employee_ref_id
     ) m
ON e.emp_id = m.employee_ref_id;



---------
SELECT e.first_name,
       (SELECT MAX(i.incentive_amount)
        FROM incentives i
        WHERE e.emp_id = i.employee_ref_id) AS max_incentive
FROM employee e;









-- how to find department_id with highest total salary

SELECT department_id,sum(salary)
FROM hr. employees
GROUP BY department_id
ORDER BY SUM(salary) DESC;




select 




























