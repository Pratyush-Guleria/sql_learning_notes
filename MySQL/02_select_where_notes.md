# SQL — SELECT & WHERE 🔍

> **Author:** Pratyush Guleria 
> **GitHub:** Pratyush-Guleria
> **Topic:** Fetching and filtering data from tables

---

## Table of Contents
1. [SELECT — Fetching Data](#1-select--fetching-data)
2. [SELECT Specific Columns](#2-select-specific-columns)
3. [SELECT with Alias](#3-select-with-alias)
4. [WHERE — Filtering Data](#4-where--filtering-data)
5. [Comparison Operators](#5-comparison-operators)
6. [AND, OR, NOT](#6-and-or-not)
7. [BETWEEN](#7-between)
8. [IN — Check Against a List](#8-in--check-against-a-list)
9. [LIKE — Pattern Matching](#9-like--pattern-matching)
10. [IS NULL / IS NOT NULL](#10-is-null--is-not-null)
11. [Quick Revision](#11-quick-revision)

---

## 1. SELECT — Fetching Data

**SELECT** is the most used SQL command — it fetches data from a table.

**Syntax:**
```sql
SELECT * FROM table_name;
```

```sql
-- Fetch all columns, all rows
SELECT * FROM students_info;

-- Fetch all rows from employees
SELECT * FROM employees_info;
```

> 💡 `*` means "all columns". In production code, avoid `SELECT *` — always specify columns you need (faster and safer).

---

## 2. SELECT Specific Columns

**Syntax:**
```sql
SELECT col1, col2, col3 FROM table_name;
```

```sql
-- Only name and marks
SELECT name, marks FROM students_info;

-- Only name, department, salary
SELECT name, department, salary FROM employees_info;
```

---

## 3. SELECT with Alias

**Alias** gives a column a temporary name in the output — useful for cleaner reports.

**Syntax:**
```sql
SELECT column AS alias_name FROM table_name;
```

```sql
SELECT
    name AS Student_Name,
    marks AS Final_Marks,
    department AS Dept
FROM students_info;
```

```sql
SELECT
    name AS Employee,
    salary AS Monthly_Salary,
    experience AS Years_Experience
FROM employees_info;
```

---

## 4. WHERE — Filtering Data

**WHERE** filters rows based on a condition — same as Pandas `df[df["col"] > value]`.

**Syntax:**
```sql
SELECT * FROM table_name WHERE condition;
```

```sql
-- Students with marks above 80
SELECT * FROM students_info WHERE marks > 80;

-- Employees in CSE department
SELECT * FROM students_info WHERE department = 'CSE';

-- Employees with salary above 5000
SELECT * FROM employees_info WHERE salary > 5000;
```

---

## 5. Comparison Operators

| Operator | Meaning | Example |
|----------|---------|---------|
| `=` | Equal to | `WHERE age = 20` |
| `!=` or `<>` | Not equal | `WHERE dept != 'HR'` |
| `>` | Greater than | `WHERE salary > 50000` |
| `<` | Less than | `WHERE marks < 60` |
| `>=` | Greater than or equal | `WHERE experience >= 3` |
| `<=` | Less than or equal | `WHERE age <= 25` |

```sql
-- Students with marks 90 or above
SELECT name, marks FROM students_info WHERE marks >= 90;

-- Employees NOT in HR
SELECT name, department FROM employees_info WHERE department != 'HR';
```

---

## 6. AND, OR, NOT

Combine multiple conditions — same logic as Python's `and`, `or`, `not`.

**Syntax:**
```sql
WHERE condition1 AND condition2
WHERE condition1 OR condition2
WHERE NOT condition
```

```sql
-- CSE students with marks above 80
SELECT * FROM students_info
WHERE department = 'CSE' AND marks > 80;

-- Students in CSE or ECE
SELECT * FROM students_info
WHERE department = 'CSE' OR department = 'ECE';

-- NOT in HR department
SELECT * FROM employees_info
WHERE NOT department = 'HR';

-- Multiple conditions combined
SELECT * FROM employees_info
WHERE department = 'ML' AND salary > 5000 AND experience >= 5;
```

---

## 7. BETWEEN

**BETWEEN** filters values within a range — inclusive of both ends.

**Syntax:**
```sql
WHERE column BETWEEN value1 AND value2
```

```sql
-- Students with marks between 70 and 90
SELECT * FROM students_info WHERE marks BETWEEN 70 AND 90;

-- Employees with salary between 3000 and 10000
SELECT * FROM employees_info WHERE salary BETWEEN 3000 AND 10000;

-- Students aged between 15 and 20
SELECT * FROM students_info WHERE age BETWEEN 15 AND 20;
```

> 💡 `BETWEEN 70 AND 90` is same as `marks >= 70 AND marks <= 90` — just shorter.

---

## 8. `IN` — Check Against a List

**IN** checks if a value is in a list — same as Pandas `isin()`.

**Syntax:**
```sql
WHERE column IN (val1, val2, val3)
```

```sql
-- Students in CSE or IT departments
SELECT * FROM students_info WHERE department IN ('CSE', 'IT');

-- Employees in ML or LLM departments
SELECT * FROM employees_info WHERE department IN ('ML', 'LLM', 'Senior MLOps Engineer');

-- NOT IN — opposite
SELECT * FROM employees_info WHERE department NOT IN ('HR', 'Sales');
```

---

## 9. `LIKE` — Pattern Matching

**LIKE** searches for a pattern in text — no direct Pandas equivalent.

**Wildcards:**
- `%` — any number of characters (including zero)
- `_` — exactly one character

**Syntax:**
```sql
WHERE column LIKE 'pattern'
```

```sql
-- Names starting with 'P'
SELECT * FROM students_info WHERE name LIKE 'P%';

-- Names ending with 'h'
SELECT * FROM students_info WHERE name LIKE '%h';

-- Names containing 'GPT'
SELECT * FROM employees_info WHERE name LIKE '%GPT%';

-- Names with exactly 5 characters
SELECT * FROM students_info WHERE name LIKE '_____';

-- Names starting with 'C' and ending with 'e'
SELECT * FROM employees_info WHERE name LIKE 'C%e';
```

---

## 10. `IS NULL` / `IS NOT NULL`

Check for missing values — same as Pandas `df.isnull()`.

**Syntax:**
```sql
WHERE column IS NULL
WHERE column IS NOT NULL
```

```sql
-- Students with missing marks
SELECT * FROM students_info WHERE marks IS NULL;

-- Students with marks filled in
SELECT * FROM students_info WHERE marks IS NOT NULL;

-- Students with missing department
SELECT name, department FROM students_info WHERE department IS NULL;
```

> ⚠️ You CANNOT use `= NULL` in SQL — it won't work! Always use `IS NULL`.

---

## 11. Quick Revision

| What you want | SQL |
|--------------|-----|
| All data | `SELECT * FROM table` |
| Specific columns | `SELECT col1, col2 FROM table` |
| Column alias | `SELECT col AS new_name` |
| Filter rows | `WHERE condition` |
| Equal | `WHERE col = value` |
| Not equal | `WHERE col != value` |
| Multiple AND | `WHERE c1 AND c2` |
| Multiple OR | `WHERE c1 OR c2` |
| Range | `WHERE col BETWEEN a AND b` |
| List check | `WHERE col IN (v1, v2)` |
| Pattern match | `WHERE col LIKE 'P%'` |
| Missing values | `WHERE col IS NULL` |
| Not missing | `WHERE col IS NOT NULL` |

---

> 📌 **Final Tip for MLOps:**
> - `SELECT * FROM training_data WHERE label IS NOT NULL` — filter clean data before training
> - `WHERE accuracy BETWEEN 0.8 AND 1.0` — fetch good model runs from experiment logs
> - `WHERE model_name LIKE '%bert%'` — search specific models in experiment database
> - `IS NULL` — critical for data quality checks before ML pipeline runs 🚀

---

*Notes by Pratyush Guleria 
*GitHub: Pratyush-Guleria*