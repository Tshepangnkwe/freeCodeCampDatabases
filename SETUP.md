# Setup Guide - Relational Databases Certification

This guide will help you set up your development environment for the freeCodeCamp Relational Databases certification.

## Prerequisites

- **Docker Desktop** (recommended) OR native PostgreSQL installation
- **VS Code** (Visual Studio Code)
- **Git**
- **Terminal** access (Bash, Zsh, or Git Bash on Windows)

## Option 1: Docker Setup (Recommended)

Docker provides a consistent development environment and is the recommended approach.

### 1. Install Docker Desktop

**Windows/Mac:**
- Download from [docker.com](https://www.docker.com/products/docker-desktop)
- Run installer and follow prompts
- Restart your computer

**Linux:**
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install docker.io docker-compose
sudo systemctl start docker
sudo systemctl enable docker
```

### 2. Install VS Code Extensions

Open VS Code and install:
- **Dev Containers** (ms-vscode-remote.remote-containers)
- **CodeRoad** (freeCodeCamp.freecodecamp-courses)
- **PostgreSQL** (ms-ossdata.vscode-postgresql) - optional but helpful

### 3. Pull the freeCodeCamp Container

```bash
docker pull ghcr.io/freecodecamp/courses/relational-database:latest
```

### 4. Run the Container

```bash
docker run -it --rm \
  -v ~/freecodecamp:/workspace \
  -p 5432:5432 \
  ghcr.io/freecodecamp/courses/relational-database:latest
```

### 5. Connect VS Code

1. Open VS Code
2. Click the green button in the bottom-left corner
3. Select "Attach to Running Container"
4. Choose the freeCodeCamp container

## Option 2: Native PostgreSQL Installation

### Windows

1. Download PostgreSQL from [postgresql.org](https://www.postgresql.org/download/windows/)
2. Run the installer (choose version 14 or later)
3. Set a password for the postgres user (remember this!)
4. Install pgAdmin (included with installer)
5. Add PostgreSQL to PATH:
   ```
   C:\Program Files\PostgreSQL\14\bin
   ```

6. Install Git Bash from [git-scm.com](https://git-scm.com/)

### macOS

```bash
# Using Homebrew
brew install postgresql@14
brew services start postgresql@14

# Verify installation
psql --version
```

### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install postgresql postgresql-contrib

# Start PostgreSQL
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Verify installation
psql --version
```

## Verify Installation

### Test PostgreSQL

```bash
# Connect to PostgreSQL
psql -U postgres

# You should see the PostgreSQL prompt:
# postgres=#

# Try a simple query
SELECT version();

# Exit
\q
```

### Test Bash

```bash
# Check Bash version
bash --version

# Should show version 4.0 or later
```

## Create Your Working Database

```bash
# Connect to PostgreSQL
psql -U postgres

# Create a database for practice
CREATE DATABASE fcc_learn;

# List databases
\l

# Connect to your database
\c fcc_learn

# Create a test table
CREATE TABLE test (id INT, name VARCHAR(50));

# Insert data
INSERT INTO test VALUES (1, 'Hello World');

# Query data
SELECT * FROM test;

# Exit
\q
```

## Clone This Repository

```bash
# Navigate to your projects folder
cd ~/projects

# Clone the repository
git clone https://github.com/YOUR_USERNAME/freecodecamp-relational-databases.git
cd freecodecamp-relational-databases
```

## Useful PostgreSQL Commands

### Database Operations
```sql
\l              -- List all databases
\c dbname       -- Connect to a database
\dt             -- List tables in current database
\d tablename    -- Describe a table
\q              -- Quit psql
```

### Running SQL Files
```bash
# Execute a SQL file
psql -U postgres -d database_name -f script.sql

# Execute and see output
psql -U postgres -d database_name -f script.sql -o output.txt
```

## Running Bash Scripts

```bash
# Make script executable
chmod +x script.sh

# Run the script
./script.sh

# Or use bash directly
bash script.sh
```

## Troubleshooting

### PostgreSQL won't start
```bash
# Check if PostgreSQL is running
sudo systemctl status postgresql

# Start if stopped
sudo systemctl start postgresql
```

### Permission denied on scripts
```bash
# Make executable
chmod +x your-script.sh
```

### Can't connect to database
```bash
# Check if PostgreSQL is listening
sudo netstat -plnt | grep 5432

# Check pg_hba.conf for authentication settings
# Location: /etc/postgresql/14/main/pg_hba.conf (Linux)
```

### CodeRoad not working
1. Ensure you're in the container/correct environment
2. Reload VS Code window (Ctrl+Shift+P → "Reload Window")
3. Check CodeRoad extension is enabled

## Environment Variables (Optional)

Create a `.env` file for database credentials:

```bash
DB_USER=postgres
DB_PASSWORD=your_password
DB_HOST=localhost
DB_PORT=5432
DB_NAME=fcc_learn
```

**Note:** Add `.env` to `.gitignore` to avoid committing passwords!

## Next Steps

1. Complete the setup verification
2. Start with Module 1: Learn Bash by Building a Boilerplate
3. Follow the course on [freeCodeCamp](https://www.freecodecamp.org/learn/relational-databases-v9/)
4. Save your code in this repository as you progress

## Resources

- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
- [Docker Documentation](https://docs.docker.com/)
- [Bash Guide](https://mywiki.wooledge.org/BashGuide)
- [freeCodeCamp Forum](https://forum.freecodecamp.org/)

---

Need help? Visit the [freeCodeCamp forum](https://forum.freecodecamp.org/) or create an issue in this repository!
