---- coalsece----
select COALESCE  (null,null,20,10,null)from dual;

--- case 

select employee_id ,first_name,last_name,salary,
case 
  when salary >=10000 then 'higher salary'
  when salary between 5000 and 9999 then 'medium salary '
  when salary < 4000 then 'lower salry'
else 'not specified'
end as salary_category
from hr.employees;
---

select employee_id ,first_name,last_name,salary,
case 
  when salary >=10000 then 'higher salary'
  when salary between 5000 and 9999 then 'medium salary '
  when salary < 4000 then 'lower salry'
else 'not specified'
end as salary_category 
from hr.employees;
----------

select employee_id ,first_name,last_name,salary,
case 
  when salary >=10000 then '1.5'
  when salary between 5000 and 9999 then '1.0 '
  when salary between  4000  and 3999 then '0.5'
else '0.1'
end as commision_pct ,salary * case 
  when salary >=10000 then '1.5'
  when salary between 5000 and 9999 then '1.0 '
  when salary between  4000  and 3999 then '0.5'
else '0.1'
end as total_salary
from hr.employees;

----
select employee_id ,first_name,last_name,salary,
case 
  when salary >=10000 then '1.5'
  when salary between 5000 and 9999 then '1.0 '
  when salary between  4000  and 3999 then '0.5'
else '0.1'
end as commision_pct 
from hr.employees;
----

----decode----

select decode (,1,'one',2,'two',2,2,'three''not specified')from dual;


---

select  employee_id ,first_name,last_name,salary,salary*updated_commision total_salary_updated
 from (select employee_id ,first_name,last_name,salary,
case 
  when salary >=10000 then '1.5'
  when salary between 5000 and 9999 then '1.0 '
  when salary between  4000  and 3999 then '0.5'
else '0.1'
end as updated_commision 
from hr.employees);
----------
select employee_id ,first_name ,last_name ,department_id,
MAX(SALARY )over(partition by department_id order by salary desc)as rnk 

from hr.employees;















--HOW MNAY DAYS THE EMP WORK 

SELECT employee_id,first_name, hire_date, TRUNC(SYSDATE - hire_date) AS total_working_days
FROM hr.employees
WHERE employee_id = 101;

