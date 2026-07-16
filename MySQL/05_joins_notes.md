# SQL — JOINs 🔗

> **Author:** Pratyush Guleria
> **GitHub:** Pratyush-Guleria
> **Topic:** Combining data from multiple tables

---

## Table of Contents
1. [Why JOINs?](#1-why-joins)
2. [Types of JOINs](#2-types-of-joins)
3. [INNER JOIN](#3-inner-join)
4. [LEFT JOIN](#4-left-join)
5. [RIGHT JOIN](#5-right-join)
6. [FULL OUTER JOIN](#6-full-outer-join)
7. [JOIN with WHERE and GROUP BY](#7-join-with-where-and-group-by)
8. [Quick Revision](#8-quick-revision)

---

## 1. Why JOINs?

Real databases never store everything in one table — data is split across multiple related tables.

**Example:**
- `students` table — student_id, name, age
- `marks` table — student_id, subject, score
- `departments` table — dept_id, dept_name

To get "student name with their marks", you need to JOIN these tables.

> 💡 JOINs in SQL = `pd.merge()` in Pandas — same concept, different syntax.

---

## 2. Types of JOINs

```
Table A         Table B
┌─────┐         ┌─────┐
│  1  │         │  1  │
│  2  │    ∩    │  2  │
│  3  │         │  4  │
└─────┘         └─────┘

INNER JOIN  → only 1, 2 (matching rows)
LEFT JOIN   → 1, 2, 3 (all from A + matching from B)
RIGHT JOIN  → 1, 2, 4 (matching from A + all from B)
FULL JOIN   → 1, 2, 3, 4 (everything from both)
```

---

## 3. INNER JOIN

Returns only rows that have **matching values in BOTH tables**.

**Syntax:**
```sql
SELECT columns
FROM table1
INNER JOIN table2 ON table1.common_col = table2.common_col;
```

**Setup — two related tables:**
```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    dept_id INT
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    hod VARCHAR(100)
);

INSERT INTO students VALUES
(1, 'Pratyush', 1),
(2, 'Rahul', 2),
(3, 'Amit', 1),
(4, 'Sneha', 3),
(5, 'Vikram', NULL);   -- no department

INSERT INTO departments VALUES
(1, 'CSE', 'Dr. Kumar'),
(2, 'ECE', 'Dr. Sharma'),
(4, 'IT', 'Dr. Gupta');  -- dept_id 3 missing, dept 4 has no students
```

```sql
-- INNER JOIN — only students WITH a department
SELECT students.name, departments.dept_name, departments.hod
FROM students
INNER JOIN departments ON students.dept_id = departments.dept_id;
```

**Output:**
```
name      dept_name   hod
Pratyush  CSE         Dr. Kumar
Rahul     ECE         Dr. Sharma
Amit      CSE         Dr. Kumar
```

> Vikram (NULL dept) and IT department (no students) are excluded.

### Using aliases for cleaner queries

```sql
-- Using table aliases s and d
SELECT s.name, d.dept_name, d.hod
FROM students AS s
INNER JOIN departments AS d ON s.dept_id = d.dept_id;
```

---

## 4. LEFT JOIN

Returns **all rows from the LEFT table** + matching rows from right table. Non-matching right side shows NULL.

**Syntax:**
```sql
SELECT columns
FROM table1
LEFT JOIN table2 ON table1.col = table2.col;
```

```sql
-- LEFT JOIN — all students, department info where available
SELECT s.name, d.dept_name
FROM students AS s
LEFT JOIN departments AS d ON s.dept_id = d.dept_id;
```

**Output:**
```
name      dept_name
Pratyush  CSE
Rahul     ECE
Amit      CSE
Sneha     NULL     ← dept_id 3 doesn't exist in departments
Vikram    NULL     ← no dept_id at all
```

> 💡 **Most commonly used JOIN** — keep all main data, add extra info where available. Same as Pandas `how="left"`.

---

## 5. RIGHT JOIN

Returns **all rows from the RIGHT table** + matching rows from left. Non-matching left side shows NULL.

```sql
-- RIGHT JOIN — all departments, student info where available
SELECT s.name, d.dept_name
FROM students AS s
RIGHT JOIN departments AS d ON s.dept_id = d.dept_id;
```

**Output:**
```
name      dept_name
Pratyush  CSE
Amit      CSE
Rahul     ECE
NULL      IT       ← IT has no students
```

---

## 6. FULL OUTER JOIN

Returns **all rows from BOTH tables** — NULLs where no match.

> ⚠️ MySQL doesn't support FULL OUTER JOIN directly — use UNION of LEFT and RIGHT JOIN.

```sql
-- FULL OUTER JOIN in MySQL using UNION
SELECT s.name, d.dept_name
FROM students AS s
LEFT JOIN departments AS d ON s.dept_id = d.dept_id

UNION

SELECT s.name, d.dept_name
FROM students AS s
RIGHT JOIN departments AS d ON s.dept_id = d.dept_id;
```

---

## 7. JOIN with WHERE and GROUP BY

JOINs can be combined with everything you've learned.

```sql
-- Count students per department (using JOIN)
SELECT d.dept_name, COUNT(s.student_id) AS Total_Students
FROM departments AS d
LEFT JOIN students AS s ON d.dept_id = s.dept_id
GROUP BY d.dept_name
ORDER BY Total_Students DESC;

-- Only CSE students with their department info
SELECT s.name, s.age, d.dept_name
FROM students AS s
INNER JOIN departments AS d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'CSE';

-- Departments with more than 1 student
SELECT d.dept_name, COUNT(s.student_id) AS Total
FROM departments AS d
LEFT JOIN students AS s ON d.dept_id = s.dept_id
GROUP BY d.dept_name
HAVING Total > 1;
```

---

## 8. Quick Revision

| What you want | SQL |
|--------------|-----|
| Only matching rows | `INNER JOIN` |
| All from left + matching right | `LEFT JOIN` |
| Matching left + all from right | `RIGHT JOIN` |
| Everything from both | `UNION` of LEFT + RIGHT |
| Join condition | `ON table1.col = table2.col` |
| Table alias | `FROM students AS s` |
| Join + filter | Add `WHERE` after `ON` |
| Join + group | Add `GROUP BY` after `WHERE` |

---

> 📌 **Final Tip for MLOps:**
> - `LEFT JOIN` models table WITH experiments table — keep all models, show experiment results where available
> - `INNER JOIN` datasets WITH labels — only labeled data for training
> - Always use table aliases (`s`, `d`, `e`) — long table names in JOINs get messy fast
> - `JOIN + GROUP BY` — most powerful combination for analysis 🚀

---

*Notes by Pratyush Guleria
*GitHub: Pratyush-Guleria*