-- Example: Common SQL Queries
-- Description: Demonstrates various SQL query patterns
-- Author: Your Name
-- Date: 2026-02-10

-- Connect to the database
\c students

-- =========================
-- BASIC QUERIES
-- =========================

-- Select all students
SELECT * FROM students;

-- Select specific columns
SELECT name, email, gpa FROM students;

-- Filter with WHERE
SELECT name, gpa FROM students WHERE gpa >= 3.5;

-- Order results
SELECT name, gpa FROM students ORDER BY gpa DESC;

-- Limit results
SELECT name, gpa FROM students ORDER BY gpa DESC LIMIT 3;

-- =========================
-- AGGREGATE FUNCTIONS
-- =========================

-- Count total students
SELECT COUNT(*) AS total_students FROM students;

-- Average GPA
SELECT ROUND(AVG(gpa), 2) AS average_gpa FROM students;

-- Min and Max GPA
SELECT MIN(gpa) AS lowest_gpa, MAX(gpa) AS highest_gpa FROM students;

-- Group by and count
SELECT department, COUNT(*) AS course_count 
FROM courses 
GROUP BY department;

-- Group by with HAVING
SELECT department, COUNT(*) AS course_count 
FROM courses 
GROUP BY department 
HAVING COUNT(*) > 1;

-- =========================
-- JOINS
-- =========================

-- Inner join - students with their enrollments
SELECT 
  s.name AS student_name,
  c.course_name,
  e.grade,
  e.semester
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id
ORDER BY s.name, e.semester;

-- Left join - all students including those without enrollments
SELECT 
  s.name AS student_name,
  COUNT(e.enrollment_id) AS courses_enrolled
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
ORDER BY s.name;

-- Students enrolled in CS courses
SELECT DISTINCT s.name
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id
WHERE c.department = 'Computer Science'
ORDER BY s.name;

-- =========================
-- SUBQUERIES
-- =========================

-- Students with above average GPA
SELECT name, gpa 
FROM students 
WHERE gpa > (SELECT AVG(gpa) FROM students)
ORDER BY gpa DESC;

-- Students enrolled in the most popular course
SELECT name
FROM students
WHERE student_id IN (
  SELECT student_id 
  FROM enrollments 
  WHERE course_id = (
    SELECT course_id 
    FROM enrollments 
    GROUP BY course_id 
    ORDER BY COUNT(*) DESC 
    LIMIT 1
  )
);

-- =========================
-- COMPLEX QUERIES
-- =========================

-- Student performance summary
SELECT 
  s.name,
  s.gpa,
  COUNT(e.enrollment_id) AS courses_taken,
  STRING_AGG(c.course_code, ', ' ORDER BY c.course_code) AS courses
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
GROUP BY s.student_id, s.name, s.gpa
ORDER BY s.gpa DESC;

-- Courses with enrollment statistics
SELECT 
  c.course_code,
  c.course_name,
  c.department,
  COUNT(e.enrollment_id) AS students_enrolled,
  ROUND(AVG(
    CASE e.grade
      WHEN 'A' THEN 4.0
      WHEN 'A-' THEN 3.7
      WHEN 'B+' THEN 3.3
      WHEN 'B' THEN 3.0
      WHEN 'B-' THEN 2.7
      WHEN 'C+' THEN 2.3
      WHEN 'C' THEN 2.0
      ELSE 0
    END
  ), 2) AS average_grade_points
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_code, c.course_name, c.department
HAVING COUNT(e.enrollment_id) > 0
ORDER BY students_enrolled DESC;

-- =========================
-- STRING OPERATIONS
-- =========================

-- Extract email domains
SELECT 
  name,
  SPLIT_PART(email, '@', 2) AS email_domain
FROM students;

-- Search by name pattern
SELECT name, email 
FROM students 
WHERE name ILIKE '%son%';

-- =========================
-- DATE OPERATIONS
-- =========================

-- Students enrolled this year
SELECT name, enrollment_date 
FROM students 
WHERE EXTRACT(YEAR FROM enrollment_date) = 2026;

-- Days since enrollment
SELECT 
  name, 
  enrollment_date,
  CURRENT_DATE - enrollment_date AS days_enrolled
FROM students
ORDER BY days_enrolled DESC;

-- =========================
-- UPDATES AND DELETES
-- =========================

-- Update a student's GPA (commented out for safety)
-- UPDATE students SET gpa = 3.95 WHERE name = 'Alice Johnson';

-- Delete a specific enrollment (commented out for safety)
-- DELETE FROM enrollments WHERE enrollment_id = 1;

-- =========================
-- USEFUL METADATA QUERIES
-- =========================

-- List all tables
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';

-- List columns in a table
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'students';

-- Show table sizes
SELECT 
  schemaname,
  tablename,
  pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) AS size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;
