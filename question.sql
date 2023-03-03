--1.List the employee number, last name, first name, sex, and salary of each employee.
SELECT salaries.emp_no,employees.last_name, employees.first_name,employees.sex,salaries.salary
FROM employees
INNER JOIN salaries
ON salaries.emp_no = employees.emp_no
ORDER BY employees.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE extract(year FROM hire_date) = 1986;
--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT distinct ON (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name,employees.first_name
FROM dept_manager
INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no
ORDER BY dept_manager.dept_no DESC;

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT distinct ON (employees.emp_no) employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
ORDER BY employees.emp_no DESC;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.last_name, employees.first_name
FROM employees
WHERE (employees.first_name = 'Hercules') and (lower(employees.last_name)like 'b%' )
ORDER BY employees.last_name;

--Created new table to pull Data
select distinct on (emp_no) *
into combo_emp_dept
from dept_emp
order by emp_no DESC;

--6.List each employee in the Sales department, including their employee number, last name, and first name. 
SELECT employees.emp_no, employees.last_name,employees.first_name,departments.dept_name
FROM employees
INNER JOIN combo_emp_dept
ON employees.emp_no = combo_emp_dept.emp_no
INNER JOIN departments
ON combo_emp_dept.dept_no = departments.dept_name
WHERE (LOWER(departments.dept_name)='Sales') 

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join combo_emp_dept
on combo_emp_dept.emp_no = employees.emp_no
inner join departments
on departments.dept_no = combo_emp_dept.dept_no
where (lower(departments.dept_name) = 'Sales') or (lower(departments.dept_name)= 'Development');
--8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name,COUNT(last_name) as frecuency
FROM employees
GROUP BY last_name
ORDER BY frecuency DESC;