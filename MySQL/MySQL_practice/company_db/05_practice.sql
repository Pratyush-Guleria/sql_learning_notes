-- Using database 'company_db'
USE company_db;

-- 1. Showing all employees data
SELECT * FROM employe_info;


-- 2. Employees having salary more than 5000
SELECT * FROM employe_info 
WHERE salary > 5000;


-- 3. Employees with department 'ML' or 'LLM' 
SELECT * FROM employe_info 
WHERE department IN ('ML', 'LLM');


-- 4. Employees having names like GPT or Claude
SELECT * FROM employe_info 
WHERE name LIKE '%GPT%' OR name LIKE '%Claude%';


-- 5. Employees with experience more than 2 and salary more than 5000
SELECT * FROM employe_info 
WHERE experience > 2 AND salary > 5000;


-- 6. Employees not in 'HR' or 'Sales'
SELECT * FROM employe_info
WHERE department NOT IN ('HR', 'Sales');