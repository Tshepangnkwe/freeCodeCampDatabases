# SQL Quick Reference

A comprehensive cheat sheet for SQL commands and PostgreSQL operations.

## Table of Contents
- [Database Commands](#database-commands)
- [Table Operations](#table-operations)
- [Data Types](#data-types)
- [Constraints](#constraints)
- [CRUD Operations](#crud-operations)
- [Queries](#queries)
- [Joins](#joins)
- [Aggregate Functions](#aggregate-functions)
- [String Functions](#string-functions)
- [Date Functions](#date-functions)
- [Subqueries](#subqueries)
- [Indexes](#indexes)
- [Psql Commands](#psql-commands)

## Database Commands

```sql
-- Create database
CREATE DATABASE database_name;

-- Drop database
DROP DATABASE database_name;

-- Drop if exists
DROP DATABASE IF EXISTS database_name;

-- List databases (psql)
\l

-- Connect to database (psql)
\c database_name
```

## Table Operations

```sql
-- Create table
CREATE TABLE table_name (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Drop table
DROP TABLE table_name;
DROP TABLE IF EXISTS table_name;

-- Add column
ALTER TABLE table_name ADD COLUMN email VARCHAR(100);

-- Drop column
ALTER TABLE table_name DROP COLUMN email;

-- Rename column
ALTER TABLE table_name RENAME COLUMN old_name TO new_name;

-- Rename table
ALTER TABLE old_name RENAME TO new_name;

-- View table structure (psql)
\d table_name

-- List all tables (psql)
\dt
```

## Data Types

```sql
-- Numeric
INT, INTEGER           -- 4-byte integer
SMALLINT              -- 2-byte integer
BIGINT                -- 8-byte integer
SERIAL                -- Auto-incrementing integer
NUMERIC(p,s)          -- Exact decimal
DECIMAL(p,s)          -- Exact decimal (same as NUMERIC)
REAL                  -- 4-byte floating point
DOUBLE PRECISION      -- 8-byte floating point

-- String
CHAR(n)               -- Fixed-length string
VARCHAR(n)            -- Variable-length string
TEXT                  -- Unlimited length string

-- Boolean
BOOLEAN               -- true/false

-- Date/Time
DATE                  -- Date only (YYYY-MM-DD)
TIME                  -- Time only (HH:MM:SS)
TIMESTAMP             -- Date and time
INTERVAL              -- Time interval

-- Other
UUID                  -- Universally unique identifier
JSON                  -- JSON data
JSONB                 -- Binary JSON (faster)
```

## Constraints

```sql
-- Primary Key
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50)
);

-- Foreign Key
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id)
);

-- Foreign Key with actions
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE
);

-- Unique
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(100) UNIQUE
);

-- Not Null
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Check
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  price NUMERIC CHECK (price > 0)
);

-- Default
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Add constraint after creation
ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (column_name);
ALTER TABLE table_name ADD CONSTRAINT fk_name FOREIGN KEY (column) REFERENCES other_table(id);
```

## CRUD Operations

### Create (INSERT)

```sql
-- Single row
INSERT INTO users (name, email, age) 
VALUES ('Alice', 'alice@example.com', 25);

-- Multiple rows
INSERT INTO users (name, email, age) VALUES
  ('Bob', 'bob@example.com', 30),
  ('Charlie', 'charlie@example.com', 28);

-- From SELECT
INSERT INTO premium_users (name, email)
SELECT name, email FROM users WHERE subscription = 'premium';

-- Insert and return
INSERT INTO users (name, email) 
VALUES ('Diana', 'diana@example.com')
RETURNING id, name;
```

### Read (SELECT)

```sql
-- Select all
SELECT * FROM users;

-- Select specific columns
SELECT name, email FROM users;

-- With condition
SELECT * FROM users WHERE age > 25;

-- Multiple conditions
SELECT * FROM users WHERE age > 25 AND city = 'NYC';
SELECT * FROM users WHERE age < 20 OR age > 60;

-- Order by
SELECT * FROM users ORDER BY age DESC;
SELECT * FROM users ORDER BY name ASC, age DESC;

-- Limit
SELECT * FROM users LIMIT 10;

-- Offset (skip rows)
SELECT * FROM users LIMIT 10 OFFSET 20;

-- Distinct
SELECT DISTINCT city FROM users;
```

### Update (UPDATE)

```sql
-- Update all rows
UPDATE users SET status = 'active';

-- Update with condition
UPDATE users SET age = 26 WHERE name = 'Alice';

-- Update multiple columns
UPDATE users 
SET age = 26, city = 'NYC' 
WHERE id = 1;

-- Update with calculation
UPDATE products SET price = price * 1.1;

-- Update and return
UPDATE users SET age = age + 1 
WHERE id = 1 
RETURNING *;
```

### Delete (DELETE)

```sql
-- Delete specific rows
DELETE FROM users WHERE age < 18;

-- Delete all rows
DELETE FROM users;

-- Delete and return
DELETE FROM users WHERE id = 1 RETURNING *;

-- Truncate (faster for all rows)
TRUNCATE TABLE users;
TRUNCATE TABLE users RESTART IDENTITY;  -- Reset serial
```

## Queries

### WHERE Conditions

```sql
-- Comparison operators
=, !=, <>, >, <, >=, <=

-- Examples
SELECT * FROM products WHERE price > 100;
SELECT * FROM users WHERE age >= 18;
SELECT * FROM orders WHERE status != 'cancelled';

-- BETWEEN
SELECT * FROM products WHERE price BETWEEN 10 AND 100;

-- IN
SELECT * FROM users WHERE city IN ('NYC', 'LA', 'Chicago');

-- NOT IN
SELECT * FROM users WHERE city NOT IN ('NYC', 'LA');

-- LIKE (pattern matching)
SELECT * FROM users WHERE name LIKE 'A%';        -- Starts with A
SELECT * FROM users WHERE name LIKE '%son';      -- Ends with son
SELECT * FROM users WHERE name LIKE '%ar%';      -- Contains ar
SELECT * FROM users WHERE name LIKE '_lice';     -- Second char is 'l'

-- ILIKE (case-insensitive)
SELECT * FROM users WHERE name ILIKE 'alice';

-- IS NULL / IS NOT NULL
SELECT * FROM users WHERE email IS NULL;
SELECT * FROM users WHERE email IS NOT NULL;
```

### Sorting and Limiting

```sql
-- ORDER BY
SELECT * FROM products ORDER BY price ASC;
SELECT * FROM products ORDER BY price DESC;
SELECT * FROM products ORDER BY category, price DESC;

-- LIMIT
SELECT * FROM products LIMIT 5;

-- OFFSET
SELECT * FROM products LIMIT 10 OFFSET 20;  -- Skip 20, get 10

-- Pagination example
SELECT * FROM products LIMIT 10 OFFSET ((page - 1) * 10);
```

## Joins

```sql
-- INNER JOIN (only matching rows)
SELECT users.name, orders.total
FROM users
INNER JOIN orders ON users.id = orders.user_id;

-- LEFT JOIN (all from left table)
SELECT users.name, orders.total
FROM users
LEFT JOIN orders ON users.id = orders.user_id;

-- RIGHT JOIN (all from right table)
SELECT users.name, orders.total
FROM users
RIGHT JOIN orders ON users.id = orders.user_id;

-- FULL JOIN (all from both tables)
SELECT users.name, orders.total
FROM users
FULL JOIN orders ON users.id = orders.user_id;

-- Multiple joins
SELECT u.name, o.total, p.name AS product
FROM users u
INNER JOIN orders o ON u.id = o.user_id
INNER JOIN products p ON o.product_id = p.id;

-- Self join
SELECT e1.name AS employee, e2.name AS manager
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.id;
```

## Aggregate Functions

```sql
-- COUNT
SELECT COUNT(*) FROM users;
SELECT COUNT(DISTINCT city) FROM users;

-- SUM
SELECT SUM(total) FROM orders;

-- AVG
SELECT AVG(age) FROM users;

-- MIN / MAX
SELECT MIN(price), MAX(price) FROM products;

-- GROUP BY
SELECT city, COUNT(*) 
FROM users 
GROUP BY city;

SELECT category, AVG(price) 
FROM products 
GROUP BY category;

-- HAVING (filter groups)
SELECT city, COUNT(*) 
FROM users 
GROUP BY city 
HAVING COUNT(*) > 100;

SELECT category, AVG(price) AS avg_price
FROM products 
GROUP BY category 
HAVING AVG(price) > 50;

-- GROUP BY with ORDER BY
SELECT city, COUNT(*) AS user_count
FROM users 
GROUP BY city 
ORDER BY user_count DESC;
```

## String Functions

```sql
-- CONCAT
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM users;
SELECT first_name || ' ' || last_name AS full_name FROM users;  -- Alternative

-- UPPER / LOWER
SELECT UPPER(name) FROM users;
SELECT LOWER(email) FROM users;

-- LENGTH
SELECT name, LENGTH(name) FROM users;

-- SUBSTRING
SELECT SUBSTRING(name, 1, 3) FROM users;  -- First 3 characters
SELECT SUBSTRING(name FROM 2 FOR 4) FROM users;  -- Alternative syntax

-- TRIM
SELECT TRIM(name) FROM users;              -- Remove spaces both sides
SELECT LTRIM(name) FROM users;             -- Remove left spaces
SELECT RTRIM(name) FROM users;             -- Remove right spaces

-- REPLACE
SELECT REPLACE(email, 'gmail.com', 'example.com') FROM users;

-- SPLIT_PART
SELECT SPLIT_PART(email, '@', 1) AS username FROM users;
SELECT SPLIT_PART(email, '@', 2) AS domain FROM users;
```

## Date Functions

```sql
-- Current date/time
SELECT NOW();                    -- Current timestamp
SELECT CURRENT_DATE;            -- Current date
SELECT CURRENT_TIME;            -- Current time

-- Extract parts
SELECT EXTRACT(YEAR FROM created_at) FROM orders;
SELECT EXTRACT(MONTH FROM created_at) FROM orders;
SELECT EXTRACT(DAY FROM created_at) FROM orders;

-- Date arithmetic
SELECT created_at + INTERVAL '7 days' FROM orders;
SELECT created_at - INTERVAL '1 month' FROM orders;

-- Age (difference between dates)
SELECT AGE(NOW(), created_at) FROM users;

-- Date formatting
SELECT TO_CHAR(created_at, 'YYYY-MM-DD') FROM orders;
SELECT TO_CHAR(created_at, 'Mon DD, YYYY') FROM orders;
```

## Subqueries

```sql
-- Subquery in WHERE
SELECT name FROM users 
WHERE age > (SELECT AVG(age) FROM users);

-- Subquery with IN
SELECT name FROM users 
WHERE id IN (SELECT user_id FROM orders WHERE total > 1000);

-- Subquery in FROM
SELECT avg_age FROM 
  (SELECT AVG(age) AS avg_age FROM users GROUP BY city) AS city_stats;

-- EXISTS
SELECT name FROM users u
WHERE EXISTS (SELECT 1 FROM orders o WHERE o.user_id = u.id);

-- Correlated subquery
SELECT name, 
  (SELECT COUNT(*) FROM orders WHERE user_id = users.id) AS order_count
FROM users;
```

## Indexes

```sql
-- Create index
CREATE INDEX idx_users_email ON users(email);

-- Create unique index
CREATE UNIQUE INDEX idx_users_username ON users(username);

-- Create index on multiple columns
CREATE INDEX idx_orders_user_date ON orders(user_id, created_at);

-- Drop index
DROP INDEX idx_users_email;

-- List indexes (psql)
\di
```

## Psql Commands

```sql
\l                -- List databases
\c dbname         -- Connect to database
\dt               -- List tables
\d tablename      -- Describe table
\d+ tablename     -- Detailed table info
\di               -- List indexes
\du               -- List users
\df               -- List functions
\dn               -- List schemas
\x                -- Toggle expanded display
\q                -- Quit
\?                -- Help
\h COMMAND        -- Help on SQL command
\i filename       -- Execute commands from file
\o filename       -- Send output to file
\timing           -- Toggle timing of queries
```

## Useful Patterns

```sql
-- UPSERT (INSERT or UPDATE)
INSERT INTO users (id, name, email) 
VALUES (1, 'Alice', 'alice@example.com')
ON CONFLICT (id) DO UPDATE 
SET name = EXCLUDED.name, email = EXCLUDED.email;

-- Case statement
SELECT name,
  CASE 
    WHEN age < 18 THEN 'Minor'
    WHEN age >= 18 AND age < 65 THEN 'Adult'
    ELSE 'Senior'
  END AS age_group
FROM users;

-- COALESCE (return first non-null)
SELECT COALESCE(phone, email, 'No contact') FROM users;

-- NULLIF (return NULL if equal)
SELECT NULLIF(status, 'unknown') FROM orders;

-- WITH (Common Table Expression)
WITH avg_prices AS (
  SELECT category, AVG(price) AS avg_price
  FROM products
  GROUP BY category
)
SELECT * FROM avg_prices WHERE avg_price > 50;
```

---

Keep this reference handy while working through SQL challenges and projects!
