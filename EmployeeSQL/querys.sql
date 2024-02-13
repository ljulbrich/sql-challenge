-- Listing emp-no, last-name, first-name, sex and salary
SELECT employees.emp_no, employees.last_name, employees.first_name,
        employees.sex, salaries.emp_no, salaries.salary
FROM employees LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- Listing first-name, last-name, and hire date of employees who were
--  hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Listing manager of each department along with their department number,
--  employee number, last-name and first-name
SELECT dept_managemer.dept_no, departments.dept_name, employees.emp_no,
        employees.last_name, employees.first_name
FROM employees LEFT JOIN dept_managemer
ON employees.emp_no = dept_managemer.emp_no
LEFT JOIN departments
ON dept_managemer.dept_no = departments.dept_no;

-- Listing dept number for each employee, emp-no, last-name, first-name, dept-name
SELECT dept_emp.dept_no, employees.emp_no,
        employees.last_name, employees.first_name, departments.dept_name
FROM employees LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no;

-- Listing first-name, last-name, sex, of each employee whose first name
--  is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List each employee in the sales dept, emp-no, last-name, first-name, dept-name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- List employees in sales & development: emp-no, last-name, first-name, dept-name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

-- List how many employees share the same last name
SELECT last_name, COUNT(last_name) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY last_name;