
--Creating Tables for each csv
--Deparment table
CREATE TABLE departments (
	dept_no VARCHAR(8) PRIMARY key NOT NULL,
	dept_name VARCHAR(40) NOT NULL
);
--Employee Table
CREATE TABLE employees(
	emp_no INT PRIMARY key NOT NULL,
	emp_title VARCHAR (40),
	birth_date date NOT NULL,
	first_name VARCHAR (40) NOT NULL,
	last_name VARCHAR (40) NOT NULL,
	sex VARCHAR (1) NOT NULL,
	hire_date date NOT NULL

);
--dept_emp Table
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(8) NOT NULL,
	foreign key(dept_no) REFERENCES departments (dept_no),
	foreign key(emp_no) REFERENCES employees (emp_no)

);

--dept_manager Table
CREATE TABLE dept_manager(
	dept_no VARCHAR(8) NOT NULL,
	emp_no INT NOT NULL,
	foreign key(dept_no) REFERENCES departments (dept_no),
	foreign key(emp_no) REFERENCES employees (emp_no)

);

--Salaries Table
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	foreign key (emp_no) REFERENCES employees (emp_no)
);

--Title Table
CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY key NOT NULL,
	title VARCHAR(40) NOT NULL

);

--TEST TABLES
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM titles;
SELECT * FROM salaries;
SELECT * FROM employees;