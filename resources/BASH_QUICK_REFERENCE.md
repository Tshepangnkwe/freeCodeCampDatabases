# Bash Scripting Quick Reference

A comprehensive cheat sheet for Bash scripting and terminal commands.

## Table of Contents
- [Basics](#basics)
- [Variables](#variables)
- [User Input](#user-input)
- [Conditionals](#conditionals)
- [Loops](#loops)
- [Functions](#functions)
- [Arrays](#arrays)
- [String Operations](#string-operations)
- [File Operations](#file-operations)
- [PostgreSQL in Bash](#postgresql-in-bash)
- [Useful Commands](#useful-commands)

## Basics

```bash
#!/bin/bash
# Shebang - Must be first line

# Comments start with #

# Make script executable
chmod +x script.sh

# Run script
./script.sh
bash script.sh
```

## Variables

```bash
# Define variable (no spaces around =)
NAME="Alice"
AGE=25
COUNT=10

# Use variable
echo $NAME
echo "Name: $NAME"
echo "Name: ${NAME}"  # Recommended

# Command substitution
CURRENT_DATE=$(date)
FILES=$(ls)

# Arithmetic
RESULT=$((5 + 3))
COUNT=$((COUNT + 1))
((COUNT++))

# Read-only variable
readonly PI=3.14159

# Environment variables
export DB_NAME="mydb"
```

## User Input

```bash
# Simple read
echo "What's your name?"
read NAME

# Read with prompt
read -p "Enter your age: " AGE

# Read silently (password)
read -sp "Enter password: " PASSWORD

# Read into array
read -a NAMES

# Read multiple variables
read FIRST LAST <<< "John Doe"
```

## Conditionals

### If Statements

```bash
# Basic if
if [[ condition ]]
then
  # code
fi

# If-else
if [[ $AGE -ge 18 ]]
then
  echo "Adult"
else
  echo "Minor"
fi

# If-elif-else
if [[ $SCORE -ge 90 ]]
then
  echo "A"
elif [[ $SCORE -ge 80 ]]
then
  echo "B"
elif [[ $SCORE -ge 70 ]]
then
  echo "C"
else
  echo "F"
fi

# One-line if
[[ $AGE -ge 18 ]] && echo "Adult" || echo "Minor"
```

### Comparison Operators

```bash
# Numeric comparisons
-eq    # Equal
-ne    # Not equal
-gt    # Greater than
-lt    # Less than
-ge    # Greater than or equal
-le    # Less than or equal

# Examples
if [[ $AGE -eq 25 ]]; then echo "25 years old"; fi
if [[ $COUNT -gt 10 ]]; then echo "More than 10"; fi

# String comparisons
==     # Equal
!=     # Not equal
<      # Less than (alphabetically)
>      # Greater than (alphabetically)
-z     # Empty string
-n     # Not empty string

# Examples
if [[ $NAME == "Alice" ]]; then echo "Hello Alice"; fi
if [[ -z $EMAIL ]]; then echo "Email is empty"; fi
if [[ -n $PHONE ]]; then echo "Phone provided"; fi

# File tests
-e     # File exists
-f     # Regular file exists
-d     # Directory exists
-r     # Readable
-w     # Writable
-x     # Executable
-s     # File size > 0

# Examples
if [[ -f "config.txt" ]]; then echo "File exists"; fi
if [[ -d "logs" ]]; then echo "Directory exists"; fi

# Logical operators
&&     # AND
||     # OR
!      # NOT

# Examples
if [[ $AGE -ge 18 && $HAS_LICENSE == "yes" ]]; then
  echo "Can drive"
fi

if [[ $GRADE == "A" || $GRADE == "B" ]]; then
  echo "Good grade"
fi

if [[ ! -f "config.txt" ]]; then
  echo "Config file missing"
fi
```

### Case Statements

```bash
case $OPTION in
  1)
    echo "Option 1 selected"
    ;;
  2)
    echo "Option 2 selected"
    ;;
  3 | 4)
    echo "Option 3 or 4 selected"
    ;;
  *)
    echo "Invalid option"
    ;;
esac

# Example: File type checker
case $FILE in
  *.txt)
    echo "Text file"
    ;;
  *.jpg | *.png)
    echo "Image file"
    ;;
  *.sh)
    echo "Shell script"
    ;;
  *)
    echo "Unknown file type"
    ;;
esac
```

## Loops

### For Loop

```bash
# Loop over list
for NAME in Alice Bob Charlie
do
  echo "Hello, $NAME"
done

# Loop over range
for i in {1..10}
do
  echo "Number: $i"
done

# Loop with step
for i in {0..100..10}
do
  echo $i
done

# C-style for loop
for ((i=1; i<=10; i++))
do
  echo "Count: $i"
done

# Loop over files
for FILE in *.txt
do
  echo "Processing: $FILE"
done

# Loop over array
NAMES=("Alice" "Bob" "Charlie")
for NAME in "${NAMES[@]}"
do
  echo "Name: $NAME"
done

# Loop over command output
for USER in $(cat users.txt)
do
  echo "User: $USER"
done
```

### While Loop

```bash
# Basic while
COUNTER=1
while [[ $COUNTER -le 5 ]]
do
  echo "Count: $COUNTER"
  ((COUNTER++))
done

# Read file line by line
while IFS= read -r LINE
do
  echo "Line: $LINE"
done < file.txt

# Infinite loop
while true
do
  echo "Running..."
  sleep 1
done

# While with condition
while [[ $RESPONSE != "quit" ]]
do
  read -p "Enter command (quit to exit): " RESPONSE
  echo "You entered: $RESPONSE"
done
```

### Until Loop

```bash
# Runs until condition is true
COUNTER=1
until [[ $COUNTER -gt 5 ]]
do
  echo "Count: $COUNTER"
  ((COUNTER++))
done
```

### Loop Control

```bash
# Break - exit loop
for i in {1..10}
do
  if [[ $i -eq 5 ]]; then
    break
  fi
  echo $i
done

# Continue - skip iteration
for i in {1..10}
do
  if [[ $i -eq 5 ]]; then
    continue
  fi
  echo $i
done
```

## Functions

```bash
# Define function
greet() {
  echo "Hello, $1!"
}

# Call function
greet "Alice"

# Function with multiple parameters
add() {
  local result=$(($1 + $2))
  echo $result
}

sum=$(add 5 3)
echo "Sum: $sum"

# Function with return value
is_even() {
  if [[ $(($1 % 2)) -eq 0 ]]; then
    return 0  # True
  else
    return 1  # False
  fi
}

if is_even 4; then
  echo "4 is even"
fi

# Local variables
calculate() {
  local x=10
  local y=20
  echo $((x + y))
}

# Access all parameters
print_all() {
  echo "All parameters: $@"
  echo "Number of parameters: $#"
}

print_all one two three
```

## Arrays

```bash
# Define array
FRUITS=("Apple" "Banana" "Cherry")

# Access elements
echo ${FRUITS[0]}        # First element
echo ${FRUITS[1]}        # Second element
echo ${FRUITS[@]}        # All elements
echo ${#FRUITS[@]}       # Array length

# Add element
FRUITS+=("Date")

# Loop through array
for FRUIT in "${FRUITS[@]}"
do
  echo "Fruit: $FRUIT"
done

# Loop with index
for i in "${!FRUITS[@]}"
do
  echo "Index $i: ${FRUITS[$i]}"
done

# Associative array (dictionary)
declare -A AGES
AGES["Alice"]=25
AGES["Bob"]=30

echo ${AGES["Alice"]}

# Loop through associative array
for NAME in "${!AGES[@]}"
do
  echo "$NAME is ${AGES[$NAME]} years old"
done
```

## String Operations

```bash
# String length
NAME="Alice"
echo ${#NAME}            # 5

# Substring
TEXT="Hello World"
echo ${TEXT:0:5}         # "Hello"
echo ${TEXT:6}           # "World"

# Replace
echo ${TEXT/World/Universe}   # "Hello Universe"
echo ${TEXT//o/0}             # Replace all: "Hell0 W0rld"

# Uppercase/Lowercase
echo ${NAME^^}           # "ALICE"
echo ${NAME,,}           # "alice"

# Concatenation
FIRST="John"
LAST="Doe"
FULL="$FIRST $LAST"
echo $FULL

# Check if string contains
if [[ $TEXT == *"World"* ]]; then
  echo "Contains World"
fi

# String comparison
if [[ $NAME == "Alice" ]]; then
  echo "Name is Alice"
fi
```

## File Operations

```bash
# Create file
touch filename.txt
echo "content" > filename.txt

# Append to file
echo "more content" >> filename.txt

# Read file
cat filename.txt

# Read file line by line
while IFS= read -r line
do
  echo "$line"
done < filename.txt

# Check if file exists
if [[ -f "file.txt" ]]; then
  echo "File exists"
fi

# Check if directory exists
if [[ -d "dirname" ]]; then
  echo "Directory exists"
fi

# Create directory
mkdir dirname
mkdir -p path/to/nested/dir

# Remove file
rm filename.txt

# Remove directory
rm -r dirname

# Copy file
cp source.txt destination.txt

# Move/Rename file
mv oldname.txt newname.txt

# File permissions
chmod +x script.sh       # Make executable
chmod 755 script.sh      # rwxr-xr-x
chmod 644 file.txt       # rw-r--r--
```

## PostgreSQL in Bash

```bash
# Define psql command
PSQL="psql -X --username=postgres --dbname=mydb --tuples-only -c"

# Execute query
RESULT=$($PSQL "SELECT name FROM users WHERE id=1")
echo "Name: $RESULT"

# Query with variable
USER_ID=5
NAME=$($PSQL "SELECT name FROM users WHERE id=$USER_ID")

# Insert data
$PSQL "INSERT INTO users (name, age) VALUES ('Alice', 25)"

# Loop through query results
$PSQL "SELECT name FROM users" | while read NAME
do
  echo "User: $NAME"
done

# Count rows
COUNT=$($PSQL "SELECT COUNT(*) FROM users")
echo "Total users: $COUNT"

# Use heredoc for multi-line SQL
RESULT=$(psql -U postgres -d mydb <<EOF
  SELECT name, age 
  FROM users 
  WHERE age > 18 
  ORDER BY name;
EOF
)

# Error handling
if RESULT=$($PSQL "SELECT * FROM users" 2>&1); then
  echo "Query successful"
else
  echo "Query failed: $RESULT"
fi
```

## Useful Commands

```bash
# Print
echo "Hello World"
printf "Name: %s, Age: %d\n" "$NAME" $AGE

# Sleep
sleep 1              # 1 second
sleep 0.5            # 0.5 seconds

# Random number
RANDOM_NUM=$((RANDOM % 100))  # 0-99

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get current date/time
DATE=$(date)
DATE=$(date +"%Y-%m-%d")
TIME=$(date +"%H:%M:%S")

# Exit script
exit 0              # Success
exit 1              # Error

# Get script arguments
echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "All arguments: $@"
echo "Number of arguments: $#"

# Pattern matching with grep
echo "Hello World" | grep "World"
grep "pattern" file.txt
grep -i "pattern" file.txt    # Case insensitive
grep -r "pattern" directory/  # Recursive

# Text processing with sed
sed 's/old/new/' file.txt              # Replace first occurrence
sed 's/old/new/g' file.txt             # Replace all
sed -i 's/old/new/g' file.txt          # Edit file in-place

# Text processing with awk
awk '{print $1}' file.txt              # Print first column
awk -F',' '{print $2}' file.csv        # CSV: print second column

# Find files
find . -name "*.txt"
find . -type f -name "*.sh"
find . -mtime -7                       # Modified in last 7 days

# Sort
sort file.txt
sort -r file.txt                       # Reverse
sort -n file.txt                       # Numeric
sort -u file.txt                       # Unique

# Word/Line/Character count
wc file.txt
wc -l file.txt                         # Line count
wc -w file.txt                         # Word count
wc -c file.txt                         # Character count

# Redirect output
command > output.txt                   # Overwrite
command >> output.txt                  # Append
command 2> errors.txt                  # Redirect stderr
command > output.txt 2>&1              # Redirect both
command &> output.txt                  # Redirect both (shorter)
command > /dev/null                    # Discard output
```

## Best Practices

```bash
# Always quote variables
echo "$NAME"                # Good
echo $NAME                  # Bad (can break with spaces)

# Use [[ ]] instead of [ ]
if [[ $AGE -gt 18 ]]; then  # Good
if [ $AGE -gt 18 ]; then    # Less flexible

# Check if variable is set
if [[ -z $VAR ]]; then
  echo "VAR is not set"
fi

# Use functions for reusable code
# Add error handling
# Comment your code
# Use meaningful variable names
# Make scripts idempotent when possible
```

---

Keep this reference handy while writing Bash scripts!
