# Database credentials
$user = "root"
$password = ""
$db_host = "localhost"
$db_name = "htth"

# Backup destination
$backup_path = "C:\Users\Administrator\Desktop\server\Backup"
$backup_file = "$backup_path\db_backup.sql"

# Git repository details
$git_repo = "C:\Users\Administrator\Desktop\server\Backup"
$git_branch = "main" # or the branch you want to push to

# Step 1: Export the database
$mysqldump = "mysqldump --user=$user --password=$password --host=$db_host $db_name > $backup_file"
Invoke-Expression $mysqldump

# Step 2: Move to the Git repository directory
Set-Location -Path $git_repo

# Step 4: Commit the backup file
git add .
git commit -m "Database"

# Step 5: Push the backup to GitHub
git push origin $git_branch