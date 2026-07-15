-- Using database 'school_db'
USE school_db;

-- 1. Sort by marks in descending order — top student first
SELECT * FROM student_info
ORDER BY marks DESC;


-- 2. Show the top 3 students based on marks
SELECT * FROM student_info
ORDER BY marks DESC LIMIT 3;


-- 3. Sort CSE students by marks
SELECT * FROM student_info
WHERE department = 'CSE'
ORDER BY marks ASC;


-- 4. Update Pratyush's marks to 95
UPDATE student_info
SET marks = 95
WHERE name = 'Pratyush';


-- 5. Delete students with NULL marks
DELETE FROM student_info
WHERE marks IS NULL;