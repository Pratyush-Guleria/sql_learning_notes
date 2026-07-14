-- 1. Creating a Data Base 'schooldb'--
DROP DATABASE IF EXISTS schooldb;

CREATE DATABASE schooldb;

USE schooldb;

-- 2. Creating Table 'students_info' : student_id, name, age, marks, department with proper columns and constraints --
CREATE TABLE students_info(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    marks FLOAT,
    department VARCHAR(50) DEFAULT 'General',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- 3. Inserting Data of 5 student --
INSERT INTO students_info(name, age, marks, department)
VALUES
        ('Pratyush', 17, 68, 'CSE'),
        ('Anirudh', 13),
        ('ChatGPT', 20, 100, 'Civil'),
        ('Claude', 20, 100, 'CSE'),
        ('Google Gemini', 10, 99.9);


-- 4. Checking Tabel Structure --
DESC students_info; 
