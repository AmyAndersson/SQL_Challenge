-- Qn 1. 
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s on 
	e.emp_no=s.emp_no

-- Qn 2.
select first_name, last_name, hire_date 
from employees
where hire_date LIKE '%1986';

-- Qn 3. 
select d_m.dept_no, d.dept_name, d_m.emp_no, e.last_name, e.first_name
from dept_manager as d_m
inner join departments as d on d_m.dept_no=d.dept_no
inner join employees as e on d_m.emp_no=e.emp_no; 

--Q4. 
CREATE VIEW emp_dep as
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees as e
inner join dept_emp on 
e.emp_no= dept_emp.emp_no
inner join departments as d 
on dept_emp.emp_no= e.emp_no; 

select * from emp_dep;

--Q5. 
select first_name, last_name, sex
from employees
where first_name ='Hercules' AND last_name LIKE 'B%'; 

--Q6. 
select emp_no, last_name, first_name, dept_name
from emp_dep
where emp_no in (
	select emp_no
	from dept_emp
	where dept_no in (
		select dept_no 
		from departments
		where dept_name='Sales'));
--Q7. 
select emp_no, last_name, first_name, dept_name
from emp_dep
where emp_no in (
	select emp_no
	from dept_emp
	where dept_no in (
		select dept_no 
		from departments
		where dept_name='Sales' or dept_name='Development'));
		
-- Q8.
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc; 
		
