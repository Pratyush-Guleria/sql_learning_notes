-- Using database 'salary_db'
USE salary_db;

-- 1. INNER JOIN — employees whose department exists; show location as well
SELECT employees.name, departments.dept_name, departments.location
FROM employees
INNER JOIN departments ON employees.dept_id = departments.dept_id;


-- 2. LEFT JOIN — all employees; include department and location where available
SELECT employees.name, departments.dept_name, departments.location
FROM employees
LEFT JOIN departments ON employees.dept_id = departments.dept_id;


-- 3. Average salary of each department — JOIN + GROUP BY
SELECT departments.dept_name, AVG(employees.salary) AS Average_Salary
FROM employees
INNER JOIN departments ON employees.dept_id = departments.dept_id
GROUP BY departments.dept_name;


-- 4. Employees in the Delhi location only — JOIN + WHERE
SELECT employees.name, departments.dept_name, departments.location
FROM employees
INNER JOIN departments ON employees.dept_id = departments.dept_id
WHERE departments.location = 'Delhi';


-- 5. Departments with more than one employee — JOIN + GROUP BY + HAVING
SELECT departments.dept_name, COUNT(employees.employee_id) AS Total_Employees
FROM employees
INNER JOIN departments ON employees.dept_id = departments.dept_id
GROUP BY departments.dept_name;
HAVING COUNT(employees.employee_id) > 1;