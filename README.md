

# sql-challenge
homework9_db 

data engineering -data stypes
----------------------------------------------------

CREATE TABLE deparments (
dept_no VARCHAR (4) PRIMARY KEY NOT NULL,
dept_name VARCHAR(20) not null
);


CREATE TABLE titles(
title_id VARCHAR(10) PRIMARY KEY NOT NULL,
title VARCHAR(25)NOT NULL
);


CREATE TABLE employees (
emp_no int primary key not null,
emp_title_id VARCHAR(5) not null,
birth_date VARCHAR(10) not null,
first_name VARCHAR(40) not null,
last_name VARCHAR(40) not null,
sex VARCHAR(1) not null,
hire_date VARCHAR(15) not null,
Foreign key (emp_title_id) references titles(title_id)
);


CREATE TABLE dept_emp (
Id serial PRIMARY KEY NOT NULL,
emp_no int not null,
dept_no VARCHAR(10) not null,
FOREIGN KEY (emp_no) references employees(emp_no),
FOREIGN KEY (dept_no) references deparments(dept_no)
);




CREATE TABLE dept_manager(
dept_no VARCHAR(10)not null,
Id serial primary key not null,
emp_no int not null,
FOREIGN KEY (emp_no) references employees(emp_no),
FOREIGN KEY (dept_no) references deparments(dept_no)
);




CREATE TABLE salaries(
emp_no int PRIMARY KEY  NOT NULL,
salary VARCHAR(15) NOT NULL,
FOREIGN KEY (emp_no) references employees (emp_no)

);

-------------------------------------------------------------


-- 1. List the employee number, last name, first name, sex, and salary of each employee

 select e. emp_no, e. first_name, e. last_name, e. sex, s. salary
 from employees as e
inner join salaries as s on
e. emp_no=s. emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.

select first_name, last_name, hire_date
from employees
where hire_date LIKE '%1986%

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name

select d.emp_no, d.dept_no, w.dept_name, e.emp_no,e.last_name, e.first_name
from dept_manager as d
inner join employees as e on 
d.emp_no=e.emp_no
inner join deparments as w on
d.dept_no=w.dept_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name

select d.dept_no, e.emp_no, e.last_name, e.first_name, w.dept_name
from dept_emp as d 
inner join deparments as w on 
d.dept_no=w.dept_no
inner join employees as e on 
d.emp_no=e.emp_no

5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 

select first_name, last_name, sex
from employees
where first_name LIKE '%Hercules%' 
  and last_name  LIKE 'B%';

6.List each employee in the Sales department, including their employee number, last name, and first name

SELECT e.emp_no, e.last_name, e.first_name
FROM employees as e
JOIN dept_emp as d on
e.emp_no=d.emp_no
JOIN deparments as w on
d.dept_no=w.dept_no
where w.dept_name = 'Sales';

7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, w.dept_name
From employees as e
inner join dept_emp as d on
e.emp_no=d.emp_no
inner join deparments as w on 
d.dept_no=w.dept_no
where w.dept_name in ('Sales', 'Development');

8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name


select last_name, COUNT(*) as frecuency
from employees
group by last_name
order by frecuency desc
