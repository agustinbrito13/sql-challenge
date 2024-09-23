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

