-- Using database 'school_db'
USE school_db;

-- 1. Get the total number of students
SELECT COUNT(*) FROM student_info;

-- 2. Calculate the average marks of all students
SELECT AVG(marks) AS Average_Marks FROM student_info;

-- 3. Show highest and lowest marks together
SELECT MAX(marks) AS Highest_marks, MIN(marks) AS Lowest_marks
FROM student_info;

-- 4. Get the student count for each department
SELECT department, COUNT(*) AS Total_Students
FROM student_info
GROUP BY department;

-- 5. Calculate average marks per department and sort in descending order
SELECT department, AVG(marks) AS Average_Marks
FROM student_info
GROUP BY department
ORDER BY Average_Marks DESC;

-- 6. Display only those departments where the average marks are greater than 80
SELECT department, AVG(marks) AS Average_Marks
FROM student_info
GROUP BY department
HAVING Average_Marks > 80;

-- 7. Count the number of unique departments (Fixed the space issue!)
SELECT COUNT(DISTINCT department) AS Total_Departments
FROM student_info;
