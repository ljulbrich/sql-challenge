CREATE TABLE employees (
    emp_no SERIAL PRIMARY KEY,
    emp_title_id VARCHAR (255),
    birth_date VARCHAR (255),
    first_name VARCHAR (255),
    last_name VARCHAR (255),
    sex VARCHAR (50),
    hire_date DATE
);

CREATE TABLE salaries (
    emp_no SERIAL,
    salary SERIAL PRIMARY KEY
);

CREATE TABLE titles (
    title_id VARCHAR (255) PRIMARY KEY,
    title VARCHAR (255)
);

CREATE TABLE departments (
    dept_no VARCHAR (255) PRIMARY KEY,
    dept_name VARCHAR (255)
);

CREATE TABLE dept_emp (
    emp_no VARCHAR (255),
    dept_no VARCHAR (255)
);

CREATE TABLE dept_managemer (
    dept_no VARCHAR (255)
    emp_no VARCHAR (255)
);