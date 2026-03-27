# Contributing to Your Learning Journey

This repository is your personal learning space. Here are guidelines to help you stay organized and build good development habits.

## Git Workflow

### Daily Workflow

```bash
# 1. Start your study session
git pull origin main

# 2. Work on your module/project
# ... code, test, debug ...

# 3. Add your changes
git add .
# Or add specific files
git add bash-scripts/student_info.sh

# 4. Commit with a meaningful message
git commit -m "Complete Module 3: Bash loops and functions"

# 5. Push to GitHub
git push origin main
```

### Commit Message Guidelines

Write clear, descriptive commit messages:

#### Good Examples ✅
- `Complete Module 2: Mario Database workshop`
- `Add student database SQL queries`
- `Implement bike rental shop bash script`
- `Fix: Correct JOIN syntax in world cup queries`
- `Add notes on aggregate functions`
- `Complete Project 1: Celestial Bodies Database`

#### Poor Examples ❌
- `update`
- `changes`
- `fix stuff`
- `asdf`
- `Module 2` (too vague)

#### Format
```
<type>: <description>

Types:
- Complete: Finished a module or lesson
- Add: New files or features
- Fix: Bug fixes
- Update: Modifications to existing code
- Docs: Documentation changes
- Refactor: Code improvements
```

### Working on Projects

Use feature branches for certification projects:

```bash
# Create a branch for your project
git checkout -b project-celestial-bodies

# Work on your project
# ... code ...

# Commit regularly
git add projects/celestial-bodies-database/
git commit -m "Add planets table and initial data"

# Push branch to GitHub
git push origin project-celestial-bodies

# When complete, merge to main
git checkout main
git merge project-celestial-bodies
git push origin main

# Optional: Delete the branch
git branch -d project-celestial-bodies
git push origin --delete project-celestial-bodies
```

## File Organization

### Bash Scripts

```bash
# File naming
questionnaire.sh         # Good: descriptive
script1.sh              # Bad: not descriptive

# File structure
#!/bin/bash
# Description of what the script does
# Author: Your Name
# Date: YYYY-MM-DD

PSQL="psql -X --username=postgres --dbname=mydb --tuples-only -c"

# Your code here
```

### SQL Files

```sql
-- File header
-- Description: Student database creation script
-- Author: Your Name
-- Date: YYYY-MM-DD

-- Create database
CREATE DATABASE students;

-- Your SQL here
```

### Directory Structure

Keep files organized:

```
bash-scripts/
  ├── module3/
  │   ├── questionnaire.sh
  │   ├── countdown.sh
  │   └── bingo.sh
  └── utilities/
      └── helpers.sh

sql-queries/
  ├── ddl/
  │   └── create_tables.sql
  ├── dml/
  │   └── insert_data.sql
  └── queries/
      └── student_stats.sql
```

## Code Quality

### Bash Scripts
- Start with shebang: `#!/bin/bash`
- Use meaningful variable names
- Add comments for complex logic
- Validate user input
- Handle errors gracefully
- Make scripts executable: `chmod +x script.sh`

```bash
# Good
#!/bin/bash

# Prompt for user name and validate
read -p "Enter your name: " USER_NAME

if [[ -z $USER_NAME ]]; then
  echo "Error: Name cannot be empty"
  exit 1
fi

echo "Hello, $USER_NAME!"
```

### SQL Code
- Use uppercase for SQL keywords
- Indent for readability
- Add comments
- Use meaningful table/column names
- Test queries before committing

```sql
-- Good
SELECT 
  s.name,
  s.gpa,
  c.course_name
FROM students s
INNER JOIN courses c ON s.course_id = c.id
WHERE s.gpa >= 3.5
ORDER BY s.gpa DESC;
```

## Testing Before Committing

### For Bash Scripts
```bash
# Check syntax
bash -n script.sh

# Run script
./script.sh

# Test edge cases
# - Empty input
# - Invalid input
# - Special characters
```

### For SQL Scripts
```bash
# Test in psql
psql -U postgres -d testdb -f script.sql

# Verify results
psql -U postgres -d testdb -c "SELECT * FROM table_name;"
```

## Documentation

### Update Progress

After completing a module:
1. Check it off in README.md
2. Add date in PROGRESS.md
3. Add notes about what you learned
4. Commit changes

### Add Notes

When you learn something important:
1. Create a note in `notes/` directory
2. Use markdown format
3. Include code examples
4. Link to relevant resources

## Best Practices

### Do's ✅
- Commit frequently (at least once per study session)
- Write descriptive commit messages
- Test code before committing
- Keep scripts organized in appropriate directories
- Add comments to explain complex logic
- Update progress tracker regularly
- Push to GitHub regularly (backup!)

### Don'ts ❌
- Don't commit broken code
- Don't commit database credentials
- Don't use vague commit messages
- Don't mix multiple unrelated changes in one commit
- Don't commit large binary files
- Don't forget to test your code

## Environment Variables

Never commit sensitive data! Use environment variables:

```bash
# Create .env file (already in .gitignore)
DB_USER=postgres
DB_PASSWORD=yourpassword
DB_NAME=mydb

# Use in scripts
source .env
PSQL="psql -X --username=$DB_USER --dbname=$DB_NAME"
```

## When You're Stuck

1. **Read error messages carefully** - They usually tell you what's wrong
2. **Check syntax** - Missing semicolon? Typo in command?
3. **Test in isolation** - Run parts of your code separately
4. **Use print/echo statements** - Debug by printing variables
5. **Review documentation** - PostgreSQL docs, Bash guides
6. **Search the forum** - Someone likely had the same issue
7. **Take a break** - Sometimes stepping away helps
8. **Ask for help** - Use freeCodeCamp forum or create an issue

## Useful Git Commands

```bash
# View status
git status

# View commit history
git log
git log --oneline

# View changes
git diff

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Discard changes in file
git checkout -- filename

# View remote repository
git remote -v

# Create new branch
git checkout -b branch-name

# Switch branches
git checkout branch-name

# List branches
git branch

# Delete branch
git branch -d branch-name
```

## Celebrate Progress! 🎉

Remember to celebrate your achievements:
- Completed a module? Update PROGRESS.md
- Finished a project? Take a screenshot
- Learned something new? Add it to your notes
- Earned the certification? Update README.md!

---

**Remember**: This is YOUR learning journey. These guidelines help you build professional habits while staying organized. Adapt them to what works best for you!

Happy coding! 💻
