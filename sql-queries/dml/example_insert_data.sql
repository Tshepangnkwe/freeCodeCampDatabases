-- Example: Insert Sample Data into Student Database
-- Description: Populates tables with sample data
-- Author: Your Name
-- Date: 2026-02-10

-- Connect to the database
\c students

-- Insert students
INSERT INTO students (name, email, age, gpa) VALUES
  ('Alice Johnson', 'alice.j@university.edu', 20, 3.85),
  ('Bob Smith', 'bob.smith@university.edu', 22, 3.42),
  ('Charlie Brown', 'charlie.b@university.edu', 19, 3.67),
  ('Diana Prince', 'diana.p@university.edu', 21, 3.91),
  ('Ethan Hunt', 'ethan.h@university.edu', 23, 3.28);

-- Insert courses
INSERT INTO courses (course_code, course_name, credits, department) VALUES
  ('CS101', 'Introduction to Programming', 3, 'Computer Science'),
  ('CS201', 'Data Structures', 4, 'Computer Science'),
  ('MATH150', 'Calculus I', 4, 'Mathematics'),
  ('ENG101', 'English Composition', 3, 'English'),
  ('PHYS201', 'Physics I', 4, 'Physics');

-- Insert enrollments
INSERT INTO enrollments (student_id, course_id, grade, semester) VALUES
  (1, 1, 'A', 'Fall 2025'),
  (1, 3, 'B+', 'Fall 2025'),
  (2, 1, 'B', 'Fall 2025'),
  (2, 2, 'B+', 'Spring 2026'),
  (3, 1, 'A-', 'Fall 2025'),
  (3, 4, 'A', 'Fall 2025'),
  (4, 1, 'A', 'Fall 2025'),
  (4, 3, 'A', 'Fall 2025'),
  (4, 5, 'A-', 'Spring 2026'),
  (5, 2, 'B', 'Spring 2026'),
  (5, 4, 'C+', 'Fall 2025');

-- Verify data was inserted
SELECT 'Data inserted successfully!' AS message;

-- Show counts
SELECT 'Students: ' || COUNT(*) FROM students;
SELECT 'Courses: ' || COUNT(*) FROM courses;
SELECT 'Enrollments: ' || COUNT(*) FROM enrollments;
