-- Using database 'company_db'
USE company_db;

-- 1. Calculate the total salary bill (sum of all employees' salaries)
SELECT SUM(salary) AS Total_Salary 
FROM employe_info;


-- 2. Display the average, maximum, and minimum salaries in a single query
SELECT AVG(salary) AS Average_Salary,
MAX(salary) AS Maximum_Salary,
MIN(salary) AS Minimum_Salary
FROM employe_info;


-- 3. Count the number of employees in each department
SELECT department, Count(*) AS Number_of_Employees
FROM employe_info
GROUP BY department;


-- 4. Calculate the average salary for each department — list the one with the highest average first
SELECT department, AVG(salary) AS Average_Salary_of_Department
FROM employe_info
GROUP BY department
ORDER BY Average_Salary_of_Department DESC;


-- 5. Show only those departments where the average salary is greater than 5,000
SELECT department, AVG(salary) AS Average_Salary_of_Department
FROM employe_info
GROUP BY department
HAVING Average_Salary_of_Department > 5000;


-- 6. Show only those departments that have more than 2 employees
SELECT department, COUNT(*) AS Department_more_than_2_employees
FROM employe_info
GROUP BY department
HAVING Department_more_than_2_employees > 2;


-- 7. Count the number of unique departments in the company
SELECT count(DISTINCT department) AS Number_of_Unique_Departments
FROM employe_info;