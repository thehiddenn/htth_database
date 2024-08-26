# Database credentials
$user = "root"
$password = ""
$host = "localhost"
$db_name = "htth"

# Backup destination
$backup_path = "C:\BackupDB"
$backup_file = "$backup_path\db_backup.sql"

# Git repository details
$git_repo = "C:\BackupDB"
$git_branch = "main" # or the branch you want to push to

# Step 1: Export the database
$mysqldump = "mysqldump --user=$user --password=$password --host=$host $db_name > $backup_file"
Invoke-Expression $mysqldump

# Step 2: Move to the Git repository directory
Set-Location -Path $git_repo

# Step 4: Commit the backup file
git add .
git commit -m "Database"

# Step 5: Push the backup to GitHub
git push origin $git_branch