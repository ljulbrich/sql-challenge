-- Creating tables first
CREATE TABLE IF NOT EXISTS employees (
    emp_no SERIAL PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(255),
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex VARCHAR(50),
    hire_date DATE
);

CREATE TABLE IF NOT EXISTS salaries (
    emp_no SERIAL,
    salary SERIAL PRIMARY KEY NOT NULL
);

CREATE TABLE IF NOT EXISTS titles (
    title_id VARCHAR(255) PRIMARY KEY NOT NULL,
    title VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS departments (
    dept_no VARCHAR(255) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS dept_emp (
    emp_no SERIAL,
    dept_no VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS dept_managemer (
    dept_no VARCHAR(255),
    emp_no SERIAL
);

-- Adding relationships
ALTER TABLE IF EXISTS public.dept_emp
    ADD CONSTRAINT emp_no FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH FULL
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.dept_emp
    ADD CONSTRAINT dept_no FOREIGN KEY (dept_no)
    REFERENCES public.departments (dept_no) MATCH FULL
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.dept_managemer
    ADD CONSTRAINT emp_no FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
ALTER TABLE IF EXISTS public.employees
    ADD CONSTRAINT title_id FOREIGN KEY (emp_title_id)
    REFERENCES public.titles (title_id) MATCH FULL
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.salaries
    ADD CONSTRAINT emp_no FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;