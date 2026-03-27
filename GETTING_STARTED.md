# Getting Started with Your Relational Databases Repository

This guide will help you set up and start using your GitHub repository for the freeCodeCamp Relational Databases certification.

## 📥 Download and Extract

1. Download the `freecodecamp-relational-databases-repo.tar.gz` file
2. Extract it:
   - **Windows**: Right-click → Extract All
   - **macOS/Linux**: `tar -xzf freecodecamp-relational-databases-repo.tar.gz`

## 🚀 Quick Start

### Step 1: Set Up Your Environment

Follow the detailed instructions in `SETUP.md` to:
- Install PostgreSQL or set up Docker
- Install VS Code and extensions
- Verify your installation

### Step 2: Initialize Git Repository

```bash
cd freecodecamp-relational-databases-repo
git init
git add .
git commit -m "Initial commit: freeCodeCamp Relational Databases learning repo"
```

### Step 3: Create GitHub Repository

1. Go to [GitHub.com](https://github.com)
2. Click the "+" icon → "New repository"
3. Name it: `freecodecamp-relational-databases`
4. Don't initialize with README (we already have one!)
5. Click "Create repository"

### Step 4: Connect and Push

```bash
git remote add origin https://github.com/YOUR_USERNAME/freecodecamp-relational-databases.git
git branch -M main
git push -u origin main
```

Replace `YOUR_USERNAME` with your actual GitHub username.

## 📚 Repository Structure

```
freecodecamp-relational-databases-repo/
├── bash-scripts/        # Bash programs and scripts
│   ├── example_student_query.sh
│   └── README.md
├── sql-queries/         # SQL scripts and queries
│   ├── ddl/            # Data Definition (CREATE, ALTER, DROP)
│   ├── dml/            # Data Manipulation (INSERT, UPDATE, DELETE)
│   ├── queries/        # SELECT queries
│   └── README.md
├── workshops/          # Guided workshop projects
├── labs/              # Practice exercises
├── projects/          # 5 certification projects
│   ├── celestial-bodies-database/
│   ├── world-cup-database/
│   ├── salon-appointment-scheduler/
│   ├── periodic-table-database/
│   └── number-guessing-game/
├── notes/             # Your study notes
├── resources/         # Quick references and guides
│   ├── SQL_QUICK_REFERENCE.md
│   └── BASH_QUICK_REFERENCE.md
├── README.md          # Main documentation
├── SETUP.md          # Environment setup guide
├── PROGRESS.md       # Track your learning progress
└── CONTRIBUTING.md   # Git workflow guidelines
```

## 📖 Understanding the Course

The freeCodeCamp Relational Databases certification teaches you:

1. **PostgreSQL** - Creating and managing relational databases
2. **SQL** - Querying and manipulating data
3. **Bash Scripting** - Terminal automation and programs
4. **Git** - Version control fundamentals
5. **Linux/Unix** - Command line proficiency

You'll build **5 certification projects**:
- Celestial Bodies Database
- World Cup Database
- Salon Appointment Scheduler
- Periodic Table Database
- Number Guessing Game

## 🎯 Your First Steps

### 1. Test Your Environment

```bash
# Test PostgreSQL
psql -U postgres -c "SELECT version();"

# Test Bash
bash --version

# Test Git
git --version
```

### 2. Try the Example Files

```bash
# Run example SQL (create the database)
psql -U postgres -f sql-queries/ddl/example_create_tables.sql

# Insert sample data
psql -U postgres -f sql-queries/dml/example_insert_data.sql

# Run example queries
psql -U postgres -f sql-queries/queries/example_queries.sql

# Make bash script executable and run it
chmod +x bash-scripts/example_student_query.sh
./bash-scripts/example_student_query.sh
```

### 3. Start Module 1

1. Open the [freeCodeCamp course](https://www.freecodecamp.org/learn/relational-databases-v9/)
2. Begin "Learn Bash by Building a Boilerplate"
3. Save your code in `bash-scripts/` or `workshops/`
4. Commit your progress regularly

## 📝 Recommended Workflow

### Daily Study Routine

1. **Pull latest changes**
   ```bash
   git pull origin main
   ```

2. **Work through the module**
   - Follow freeCodeCamp instructions
   - Write your code in appropriate directories
   - Test everything thoroughly

3. **Save your work**
   ```bash
   # Test your code first!
   
   # Add and commit
   git add .
   git commit -m "Complete Module 2: Mario Database workshop"
   git push origin main
   ```

4. **Update your progress**
   - Check off completed items in README.md
   - Add notes to PROGRESS.md
   - Document key learnings in notes/

### Working on Projects

```bash
# Create a project branch
git checkout -b project-celestial-bodies

# Work on your project
# ... code, test, debug ...

# Commit regularly
git add projects/celestial-bodies-database/
git commit -m "Add planets and moons tables"

# Push to GitHub
git push origin project-celestial-bodies

# When complete, merge to main
git checkout main
git merge project-celestial-bodies
git push origin main
```

## 💡 Using the Resources

### Quick References
- `resources/SQL_QUICK_REFERENCE.md` - Complete SQL syntax guide
- `resources/BASH_QUICK_REFERENCE.md` - Bash scripting patterns

Keep these open while coding!

### Progress Tracking
- `PROGRESS.md` - Weekly study log and skill tracker
- Update after each study session
- Track challenges and solutions

### Learning Tips
1. **Practice SQL daily** - Even 15 minutes helps
2. **Commit often** - At least once per study session
3. **Comment your code** - Future you will thank you
4. **Test thoroughly** - Before committing
5. **Review regularly** - Go back to previous modules
6. **Use the forum** - Don't hesitate to ask questions

## 🔧 Common Commands

### PostgreSQL
```bash
# Connect to database
psql -U postgres -d database_name

# Run SQL file
psql -U postgres -f script.sql

# Inside psql
\l              # List databases
\c dbname       # Connect to database
\dt             # List tables
\d tablename    # Describe table
\q              # Quit
```

### Bash
```bash
# Make script executable
chmod +x script.sh

# Run script
./script.sh
bash script.sh

# Check syntax
bash -n script.sh
```

### Git
```bash
# Check status
git status

# View history
git log --oneline

# View changes
git diff
```

## 📞 Getting Help

- **Course Issues**: [freeCodeCamp Forum](https://forum.freecodecamp.org/)
- **PostgreSQL**: [PostgreSQL Docs](https://www.postgresql.org/docs/)
- **Bash**: [Bash Guide](https://mywiki.wooledge.org/BashGuide)
- **Git**: [Git Documentation](https://git-scm.com/doc)

## ✅ Setup Checklist

Before starting the course:

- [ ] PostgreSQL installed and working
- [ ] Git installed
- [ ] VS Code set up (if using Docker)
- [ ] Repository initialized on local machine
- [ ] GitHub repository created
- [ ] First commit pushed to GitHub
- [ ] Example files tested successfully
- [ ] README.md updated with your information
- [ ] Ready to start Module 1!

## 🎓 Remember

This repository is **your** learning journey. The structure is a guide - adapt it as needed!

- Be consistent with your study schedule
- Commit your work regularly
- Take notes in your own words
- Test your code thoroughly
- Don't hesitate to ask for help
- Celebrate your progress!

---

**Ready to begin?** Open SETUP.md, complete your environment setup, then dive into Module 1!

Good luck on your Relational Databases certification journey! 🚀💾
