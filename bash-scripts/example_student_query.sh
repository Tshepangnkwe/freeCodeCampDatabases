#!/bin/bash

# Example: Simple Student Database Query Script
# This script demonstrates how to integrate PostgreSQL with Bash
# Author: Your Name
# Date: 2026-02-10

# Database connection string
PSQL="psql -X --username=postgres --dbname=students --tuples-only -c"

echo "Student Database Query Tool"
echo "============================"
echo ""

# Menu
echo "Select an option:"
echo "1) View all students"
echo "2) Search for a student"
echo "3) Add a student"
echo "4) Exit"
echo ""

read -p "Enter choice [1-4]: " CHOICE

case $CHOICE in
  1)
    echo ""
    echo "All Students:"
    echo "-------------"
    $PSQL "SELECT name, age, gpa FROM students ORDER BY name"
    ;;
  
  2)
    read -p "Enter student name: " NAME
    RESULT=$($PSQL "SELECT name, age, gpa FROM students WHERE name='$NAME'")
    
    if [[ -z $RESULT ]]; then
      echo "Student not found."
    else
      echo "Student found: $RESULT"
    fi
    ;;
  
  3)
    read -p "Enter student name: " NAME
    read -p "Enter student age: " AGE
    read -p "Enter student GPA: " GPA
    
    # Validate input
    if [[ -z $NAME || -z $AGE || -z $GPA ]]; then
      echo "Error: All fields are required."
      exit 1
    fi
    
    # Insert student
    INSERT_RESULT=$($PSQL "INSERT INTO students (name, age, gpa) VALUES ('$NAME', $AGE, $GPA)")
    echo "Student added successfully!"
    ;;
  
  4)
    echo "Goodbye!"
    exit 0
    ;;
  
  *)
    echo "Invalid choice. Please select 1-4."
    exit 1
    ;;
esac

echo ""
echo "Query complete!"
