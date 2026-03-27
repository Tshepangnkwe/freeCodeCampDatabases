# Bash Scripts

This directory contains bash scripts and programs created throughout the certification course.

## About Bash Scripting

Bash (Bourne Again Shell) is a command-line interpreter that allows you to automate tasks, combine commands, and create programs using terminal commands.

## Organization

Scripts are organized by the workshop or module they belong to:

```
bash-scripts/
├── boilerplate/           # Learn Bash by Building a Boilerplate
├── five-programs/         # Learn Bash Scripting by Building Five Programs
│   ├── questionnaire.sh
│   ├── countdown.sh
│   ├── bingo.sh
│   ├── fortune.sh
│   └── five.sh
├── kitty-ipsum/          # Learn Advanced Bash by Building a Kitty Ipsum Translator
├── bike-rental/          # Bash scripts for bike rental shop
├── student-info/         # Student database scripts
└── utilities/            # Utility scripts and helpers
```

## Running Scripts

### Make Executable
```bash
chmod +x script_name.sh
```

### Execute
```bash
# Method 1: Direct execution
./script_name.sh

# Method 2: Using bash
bash script_name.sh

# Method 3: Using sh
sh script_name.sh
```

## Bash Scripting Basics

### Shebang
Every bash script should start with a shebang:
```bash
#!/bin/bash
```

### Variables
```bash
# Define variable
NAME="John"
AGE=25

# Use variable
echo "Name: $NAME"
echo "Age: ${AGE}"
```

### User Input
```bash
# Read input
echo "What's your name?"
read NAME

# Read with prompt
read -p "Enter your age: " AGE
```

### Conditionals
```bash
# If statement
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
else
  echo "C"
fi
```

### Loops
```bash
# For loop
for i in 1 2 3 4 5
do
  echo "Number: $i"
done

# While loop
COUNTER=1
while [[ $COUNTER -le 5 ]]
do
  echo "Count: $COUNTER"
  ((COUNTER++))
done

# Until loop
until [[ $COUNTER -gt 5 ]]
do
  echo "Count: $COUNTER"
  ((COUNTER++))
done
```

### Functions
```bash
# Define function
greet() {
  echo "Hello, $1!"
}

# Call function
greet "Alice"
```

### Command Substitution
```bash
# Capture command output
CURRENT_DATE=$(date)
echo "Today is: $CURRENT_DATE"

# Alternative syntax
FILES=`ls`
```

## PostgreSQL in Bash Scripts

### Connecting to Database
```bash
# Execute SQL query
PSQL="psql -X --username=postgres --dbname=database_name --tuples-only -c"

# Use in script
RESULT=$($PSQL "SELECT name FROM users WHERE id=1")
echo "Name: $RESULT"
```

### Example: Query and Process
```bash
#!/bin/bash

PSQL="psql -X --username=postgres --dbname=students --tuples-only -c"

# Get all students
STUDENTS=$($PSQL "SELECT name FROM students")

# Loop through results
echo "$STUDENTS" | while read NAME
do
  echo "Student: $NAME"
done
```

## Tips

- Always quote variables: `"$VAR"` instead of `$VAR`
- Use `[[ ]]` for conditionals (more features than `[ ]`)
- Add error handling to your scripts
- Comment your code thoroughly
- Test scripts before running on important data

## Common Pitfalls

- Forgetting spaces in conditionals: `[[ $A==$B ]]` ❌ → `[[ $A == $B ]]` ✅
- Not making scripts executable: run `chmod +x script.sh`
- Using wrong comparison operators:
  - Strings: `==`, `!=`
  - Numbers: `-eq`, `-ne`, `-gt`, `-lt`, `-ge`, `-le`

## Resources

- [Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/)
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/)
- [ShellCheck](https://www.shellcheck.net/) - Script analyzer

---

Practice makes perfect! Work through each workshop and build your bash scripting skills step by step.
