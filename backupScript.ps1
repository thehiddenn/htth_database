# Database credentials
$user = "root"
$password = ""
$db_host = "localhost"
$db_name = "htth"

# Backup destination
$backup_path = "C:\Users\Administrator\Desktop\server\Backup"
$backup_file = "$backup_path\db_backup"
$backup_zip = "$backup_path\db_htth.sql.gz"

# Git repository details
$git_repo = "C:\Users\Administrator\Desktop\server\Backup"

# Step 1: Export the database 
$mysqldump = "mysqldump --default-character-set=utf8mb4 --user=$user --password=$password --host=$db_host $db_name > $backup_file"
# $mysqldump = "mysqldump --default-character-set=utf8mb4 --skip-comments --user=$user --password=$password --host=$db_host $db_name | 7z > $backup_zip"
# $mysqldump = "mysqldump --default-character-set=utf8mb4 --user=$user --password=$password --host=$db_host $db_name | tar > $backup_zip"
Invoke-Expression $mysqldump

# Step 2: Move to the Git repository directory
Set-Location -Path $git_repo

# Step 4: Commit the backup file
git add .
git commit -m "Database"

# Step 5: Push the backup to GitHub
git push origin main