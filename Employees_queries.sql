
--Data Analysis: 

-- 1.List the following details of each employee: 
-- employee number, last name, first name, gender, and salary

SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary
FROM employees
LEFT JOIN salaries
ON (employees.emp_no = salaries.emp_no)
ORDER BY employees.emp_no;

-- 2. List employees who were hired in 1986.
--Using 3 different methods to find the data for 1986, all give the same results

-- Option 1:
--SELECT * FROM employees
--WHERE hire_date > '1986-01-01' AND hire_date < '1987-01-01'
--ORDER BY hire_date DESC;

-- Option 2:
--SELECT * FROM employees
--WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01'
--ORDER BY hire_date DESC;

-- Option 3:
SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date DESC;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.

SELECT (dept_man.dept_no, 
		dept.dept_name, 
		dept_man.emp_no, 
		emp.last_name, 
		emp.first_name,
	   	dept_man.from_date,
	   	dept_man.to_date)
FROM departments AS dept
INNER JOIN department_manager AS dept_man 
ON (dept_man.dept_no = dept.dept_no)
INNER JOIN employees AS emp
ON (dept_man.emp_no = emp.emp_no);

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT (emp.emp_no,
		emp.last_name,
		emp.first_name,
		dept.dept_name)
FROM employees AS emp
INNER JOIN department_employees AS dept_e
ON (emp.emp_no = dept_e.emp_no)
INNER JOIN departments AS dept
ON (dept_e.dept_no = dept.dept_no);

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT (emp.emp_no,
		emp.last_name,
		emp.first_name,
		dept.dept_name)
FROM employees AS emp
INNER JOIN department_employees AS dept_e
ON (emp.emp_no = dept_e.emp_no)
INNER JOIN departments AS dept
ON (dept_e.dept_no = dept.dept_no)
WHERE dept.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

SELECT (emp.emp_no,
		emp.last_name,
		emp.first_name,
		dept.dept_name)
FROM employees AS emp
INNER JOIN department_employees AS dept_e
ON (emp.emp_no = dept_e.emp_no)
INNER JOIN departments AS dept
ON (dept_e.dept_no = dept.dept_no)
WHERE dept.dept_name IN ('Sales','Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.

SELECT COUNT(last_name) AS counter, last_name 
FROM employees
GROUP BY last_name
ORDER BY counter DESC;
