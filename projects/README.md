# Certification Projects

This directory contains the 5 required projects for the freeCodeCamp Relational Databases certification.

## Project Overview

To earn the certification, you must complete all 5 projects and pass the certification exam.

### 1. Celestial Bodies Database ⭐
**Status**: ⬜ Not Started

Build a PostgreSQL database of celestial bodies (planets, moons, stars, galaxies).

**Requirements**:
- Create a database with at least 3 related tables
- Use primary keys and foreign keys
- Include various data types
- Populate with realistic data

**Skills Practiced**:
- Database design
- Table relationships
- Data normalization
- SQL constraints

**Directory**: `celestial-bodies-database/`

---

### 2. World Cup Database 🏆
**Status**: ⬜ Not Started

Create a database to store World Cup tournament information and write a Bash script to query it.

**Requirements**:
- Database with teams and games tables
- Bash script to insert data from CSV
- Bash script to query and display statistics

**Skills Practiced**:
- Database creation
- Foreign key relationships
- Bash scripting
- Data insertion from files
- Complex SQL queries

**Directory**: `world-cup-database/`

---

### 3. Salon Appointment Scheduler 💇
**Status**: ⬜ Not Started

Build an interactive Bash program that uses PostgreSQL to track customers and appointments.

**Requirements**:
- Interactive menu system in Bash
- Customer database
- Service scheduling
- Input validation
- Database queries within Bash script

**Skills Practiced**:
- Interactive Bash programming
- User input handling
- Database integration
- Control flow
- Error handling

**Directory**: `salon-appointment-scheduler/`

---

### 4. Periodic Table Database 🧪
**Status**: ⬜ Not Started

Create a database of chemical elements with a Bash script to query information.

**Requirements**:
- Database with elements and properties
- Bash script accepting element symbol, name, or atomic number
- Display formatted element information
- Handle invalid inputs

**Skills Practiced**:
- Database design
- Command-line arguments
- Conditional logic
- String manipulation
- Formatted output

**Directory**: `periodic-table-database/`

---

### 5. Number Guessing Game 🎲
**Status**: ⬜ Not Started

Build an interactive number guessing game that uses a PostgreSQL database to track users and games.

**Requirements**:
- Random number generation
- User authentication
- Game statistics (games played, best game)
- Persistent data storage
- User-friendly interface

**Skills Practiced**:
- Game logic
- Random number generation in Bash
- User data persistence
- Database queries and updates
- Statistics calculation

**Directory**: `number-guessing-game/`

---

## Project Structure

Each project directory should contain:

```
project-name/
├── README.md              # Project description and requirements
├── database.sql           # Database creation script
├── script.sh              # Main Bash script (if applicable)
├── insert_data.sh         # Data insertion script (if applicable)
├── queries.sh             # Query script (if applicable)
├── data/                  # Sample data files (CSV, etc.)
└── .env.example          # Environment variable template
```

## Testing Your Projects

Before submission, verify:

- ✅ All requirements are met
- ✅ Database tables are properly structured
- ✅ Scripts are executable (`chmod +x script.sh`)
- ✅ No hardcoded passwords or sensitive data
- ✅ Code is well-commented
- ✅ Scripts handle edge cases and errors
- ✅ Output is clean and user-friendly

## Project Guidelines

### Database Design
- Use meaningful table and column names
- Apply normalization principles
- Set appropriate data types
- Use constraints (NOT NULL, UNIQUE, CHECK)
- Create indexes for frequently queried columns

### Bash Scripts
- Start with shebang: `#!/bin/bash`
- Use descriptive variable names
- Add comments to explain logic
- Validate user input
- Handle errors gracefully
- Make scripts user-friendly

### SQL Best Practices
- Use transactions for multiple operations
- Avoid SQL injection (use proper escaping)
- Write efficient queries
- Test queries before using in scripts
- Use meaningful aliases

## Common Pitfalls

❌ **Hardcoding database credentials**
```bash
# Bad
psql -U postgres -d mydb
```
✅ **Use variables or environment files**
```bash
# Good
PSQL="psql -X --username=$DB_USER --dbname=$DB_NAME"
```

❌ **No error handling**
```bash
# Bad
result=$(psql ...)
echo $result
```
✅ **Check for errors**
```bash
# Good
if [[ -z $result ]]; then
  echo "Error: No result found"
  exit 1
fi
```

❌ **Unvalidated user input**
```bash
# Bad
read INPUT
psql -c "SELECT * FROM users WHERE id=$INPUT"
```
✅ **Validate input**
```bash
# Good
read INPUT
if [[ ! $INPUT =~ ^[0-9]+$ ]]; then
  echo "Invalid input"
  exit 1
fi
```

## Submission Checklist

Before marking a project as complete:

- [ ] All functional requirements met
- [ ] Database schema is correct
- [ ] All scripts are executable
- [ ] Scripts produce correct output
- [ ] Code is well-commented
- [ ] No syntax errors
- [ ] Edge cases handled
- [ ] README documentation complete
- [ ] Tested thoroughly
- [ ] Committed to GitHub with clear commit messages

## Resources

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Bash Scripting Guide](https://tldp.org/LDP/abs/html/)
- [SQL Style Guide](https://www.sqlstyle.guide/)
- [freeCodeCamp Forum](https://forum.freecodecamp.org/)

## Tips for Success

1. **Start Simple** - Get basic functionality working first
2. **Test Frequently** - Run your scripts often during development
3. **Read Requirements Carefully** - Make sure you understand what's needed
4. **Use Version Control** - Commit your progress regularly
5. **Ask for Help** - Use the freeCodeCamp forum when stuck
6. **Review Others' Code** - Learn from the community (after completing yourself!)

---

**Status Legend**:
- ⬜ Not Started
- 🔄 In Progress
- ✅ Completed
- ✔️ Tested and Verified

Good luck with your certification projects! 🚀
