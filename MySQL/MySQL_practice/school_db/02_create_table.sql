-- 2. Creating table 'student_info' and adding columns like student_id, name, age, marks, department 

-- Using database 'school_db'
USE school_db;

CREATE TABLE student_info(

    student_id INT AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(100) NOT NULL,

    age INT,

    marks FLOAT,

    department VARCHAR(50) DEFAULT 'General',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);