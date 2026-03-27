# SQL Queries

This directory contains SQL scripts, queries, and database operations learned throughout the certification.

## Organization

SQL files are organized by category:

```
sql-queries/
├── ddl/              # Data Definition Language (CREATE, ALTER, DROP)
├── dml/              # Data Manipulation Language (INSERT, UPDATE, DELETE)
├── queries/          # SELECT queries and complex operations
└── README.md
```

## File Structure

### DDL (Data Definition Language)
Scripts that define database structure:
- `create_tables.sql` - Table creation statements
- `alter_tables.sql` - Modify existing tables
- `create_constraints.sql` - Add keys and constraints

### DML (Data Manipulation Language)
Scripts that modify data:
- `insert_data.sql` - INSERT statements
- `update_data.sql` - UPDATE statements
- `delete_data.sql` - DELETE statements

### Queries
SELECT statements and complex queries:
- `basic_queries.sql` - Simple SELECT statements
- `joins.sql` - JOIN operations
- `aggregates.sql` - GROUP BY, aggregate functions
- `subqueries.sql` - Nested queries

## Running SQL Files

### Execute from Command Line
```bash
# Run a SQL file
psql -U postgres -d database_name -f script.sql

# With output
psql -U postgres -d database_name -f script.sql -o output.txt

# Quiet mode (fewer messages)
psql -U postgres -d database_name -q -f script.sql
```

### Execute from psql
```sql
-- Connect to database
\c database_name

-- Run script
\i path/to/script.sql

-- Run and don't stop on errors
\i path/to/script.sql ON_ERROR_ROLLBACK
```

## SQL Quick Reference

### Database Operations
```sql
-- Create database
CREATE DATABASE dbname;

-- Drop database
DROP DATABASE dbname;

-- List databases
\l

-- Connect to database
\c dbname
```

### Table Operations
```sql
-- Create table
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INT,
  gpa NUMERIC(3,2)
);

-- Drop table
DROP TABLE students;

-- Alter table - Add column
ALTER TABLE students ADD COLUMN email VARCHAR(100);

-- Alter table - Drop column
ALTER TABLE students DROP COLUMN email;

-- Alter table - Rename column
ALTER TABLE students RENAME COLUMN name TO full_name;

-- View table structure
\d students
```

### Constraints
```sql
-- Primary Key
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50)
);

-- Foreign Key
CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id)
);

-- Unique
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  email VARCHAR(100) UNIQUE
);

-- Not Null
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Check Constraint
CREATE TABLE adults (
  id INT PRIMARY KEY,
  age INT CHECK (age >= 18)
);
```

### Data Types
```sql
-- Common data types
INT, SERIAL              -- Integers
NUMERIC(p,s), DECIMAL    -- Decimal numbers
VARCHAR(n), TEXT         -- Strings
BOOLEAN                  -- True/False
DATE, TIME, TIMESTAMP    -- Date and time
```

### Insert Data
```sql
-- Single insert
INSERT INTO students (name, age, gpa) 
VALUES ('Alice', 20, 3.8);

-- Multiple inserts
INSERT INTO students (name, age, gpa) VALUES
  ('Bob', 21, 3.5),
  ('Charlie', 19, 3.9),
  ('Diana', 22, 3.7);

-- Insert from SELECT
INSERT INTO honor_students (name, gpa)
SELECT name, gpa FROM students WHERE gpa >= 3.5;
```

### Update Data
```sql
-- Update all rows
UPDATE students SET gpa = gpa + 0.1;

-- Update specific rows
UPDATE students SET gpa = 4.0 
WHERE name = 'Alice';

-- Update multiple columns
UPDATE students SET age = 21, gpa = 3.9 
WHERE name = 'Bob';
```

### Delete Data
```sql
-- Delete specific rows
DELETE FROM students WHERE gpa < 2.0;

-- Delete all rows (use with caution!)
DELETE FROM students;

-- Better: Use TRUNCATE for all rows
TRUNCATE TABLE students;
```

### Select Queries
```sql
-- Select all
SELECT * FROM students;

-- Select specific columns
SELECT name, gpa FROM students;

-- With WHERE clause
SELECT * FROM students WHERE age >= 21;

-- With ORDER BY
SELECT * FROM students ORDER BY gpa DESC;

-- With LIMIT
SELECT * FROM students ORDER BY gpa DESC LIMIT 5;

-- With OFFSET (pagination)
SELECT * FROM students LIMIT 10 OFFSET 20;
```

### Aggregate Functions
```sql
-- Count rows
SELECT COUNT(*) FROM students;

-- Sum
SELECT SUM(age) FROM students;

-- Average
SELECT AVG(gpa) FROM students;

-- Min and Max
SELECT MIN(gpa), MAX(gpa) FROM students;

-- Group By
SELECT age, COUNT(*) FROM students 
GROUP BY age;

-- Having (filter groups)
SELECT age, AVG(gpa) FROM students 
GROUP BY age 
HAVING AVG(gpa) >= 3.5;
```

### Joins
```sql
-- Inner Join
SELECT s.name, c.course_name
FROM students s
INNER JOIN courses c ON s.course_id = c.id;

-- Left Join
SELECT s.name, c.course_name
FROM students s
LEFT JOIN courses c ON s.course_id = c.id;

-- Right Join
SELECT s.name, c.course_name
FROM students s
RIGHT JOIN courses c ON s.course_id = c.id;

-- Full Join
SELECT s.name, c.course_name
FROM students s
FULL JOIN courses c ON s.course_id = c.id;
```

### Subqueries
```sql
-- Subquery in WHERE
SELECT name FROM students 
WHERE gpa > (SELECT AVG(gpa) FROM students);

-- Subquery in FROM
SELECT avg_gpa FROM 
  (SELECT AVG(gpa) as avg_gpa FROM students GROUP BY age) AS age_stats;

-- Subquery with IN
SELECT name FROM students 
WHERE course_id IN (SELECT id FROM courses WHERE department = 'CS');
```

### String Functions
```sql
-- Concatenation
SELECT CONCAT(first_name, ' ', last_name) FROM users;

-- Upper/Lower case
SELECT UPPER(name), LOWER(name) FROM students;

-- Length
SELECT name, LENGTH(name) FROM students;

-- Substring
SELECT SUBSTRING(name, 1, 3) FROM students;

-- Pattern matching
SELECT * FROM students WHERE name LIKE 'A%';  -- Starts with A
SELECT * FROM students WHERE name LIKE '%son'; -- Ends with son
SELECT * FROM students WHERE name LIKE '%ar%'; -- Contains ar
```

## Best Practices

1. **Use Transactions for Multiple Operations**
```sql
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
```

2. **Always Use WHERE in UPDATE/DELETE**
```sql
-- Dangerous!
UPDATE students SET gpa = 4.0;

-- Safe
UPDATE students SET gpa = 4.0 WHERE name = 'Alice';
```

3. **Use EXPLAIN to Optimize Queries**
```sql
EXPLAIN SELECT * FROM students WHERE gpa > 3.5;
```

4. **Add Comments**
```sql
-- This query finds all honor students
SELECT name, gpa FROM students 
WHERE gpa >= 3.5
ORDER BY gpa DESC;
```

## Common Errors

- **Syntax errors**: Missing semicolons, incorrect SQL keywords
- **Type mismatches**: Comparing strings with numbers
- **Foreign key violations**: Referencing non-existent IDs
- **Duplicate key errors**: Violating UNIQUE or PRIMARY KEY constraints

## Resources

- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
- [SQL Exercises](https://pgexercises.com/)
- [PostgreSQL Cheat Sheet](https://www.postgresql.org/docs/current/sql-commands.html)

---

Practice writing queries regularly to build muscle memory and understanding!
