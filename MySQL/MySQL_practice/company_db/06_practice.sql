-- Using database 'company_db'
USE company_db;

-- 1. Sorting by salary in descending order
SELECT * FROM employe_info
ORDER BY salary DESC;


-- 2. Showing the top 2 highest-paid employees
SELECT * FROM employe_info
ORDER BY salary DESC LIMIT 2;


-- 3. Increaseing the salary of all employees in the ML department by 10%
UPDATE employe_info
SET salary = salary * 1.10
WHERE department = 'ML';


-- 4. Deleteing employees with 1 year of experience
DELETE FROM employe_info
WHERE experience = 1;


-- 5. Sorting by salary, skip the first 2, and show the next 3 — use OFFSET
SELECT * FROM employe_info
ORDER BY salary DESC LIMIT 3 OFFSET 2;