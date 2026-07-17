-- Using database 'salary_db'
USE salary_db;

-- 1. INNER JOIN — employees whose department exists; show location as well
SELECT employees.name, dept_info.dept_name, dept_info.location
FROM employees
INNER JOIN dept_info ON employees.dept_id = dept_info.dept_id;


-- 2. LEFT JOIN — all employees; include department and location where available
SELECT employees.name, dept_info.dept_name, dept_info.location
FROM employees
LEFT JOIN dept_info ON employees.dept_id = dept_info.dept_id;


-- 3. Average salary of each department — JOIN + GROUP BY
SELECT dept_info.dept_name, AVG(employees.salary) AS Average_Salary
FROM employees
INNER JOIN dept_info ON employees.dept_id = dept_info.dept_id
GROUP BY dept_info.dept_name;


-- 4. Employees in the Delhi location only — JOIN + WHERE
SELECT employees.name, dept_info.dept_name, dept_info.location
FROM employees
INNER JOIN dept_info ON employees.dept_id = dept_info.dept_id
WHERE dept_info.location = 'Delhi';


-- 5. Departments with more than one employee — JOIN + GROUP BY + HAVING
SELECT dept_info.dept_name, COUNT(employees.emp_id) AS Total_Employees -- 'emp_id' kar diya idhar
FROM employees
INNER JOIN dept_info ON employees.dept_id = dept_info.dept_id
GROUP BY dept_info.dept_name
HAVING COUNT(employees.emp_id) > 1;
