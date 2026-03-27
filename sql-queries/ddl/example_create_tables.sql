-- Example: Student Database Schema
-- Description: Creates tables for a student management system
-- Author: Your Name
-- Date: 2026-02-10

-- Drop existing database if it exists
DROP DATABASE IF EXISTS students;

-- Create database
CREATE DATABASE students;

-- Connect to the database
\c students

-- Create students table
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  age INT CHECK (age >= 16 AND age <= 100),
  gpa NUMERIC(3,2) CHECK (gpa >= 0.0 AND gpa <= 4.0),
  enrollment_date DATE DEFAULT CURRENT_DATE
);

-- Create courses table
CREATE TABLE courses (
  course_id SERIAL PRIMARY KEY,
  course_code VARCHAR(10) UNIQUE NOT NULL,
  course_name VARCHAR(100) NOT NULL,
  credits INT CHECK (credits > 0),
  department VARCHAR(50) NOT NULL
);

-- Create enrollments junction table
CREATE TABLE enrollments (
  enrollment_id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students(student_id) ON DELETE CASCADE,
  course_id INT REFERENCES courses(course_id) ON DELETE CASCADE,
  grade VARCHAR(2),
  semester VARCHAR(20) NOT NULL,
  UNIQUE(student_id, course_id, semester)
);

-- Create indexes for better query performance
CREATE INDEX idx_students_name ON students(name);
CREATE INDEX idx_students_email ON students(email);
CREATE INDEX idx_enrollments_student ON enrollments(student_id);
CREATE INDEX idx_enrollments_course ON enrollments(course_id);

-- Display table structure
\d students
\d courses
\d enrollments

-- Success message
SELECT 'Database schema created successfully!' AS message;
