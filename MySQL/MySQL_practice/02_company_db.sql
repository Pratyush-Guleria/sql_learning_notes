-- =====================================================
-- Company Database Practice
-- =====================================================

-- 1. Delete old database (if exists)
DROP DATABASE IF EXISTS companydb;

-- 2. Create database
CREATE DATABASE companydb;

-- 3. Use database
USE companydb;

-- =====================================================
-- Create Table
-- =====================================================

CREATE TABLE employees_info (

    employee_id INT AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(50) NOT NULL,

    age INT,

    salary FLOAT,

    experience FLOAT,

    department VARCHAR(50) DEFAULT 'Employee',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP

);

-- =====================================================
-- Insert Data
-- =====================================================

INSERT INTO employees_info
(name, age, salary, experience, department)

VALUES

('Google Gemini', 19, 10000, 7, 'ML'),

('ChatGPT', 20, 10000, 6.5, 'LLM'),

('Claude', 21, 90000, 15, 'Senior MLOps Engineer'),

('Pratyush', 18, 5000, 2, 'Junior ML Engineer'),

('Raj', 21, 1000, 1, 'HR'),

('Amit', 20, 1000, 2, 'Sales');

-- =====================================================
-- Verify Everything
-- =====================================================

-- Which database is active?
SELECT DATABASE();

-- Show databases
SHOW DATABASES;

-- Show tables
SHOW TABLES;

-- Show table structure
DESC employees_info;

-- Number of records
SELECT COUNT(*) AS Total_Employees
FROM employees_info;

-- Show complete table
SELECT *
FROM employees_info;