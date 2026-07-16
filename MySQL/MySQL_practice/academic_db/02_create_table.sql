-- Using database 'academic_db'
USE academic_db;

-- Table 1: students
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    dept_id INT
);

-- Table 2: departments  
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);