-- Using database 'academic_db'
USE academic_db;

-- 1. INNER JOIN — only those students whose department exists
SELECT students.name, departments.dept_name
FROM students
INNER JOIN departments ON students.dept_id = departments.dept_id;


-- 2. LEFT JOIN — all students, plus department info where available
SELECT students.name, departments.dept_name
FROM students
LEFT JOIN departments ON students.dept_id = departments.dept_id;


-- 3. RIGHT JOIN — all departments, plus students where present
SELECT students.name, departments.dept_name
FROM students
RIGHT JOIN departments ON students.dept_id = departments.dept_id;


-- 4. Number of students in each department — JOIN + GROUP BY
SELECT departments.dept_name, COUNT(students.student_id) AS Total_Students
FROM students
INNER JOIN departments ON students.dept_id = departments.dept_id
GROUP BY departments.dept_name;


-- 5. Only CSE students — JOIN + WHERE
SELECT students.name, departments.dept_name
FROM students
INNER JOIN departments ON students.dept_id = departments.dept_id
WHERE departments.dept_name = 'CSE';