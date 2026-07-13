# SQL — Basics: Database, Tables & INSERT 🗄️

> **Author:** Pratyush Guleria 
> **GitHub:** Pratyush-Guleria
> **Topic:** Creating databases, tables and inserting data

---

## Table of Contents
1. [What is SQL?](#1-what-is-sql)
2. [SQL vs Python/Pandas](#2-sql-vs-pythonpandas)
3. [Database Basics](#3-database-basics)
4. [Data Types in SQL](#4-data-types-in-sql)
5. [CREATE TABLE](#5-create-table)
6. [INSERT INTO](#6-insert-into)
7. [DROP TABLE & Database](#7-drop-table--database)
8. [Quick Revision](#8-quick-revision)

---

## 1. What is SQL?

**SQL (Structured Query Language)** is a language used to interact with databases — create tables, insert data, fetch data, update and delete.

**Why SQL for MLOps?**
- Real-world data lives in databases — not CSV files
- You'll fetch training data from SQL databases
- Log ML experiment results to databases
- Query production data for monitoring

> 💡 SQL is not a programming language like Python — it's a **query language**. You describe WHAT you want, not HOW to get it.

---

## 2. SQL vs Python/Pandas

| Task | Pandas | SQL |
|------|--------|-----|
| Filter data | `df[df["age"] > 18]` | `WHERE age > 18` |
| Sort data | `df.sort_values("age")` | `ORDER BY age` |
| Group data | `df.groupby("dept")` | `GROUP BY dept` |
| Join tables | `pd.merge(df1, df2)` | `JOIN` |
| Count rows | `df.count()` | `COUNT(*)` |

> 💡 Same concepts — different syntax. Since you already know Pandas, SQL will feel familiar.

---

## 3. Database Basics

### Create a Database

```sql
CREATE DATABASE school;
```

### Use a Database

```sql
USE school;
```

### Show all Databases

```sql
SHOW DATABASES;
```

### Delete a Database

```sql
DROP DATABASE school;
```

> ⚠️ `DROP DATABASE` deletes EVERYTHING inside it — no undo!

---

## 4. Data Types in SQL

Every column in SQL must have a data type — just like Python type hints.

| Data Type | What it stores | Example |
|-----------|---------------|---------|
| `INT` | Whole numbers | `age INT` |
| `FLOAT` | Decimal numbers | `salary FLOAT` |
| `VARCHAR(n)` | Text up to n characters | `name VARCHAR(100)` |
| `TEXT` | Long text | `description TEXT` |
| `DATE` | Date only | `2024-01-15` |
| `DATETIME` | Date + Time | `2024-01-15 10:30:00` |
| `BOOLEAN` | True/False | `is_active BOOLEAN` |

---

## 5. CREATE TABLE

**Syntax:**
```sql
CREATE TABLE table_name (
    column1 datatype constraints,
    column2 datatype constraints,
    ...
);
```

### Common constraints

| Constraint | What it does |
|-----------|-------------|
| `PRIMARY KEY` | Unique identifier for each row |
| `NOT NULL` | Column cannot be empty |
| `UNIQUE` | All values must be different |
| `AUTO_INCREMENT` | Automatically increases number |
| `DEFAULT value` | Default value if none provided |

### Example — Students table

```sql
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    age        INT,
    marks      FLOAT,
    department VARCHAR(50) DEFAULT 'General',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

### Example — Employees table

```sql
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    department  VARCHAR(50),
    salary      FLOAT NOT NULL,
    experience  INT DEFAULT 0,
    email       VARCHAR(100) UNIQUE
);
```

### Show all tables

```sql
SHOW TABLES;
```

### Show table structure

```sql
DESCRIBE students;
-- or
DESC students;
```

---

## 6. INSERT INTO

**Syntax — specify columns:**
```sql
INSERT INTO table_name (col1, col2, col3)
VALUES (val1, val2, val3);
```

**Syntax — all columns (order matters):**
```sql
INSERT INTO table_name
VALUES (val1, val2, val3, ...);
```

### Insert one row

```sql
INSERT INTO students (name, age, marks, department)
VALUES ('Pratyush', 17, 92.5, 'CSE');
```

### Insert multiple rows at once

```sql
INSERT INTO students (name, age, marks, department)
VALUES
    ('Pratyush', 17, 92.5, 'CSE'),
    ('Rahul',    19, 85.0, 'ECE'),
    ('Amit',     18, 78.5, 'CSE'),
    ('Sneha',    20, 88.0, 'IT'),
    ('Vikram',   17, 95.0, 'CSE');
```

### Insert without specifying columns

```sql
-- Must provide ALL values in exact column order
INSERT INTO students
VALUES (NULL, 'Pooja', 21, 72.0, 'Mechanical', NOW());
-- NULL for AUTO_INCREMENT — MySQL fills it automatically
-- NOW() for DATETIME — inserts current timestamp
```

---

## 7. DROP TABLE & Database

### Delete a table (structure + data)

```sql
DROP TABLE students;
```

### Delete only data, keep structure

```sql
TRUNCATE TABLE students;
```

### Delete a database

```sql
DROP DATABASE school;
```

> ⚠️ **DROP vs TRUNCATE:**
> - `DROP TABLE` — table gone completely, structure deleted
> - `TRUNCATE TABLE` — all rows deleted, but table structure stays
> - `DELETE` (covered later) — delete specific rows with conditions

---

## 8. Quick Revision

| What you want | SQL |
|--------------|-----|
| Create database | `CREATE DATABASE name;` |
| Use database | `USE name;` |
| Create table | `CREATE TABLE name (col type, ...);` |
| Auto increment ID | `id INT AUTO_INCREMENT PRIMARY KEY` |
| Insert one row | `INSERT INTO table (cols) VALUES (vals);` |
| Insert multiple rows | `VALUES (r1), (r2), (r3);` |
| See tables | `SHOW TABLES;` |
| See table structure | `DESC table_name;` |
| Delete table | `DROP TABLE name;` |
| Delete all data | `TRUNCATE TABLE name;` |
| Delete database | `DROP DATABASE name;` |

---

> 📌 **Final Tip for MLOps:**
> - Real ML data lives in databases — `SELECT` fetches it for training
> - Log experiment results with `INSERT INTO experiments (model, accuracy) VALUES (...)`
> - `VARCHAR(n)` for names/labels, `FLOAT` for metrics, `DATETIME` for timestamps
> - `AUTO_INCREMENT PRIMARY KEY` — always add this as first column in every table 🚀

---

*Notes by Pratyush Guleria 
*GitHub: Pratyush-Guleria*