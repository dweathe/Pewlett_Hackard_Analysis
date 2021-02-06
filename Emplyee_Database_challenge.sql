select emp_no, first_name, last_name
into Retirement_Employees
from employees
where (birth_date Between '1952-01-01' and '1955-12-31')
--join with the titles table
select retirement_employees.emp_no,
	retirement_employees.first_name,
	retirement_employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
into Employees_data
from retirement_employees
left join titles
on retirement_employees.emp_no = titles.emp_no
order by emp_no asc, from_date desc

	
--remove duplicate names due to promotions
select distinct on (emp_no) emp_no, 
first_name, last_name, title
into Unique_retirement_employees
from Employees_data
order by emp_no asc


-- Employee count by department number
SELECT COUNT(Unique_retirement_employees.emp_no), title
FROM Unique_retirement_employees
GROUP BY title
