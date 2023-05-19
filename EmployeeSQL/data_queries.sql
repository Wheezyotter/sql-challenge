-- 1.
-- employee number, last name, first name, sex, and salary of each employee
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
INNER JOIN salaries as sal 
ON (emp.emp_no=sal.emp_no);

-- 2. 
-- first name, last name, and hire date for the employees who were hired in 1986
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees as emp
WHERE EXTRACT('Year' FROM hire_date) = 1986;

-- 3. 
-- department number, department name, employee number, last name, and first name of all managers
SELECT dept_M.dept_no, dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM dept_manager as dept_M
INNER JOIN departments as dept 
ON (dept_M.dept_no = dept.dept_no)
INNER JOIN employees as emp 
ON (dept_M.emp_no = emp.emp_no);

-- 4. 
-- department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dept_emp.dept_no, dept_emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM dept_emp
INNER JOIN employees as emp 
ON (dept_emp.emp_no = emp.emp_no)
INNER JOIN departments as dept 
ON (dept_emp.dept_no = dept.dept_no);

-- 5. 
-- first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT emp.first_name, emp.last_name, emp.sex
FROM employees AS emp
WHERE emp.first_name = 'Hercules' 
AND lower(emp.last_name) SIMILAR TO '(b)%';

-- 6.
-- employee number, last name, and first name of all Sales department employees
SELECT emp.emp_no, emp.last_name, emp.first_name
FROM dept_emp
INNER JOIN employees as emp 
ON (dept_emp.emp_no = emp.emp_no)
INNER JOIN departments as dept 
ON (dept_emp.dept_no = dept.dept_no)
WHERE dept.dept_name = 'Sales';

-- 7. 
-- employee number, last name, first name, department name of all Sales and Development employees
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM dept_emp
INNER JOIN employees as emp 
ON (dept_emp.emp_no = emp.emp_no)
INNER JOIN departments as dept 
ON (dept_emp.dept_no = dept.dept_no)
WHERE dept.dept_name = 'Sales' 
OR dept.dept_name = 'Development';

-- 8. 
-- frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT(last_name) as "frequency"
FROM employees
GROUP BY last_name
ORDER BY "frequency" DESC;