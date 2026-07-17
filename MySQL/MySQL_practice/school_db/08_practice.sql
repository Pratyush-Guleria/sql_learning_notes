-- Using database 'school_db'
USE school_db;

-- 1. Show students who scored above the average marks 
SELECT name, marks
FROM student_info
WHERE marks > (SELECT AVG(marks) FROM student_info);


-- 2. Find the student with the highest marks 
SELECT name, marks
FROM student_info
WHERE marks = (SELECT MAX(marks) FROM student_info);


-- 3. Show each student's marks alongside the class average in the same row 
SELECT 
    name, 
    marks,
    (SELECT AVG(marks) FROM student_info) AS Class_Average
FROM student_info;


-- 4. Show students who scored above their department's average
SELECT 
    name, 
    marks,
    department,
    (SELECT AVG(marks) FROM student_info) AS Class_Average_Marks
FROM student_info;