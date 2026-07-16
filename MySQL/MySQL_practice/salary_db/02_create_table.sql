-- Use database 'salary_db'
USE salary_db;

-- Creating table

-- Table 1: employees
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    dept_id INT,
    salary FLOAT
);

-- Table 2: departments
CREATE TABLE dept_info (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

