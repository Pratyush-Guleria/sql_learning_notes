-- Using database 'company_db'
USE company_db;

-- 2. Creating table 'employe_info'

CREATE TABLE employe_info(

    employee_id INT AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(100) NOT NULL,

    department VARCHAR(50) DEFAULT 'General Emolpyee',

    salary FLOAT NOT NULL,

    experience FLOAT DEFAULT 0
);