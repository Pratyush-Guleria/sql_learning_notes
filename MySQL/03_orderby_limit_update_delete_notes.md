# SQL — ORDER BY, LIMIT, UPDATE & DELETE ✏️

> **Author:** Pratyush Guleria 
> **GitHub:** Pratyush-Guleria
> **Topic:** Sorting results, limiting rows, and modifying data

---

## Table of Contents
1. [ORDER BY — Sorting Results](#1-order-by--sorting-results)
2. [ORDER BY Multiple Columns](#2-order-by-multiple-columns)
3. [LIMIT — Restrict Number of Rows](#3-limit--restrict-number-of-rows)
4. [LIMIT with OFFSET](#4-limit-with-offset)
5. [UPDATE — Modifying Data](#5-update--modifying-data)
6. [DELETE — Removing Data](#6-delete--removing-data)
7. [Quick Revision](#7-quick-revision)

---

## 1. ORDER BY — Sorting Results

**ORDER BY** sorts the result — same as Pandas `sort_values()`.

**Syntax:**
```sql
SELECT * FROM table_name ORDER BY column ASC;   -- ascending (default)
SELECT * FROM table_name ORDER BY column DESC;  -- descending
```

```sql
-- Students sorted by marks (lowest to highest)
SELECT * FROM students_info ORDER BY marks ASC;

-- Students sorted by marks (highest to lowest)
SELECT * FROM students_info ORDER BY marks DESC;

-- Employees sorted by salary (highest first)
SELECT * FROM employees_info ORDER BY salary DESC;

-- Alphabetical order by name
SELECT * FROM students_info ORDER BY name ASC;
```

> 💡 `ASC` is default — you don't have to write it, but it's good practice for clarity.

### ORDER BY with WHERE

```sql
-- CSE students sorted by marks descending
SELECT * FROM students_info
WHERE department = 'CSE'
ORDER BY marks DESC;
```

---

## 2. ORDER BY Multiple Columns

Sort by first column, then by second column for ties — same as Pandas `sort_values(["col1", "col2"])`.

**Syntax:**
```sql
ORDER BY col1 ASC, col2 DESC
```

```sql
-- Sort by department first, then by salary within each department
SELECT * FROM employees_info
ORDER BY department ASC, salary DESC;

-- Sort by marks descending, then by name alphabetically for same marks
SELECT * FROM students_info
ORDER BY marks DESC, name ASC;
```

---

## 3. LIMIT — Restrict Number of Rows

**LIMIT** returns only a specified number of rows — same as Pandas `df.head(n)`.

**Syntax:**
```sql
SELECT * FROM table_name LIMIT n;
```

```sql
-- First 3 students only
SELECT * FROM students_info LIMIT 3;

-- Top 3 highest paid employees
SELECT * FROM employees_info ORDER BY salary DESC LIMIT 3;

-- Top 1 student by marks
SELECT * FROM students_info ORDER BY marks DESC LIMIT 1;
```

> 💡 **Common pattern:** `ORDER BY col DESC LIMIT n` — find top N records. This is used constantly in real projects.

---

## 4. LIMIT with OFFSET

**OFFSET** skips a number of rows before starting — useful for pagination.

**Syntax:**
```sql
SELECT * FROM table_name LIMIT n OFFSET skip;
```

```sql
-- Skip first 2, then show next 3
SELECT * FROM students_info LIMIT 3 OFFSET 2;

-- Page 2 of results (10 per page)
SELECT * FROM students_info LIMIT 10 OFFSET 10;
```

---

## 5. UPDATE — Modifying Data

**UPDATE** changes existing data in a table.

**Syntax:**
```sql
UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;
```

> ⚠️ **ALWAYS use WHERE with UPDATE** — without WHERE, ALL rows get updated!

```sql
-- Update marks of Pratyush to 95
UPDATE students_info
SET marks = 95
WHERE name = 'Pratyush';

-- Update department and marks together
UPDATE students_info
SET marks = 88, department = 'IT'
WHERE name = 'Rahul';

-- Give 10% salary hike to all ML employees
UPDATE employees_info
SET salary = salary * 1.10
WHERE department = 'ML';

-- Update multiple employees
UPDATE employees_info
SET salary = 15000
WHERE department IN ('HR', 'Sales');
```

### Dangerous — UPDATE without WHERE

```sql
-- ⚠️ This updates ALL rows!
UPDATE students_info SET marks = 100;   -- DON'T do this accidentally
```

---

## 6. DELETE — Removing Data

**DELETE** removes rows from a table.

**Syntax:**
```sql
DELETE FROM table_name WHERE condition;
```

> ⚠️ **ALWAYS use WHERE with DELETE** — without WHERE, ALL rows get deleted!

```sql
-- Delete one specific student
DELETE FROM students_info WHERE name = 'Anirudh';

-- Delete students with marks below 60
DELETE FROM students_info WHERE marks < 60;

-- Delete all HR employees
DELETE FROM employees_info WHERE department = 'HR';

-- Delete employees with no salary data
DELETE FROM employees_info WHERE salary IS NULL;
```

### DELETE vs TRUNCATE vs DROP

| Command | What it does |
|---------|-------------|
| `DELETE WHERE condition` | Remove specific rows |
| `DELETE FROM table` | Remove ALL rows (but table stays) |
| `TRUNCATE TABLE` | Remove ALL rows faster (table stays) |
| `DROP TABLE` | Remove table completely |

---

## 7. Quick Revision

| What you want | SQL |
|--------------|-----|
| Sort ascending | `ORDER BY col ASC` |
| Sort descending | `ORDER BY col DESC` |
| Sort by 2 columns | `ORDER BY col1 ASC, col2 DESC` |
| Limit rows | `LIMIT n` |
| Top N records | `ORDER BY col DESC LIMIT n` |
| Skip rows | `LIMIT n OFFSET skip` |
| Update one row | `UPDATE table SET col=val WHERE condition` |
| Update multiple columns | `SET col1=v1, col2=v2` |
| Delete specific rows | `DELETE FROM table WHERE condition` |
| Delete all rows | `DELETE FROM table` or `TRUNCATE TABLE` |

---

> 📌 **Final Tip for MLOps:**
> - `ORDER BY accuracy DESC LIMIT 5` — find top 5 model runs from experiment logs
> - `UPDATE experiments SET status='deployed' WHERE model_id=42` — mark model as deployed
> - `DELETE FROM predictions WHERE confidence < 0.5` — clean low confidence predictions
> - Always use `WHERE` with `UPDATE` and `DELETE` — forgetting it in production is a disaster 🚀

---

*Notes by Pratyush Guleria*
*GitHub: Pratyush-Guleria*