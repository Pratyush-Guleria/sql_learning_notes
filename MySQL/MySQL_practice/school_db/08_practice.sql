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
SELECT s1.name, s1.department, s1.marks
FROM student_info s1
WHERE s1.marks > (
    SELECT AVG(s2.marks)
    FROM student_info s2
    WHERE s2.department = s1.department
);