-- 3. Inserting data in the table
-- Using database 'school_db'
USE school_db;

-- Inserting data

INSERT INTO student_info(name, age, marks, department)
VALUES

        ('Pratyush', 17, 68, 'CSE'),

        ('Anirudh', 13, 100, DEFAULT),            

        ('ChatGPT', 20, 100, 'Civil'),

        ('Claude', 20, 100, 'CSE'),

        ('Google Gemini', 10, 99.9, DEFAULT);