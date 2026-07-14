-- 3. Inserting data in the table
-- Using database 'school_db'
USE school_db;

-- Inserting data

INSERT INTO student_info(name, age, marks, department)
VALUES

        ('Pratyush', 17, 68, 'CSE'),

        ('Anirudh', 13),            

        ('ChatGPT', 20, 100, 'Civil'),

        ('Claude', 20, 100, 'CSE'),

        ('Google Gemini', 10, 99.9);

-- column 2 and 5 is blank to experience real database