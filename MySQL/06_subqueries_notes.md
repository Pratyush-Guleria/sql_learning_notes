# SQL — Subqueries 🎯

> **Author:** Pratyush Guleria
> **GitHub:** Pratyush-Guleria
> **Topic:** Queries inside queries — the final core SQL topic

---

## Table of Contents
1. [What is a Subquery?](#1-what-is-a-subquery)
2. [Subquery in WHERE](#2-subquery-in-where)
3. [Subquery with IN](#3-subquery-with-in)
4. [Subquery with Comparison Operators](#4-subquery-with-comparison-operators)
5. [Subquery in SELECT](#5-subquery-in-select)
6. [Subquery in FROM](#6-subquery-in-from)
7. [Correlated Subquery](#7-correlated-subquery)
8. [Quick Revision](#8-quick-revision)

---

## 1. What is a Subquery?

A **subquery** is a query written INSIDE another query — the inner query runs first, and its result is used by the outer query.

```sql
SELECT * FROM table
WHERE column = (SELECT ... FROM another_table);
      ↑ outer query           ↑ inner query (subquery)
```

> 💡 Think of it like a function call inside another function — the inner one runs first, its result feeds the outer one.

---

## 2. Subquery in WHERE

The most common use — filter based on a calculated value.

**Syntax:**
```sql
SELECT * FROM table
WHERE column operator (SELECT ... FROM table);
```

```sql
-- Students who scored above the average marks
SELECT name, marks
FROM students_info
WHERE marks > (SELECT AVG(marks) FROM students_info);
```

**How it works:**
1. Inner query runs first: `SELECT AVG(marks) FROM students_info` → returns e.g. `78.5`
2. Outer query becomes: `WHERE marks > 78.5`

```sql
-- Employees earning more than average salary
SELECT name, salary
FROM employees_info
WHERE salary > (SELECT AVG(salary) FROM employees_info);
```

---

## 3. Subquery with `IN`

Use when the subquery returns **multiple values**.

**Syntax:**
```sql
SELECT * FROM table
WHERE column IN (SELECT column FROM another_table WHERE condition);
```

```sql
-- Students in departments that have a HOD assigned
SELECT name, dept_id
FROM students
WHERE dept_id IN (SELECT dept_id FROM departments WHERE hod IS NOT NULL);

-- Employees in departments located in Delhi
SELECT name, dept_id
FROM employees
WHERE dept_id IN (SELECT dept_id FROM dept_info WHERE location = 'Delhi');
```

---

## 4. Subquery with Comparison Operators

```sql
-- Student with the highest marks (using subquery instead of ORDER BY LIMIT)
SELECT name, marks
FROM students_info
WHERE marks = (SELECT MAX(marks) FROM students_info);

-- Employee with the lowest salary
SELECT name, salary
FROM employees_info
WHERE salary = (SELECT MIN(salary) FROM employees_info);
```

> 💡 This is an alternative to `ORDER BY ... DESC LIMIT 1` — both work, subquery is useful when you need the exact matching value logic.

---

## 5. Subquery in SELECT

You can put a subquery inside the `SELECT` clause to add a calculated column.

```sql
-- Show each student's marks alongside the class average
SELECT
    name,
    marks,
    (SELECT AVG(marks) FROM students_info) AS Class_Average
FROM students_info;
```

```sql
-- Show each employee's salary alongside the average salary
SELECT
    name,
    salary,
    (SELECT AVG(salary) FROM employees_info) AS Company_Average
FROM employees_info;
```

---

## 6. Subquery in FROM

A subquery can act as a **temporary table** in the `FROM` clause.

**Syntax:**
```sql
SELECT * FROM (SELECT ... FROM table) AS temp_name;
```

```sql
-- Get department averages, then filter on that result
SELECT dept_name, avg_marks
FROM (
    SELECT department AS dept_name, AVG(marks) AS avg_marks
    FROM students_info
    GROUP BY department
) AS dept_averages
WHERE avg_marks > 80;
```

> 💡 This does the same thing as `GROUP BY` + `HAVING`, but subquery-in-FROM is useful when you need to do MORE processing on the grouped result.

---

## 7. Correlated Subquery

A **correlated subquery** references the outer query — it runs once FOR EACH row of the outer query (unlike normal subqueries which run once total).

```sql
-- Students who scored above their OWN department's average
SELECT s1.name, s1.department, s1.marks
FROM students_info s1
WHERE s1.marks > (
    SELECT AVG(s2.marks)
    FROM students_info s2
    WHERE s2.department = s1.department   -- references outer query!
);
```

**How it's different from a normal subquery:**
- Normal subquery — inner query runs ONCE, result used for all outer rows
- Correlated subquery — inner query runs ONCE PER OUTER ROW, using that row's values

> ⚠️ Correlated subqueries are slower on large data — but for learning purposes and small-medium datasets, they work fine.

---

## 8. Quick Revision

| What you want | SQL |
|--------------|-----|
| Compare to aggregate | `WHERE col > (SELECT AVG(col) FROM table)` |
| Match multiple values | `WHERE col IN (SELECT col FROM table WHERE...)` |
| Find max/min row | `WHERE col = (SELECT MAX(col) FROM table)` |
| Add calculated column | `(SELECT AVG(col) FROM table) AS alias` in SELECT |
| Temp table for filtering | `FROM (SELECT ...) AS temp_name` |
| Compare within own group | Correlated subquery with matching outer column |

---

## When to Use Subquery vs JOIN

| Use Subquery when... | Use JOIN when... |
|----------------------|-------------------|
| You need a single calculated value (avg, max) | You need columns from both tables together |
| Filtering based on aggregate | Combining full row data |
| Simple existence check (`IN`) | Complex multi-table reports |

> 💡 In practice, JOINs are usually faster than subqueries for combining data. Subqueries are best for comparisons against calculated values.

---

> 📌 **Final Tip for MLOps:**
> - `WHERE accuracy > (SELECT AVG(accuracy) FROM experiments)` — find above-average model runs
> - `WHERE model_id IN (SELECT model_id FROM deployed_models)` — filter only deployed models
> - Correlated subqueries — comparing each record to its own group's average (like Z-score calculations)
> - Subqueries + JOINs together are what real production SQL queries look like 🚀

---

## 🎉 SQL Core — Complete!

```
✅ Database & Table basics
✅ INSERT INTO
✅ SELECT & WHERE
✅ ORDER BY, LIMIT
✅ UPDATE & DELETE
✅ Aggregate Functions + DISTINCT
✅ GROUP BY & HAVING
✅ JOINs
✅ Subqueries
```

**Next stop: Scikit-learn & Classical ML** 🤖

---

*Notes by Pratyush Guleria 
*GitHub: Pratyush-Guleria*