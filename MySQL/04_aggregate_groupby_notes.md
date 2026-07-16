# SQL — Aggregate Functions, DISTINCT, GROUP BY & HAVING 📊

> **Author:** Pratyush Guleria
> **GitHub:** Pratyush-Guleria
> **Topic:** Summarizing and grouping data

---

## Table of Contents
1. [Aggregate Functions](#1-aggregate-functions)
2. [COUNT](#2-count)
3. [SUM, AVG, MAX, MIN](#3-sum-avg-max-min)
4. [DISTINCT — Unique Values](#4-distinct--unique-values)
5. [GROUP BY](#5-group-by)
6. [GROUP BY with Multiple Columns](#6-group-by-with-multiple-columns)
7. [HAVING — Filter Groups](#7-having--filter-groups)
8. [WHERE vs HAVING](#8-where-vs-having)
9. [Quick Revision](#9-quick-revision)

---

## 1. Aggregate Functions

**Aggregate functions** perform calculations on multiple rows and return a single value — same as Pandas `df["col"].sum()`, `.mean()` etc.

| SQL Function | Pandas Equivalent | What it does |
|-------------|------------------|--------------|
| `COUNT(*)` | `df.count()` | Count rows |
| `SUM(col)` | `df["col"].sum()` | Total of column |
| `AVG(col)` | `df["col"].mean()` | Average of column |
| `MAX(col)` | `df["col"].max()` | Highest value |
| `MIN(col)` | `df["col"].min()` | Lowest value |

---

## 2. COUNT

**Syntax:**
```sql
SELECT COUNT(*) FROM table_name;
SELECT COUNT(column) FROM table_name;
```

```sql
-- Total number of students
SELECT COUNT(*) FROM students_info;

-- Total students with marks filled (ignores NULL)
SELECT COUNT(marks) FROM students_info;

-- Count with alias
SELECT COUNT(*) AS Total_Students FROM students_info;

-- Count students in CSE
SELECT COUNT(*) AS CSE_Students
FROM students_info
WHERE department = 'CSE';
```

> 💡 `COUNT(*)` counts ALL rows including NULLs.
> `COUNT(column)` counts only non-NULL values in that column.

---

## 3. SUM, AVG, MAX, MIN

```sql
-- Total salary of all employees
SELECT SUM(salary) AS Total_Salary FROM employees_info;

-- Average marks of all students
SELECT AVG(marks) AS Average_Marks FROM students_info;

-- Highest salary
SELECT MAX(salary) AS Highest_Salary FROM employees_info;

-- Lowest marks
SELECT MIN(marks) AS Lowest_Marks FROM students_info;

-- Multiple aggregates at once
SELECT
    COUNT(*) AS Total_Employees,
    SUM(salary) AS Total_Salary,
    AVG(salary) AS Avg_Salary,
    MAX(salary) AS Max_Salary,
    MIN(salary) AS Min_Salary
FROM employees_info;
```

### With WHERE

```sql
-- Average marks of CSE students only
SELECT AVG(marks) AS CSE_Average
FROM students_info
WHERE department = 'CSE';

-- Total salary of ML department
SELECT SUM(salary) AS ML_Total_Salary
FROM employees_info
WHERE department = 'ML';
```

---

## 4. DISTINCT — Unique Values

**DISTINCT** removes duplicate values — same as Pandas `df["col"].unique()`.

**Syntax:**
```sql
SELECT DISTINCT column FROM table_name;
```

```sql
-- Show all unique departments (no repeats)
SELECT DISTINCT department FROM students_info;

-- Count how many unique departments exist
SELECT COUNT(DISTINCT department) AS Total_Departments
FROM students_info;

-- Unique departments in employees
SELECT DISTINCT department FROM employees_info;
```

---

## 5. GROUP BY

**GROUP BY** splits data into groups and applies aggregate function to each group — same as Pandas `df.groupby("col")["val"].sum()`.

**Syntax:**
```sql
SELECT column, AGG_FUNCTION(column)
FROM table_name
GROUP BY column;
```

```sql
-- Total students per department
SELECT department, COUNT(*) AS Total_Students
FROM students_info
GROUP BY department;

-- Average marks per department
SELECT department, AVG(marks) AS Avg_Marks
FROM students_info
GROUP BY department;

-- Average salary per department
SELECT department, AVG(salary) AS Avg_Salary, COUNT(*) AS Headcount
FROM employees_info
GROUP BY department;

-- Multiple aggregates per group
SELECT
    department,
    COUNT(*) AS Employees,
    AVG(salary) AS Avg_Salary,
    MAX(salary) AS Max_Salary,
    MIN(salary) AS Min_Salary
FROM employees_info
GROUP BY department;
```

### GROUP BY with ORDER BY

```sql
-- Departments sorted by average marks
SELECT department, AVG(marks) AS Avg_Marks
FROM students_info
GROUP BY department
ORDER BY Avg_Marks DESC;
```

---

## 6. GROUP BY with Multiple Columns

```sql
-- Count employees per department per experience level
SELECT department, experience, COUNT(*) AS Count
FROM employees_info
GROUP BY department, experience
ORDER BY department, experience;
```

---

## 7. HAVING — Filter Groups

**HAVING** filters groups AFTER `GROUP BY` — same as filtering after Pandas `groupby()`.

**Syntax:**
```sql
SELECT column, AGG_FUNCTION(col)
FROM table_name
GROUP BY column
HAVING condition;
```

```sql
-- Departments with more than 1 student
SELECT department, COUNT(*) AS Total
FROM students_info
GROUP BY department
HAVING COUNT(*) > 1;

-- Departments where average salary is above 5000
SELECT department, AVG(salary) AS Avg_Salary
FROM employees_info
GROUP BY department
HAVING AVG(salary) > 5000;

-- Departments with average marks above 80
SELECT department, AVG(marks) AS Avg_Marks
FROM students_info
GROUP BY department
HAVING AVG(marks) > 80
ORDER BY Avg_Marks DESC;
```

---

## 8. WHERE vs HAVING

This is a very common confusion — understand this clearly.

| | WHERE | HAVING |
|--|-------|--------|
| When it runs | BEFORE grouping | AFTER grouping |
| Filters | Individual rows | Groups |
| Used with | Any query | Only with GROUP BY |
| Can use aggregate? | ❌ No | ✅ Yes |

```sql
-- WHERE — filter rows BEFORE grouping
SELECT department, AVG(marks)
FROM students_info
WHERE age > 15              -- filter individual rows first
GROUP BY department;

-- HAVING — filter groups AFTER grouping
SELECT department, AVG(marks) AS Avg_Marks
FROM students_info
GROUP BY department
HAVING AVG(marks) > 80;    -- filter groups after calculating average

-- Both together
SELECT department, AVG(marks) AS Avg_Marks
FROM students_info
WHERE age > 15              -- step 1: filter rows
GROUP BY department         -- step 2: group them
HAVING AVG(marks) > 80     -- step 3: filter groups
ORDER BY Avg_Marks DESC;    -- step 4: sort
```

---

## 9. Quick Revision

| What you want | SQL |
|--------------|-----|
| Count all rows | `SELECT COUNT(*) FROM table` |
| Count non-null | `SELECT COUNT(col) FROM table` |
| Total | `SELECT SUM(col) FROM table` |
| Average | `SELECT AVG(col) FROM table` |
| Highest | `SELECT MAX(col) FROM table` |
| Lowest | `SELECT MIN(col) FROM table` |
| Unique values | `SELECT DISTINCT col FROM table` |
| Count unique | `SELECT COUNT(DISTINCT col)` |
| Group and aggregate | `GROUP BY col` |
| Filter groups | `HAVING condition` |
| Filter rows | `WHERE condition` |

---

> 📌 **Final Tip for MLOps:**
> - `GROUP BY model_name` + `AVG(accuracy)` — average accuracy per model across runs
> - `HAVING AVG(accuracy) > 0.85` — find only high-performing models
> - `COUNT(DISTINCT experiment_id)` — how many unique experiments ran
> - `MAX(accuracy)` with `GROUP BY dataset` — best model per dataset 🚀

---

*Notes by Pratyush Guleria*
*GitHub: Pratyush-Guleria*