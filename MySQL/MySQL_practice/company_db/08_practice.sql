-- Use database 'company_db'
USE company_db;

-- 1. Show employees earning more than the average salary (
SELECT name, salary
FROM employe_info
WHERE salary > (SELECT AVG(salary) FROM employe_info);


-- 2. Find the employee with the lowest salary 
SELECT name, salary
FROM employe_info
WHERE salary = (SELECT MIN(salary) FROM employe_info);


-- 3. Show the company average alongside each employee's salary 
SELECT 
    name, 
    salary,
    (SELECT AVG(salary) FROM employe_info) AS Company_Average
FROM employe_info;


-- 4. Show employees earning more than their department's average — correlated subquery
SELECT e1.name, e1.department, e1.salary
FROM employe_info e1
WHERE e1.salary > (
    SELECT AVG(e2.salary) 
    FROM employe_info e2 
    WHERE e1.department = e2.department
);
