-- Using database 'school_db'
USE school_db;

-- 1. Showing all students data 
SELECT * FROM student_info;


-- 2. Showing only 'name' and 'marks' columns
SELECT name, marks FROM student_info;


-- 3. Showing only 'CSE' department students
SELECT * FROM student_info WHERE department = 'CSE';


-- 4. Showing students having marks more than 80
SELECT *  FROM student_info WHERE marks > 80;


-- 5. Showing students having marks between 70 and 100
SELECT * FROM student_info WHERE marks BETWEEN 70 and 100 ;


-- 6. Showing students of department 'CSE' or 'Mechanical'
SELECT * FROM student_info WHERE department IN ('CSE', 'Mechanical');


-- 7. Showing students having 'NULL' marks
SELECT * FROM student_info WHERE marks IS NULL;