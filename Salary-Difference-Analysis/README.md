
# mysql-analysis-practice

# Salary Difference Analysis Using SQL

## Description
This SQL project calculates the difference between the maximum salary
in the Marketing department and the maximum salary in the Engineering department.

The query uses Common Table Expressions (CTEs), aggregate functions,
and joins to analyze employee salary data.

---

## Technologies Used
- MySQL
- SQL
- MySQL Workbench

---

## Tables Used

### db_employee
Contains employee information:
department_id:
first_name:
id:
last_name:
salary:

### db_dept
Contains department information:
- id
- department

---

## SQL Concepts Used
- CTE (Common Table Expressions)
- INNER JOIN
- MAX()
- WHERE clause
- Arithmetic operations

---

## SQL Query

```sql
WITH markMaxSal AS (
    SELECT d.department,
           MAX(emp.salary) AS MaxSalary_mark
    FROM db_employee emp
    INNER JOIN db_dept d
        ON emp.department_id = d.id
    WHERE d.department = 'marketing'
),

engMaxSal AS (
    SELECT d.department,
           MAX(emp.salary) AS MaxSalary_eng
    FROM db_employee emp
    INNER JOIN db_dept d
        ON emp.department_id = d.id
    WHERE d.department = 'engineering'
)

SELECT markMaxSal.MaxSalary_mark - engMaxSal.MaxSalary_eng
       AS salary_difference
FROM markMaxSal, engMaxSal;
