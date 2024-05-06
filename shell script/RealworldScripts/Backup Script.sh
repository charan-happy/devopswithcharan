# Shell script that you can use to backup a directory using the tar command:

#!/bin/bash
# Source directory to backup
source_dir="/path/to/source/directory"
# Backup destination directory
backup_dir="/path/to/backup/directory"
# Backup filename with date
backup_filename="backup_$(date +%Y%m%d%H%M%S).tar.gz"
# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"
# Create the backup using tar
tar -czvf "$backup_dir/$backup_filename" "$source_dir"
# Check if the backup was successful
if [ $? -eq 0 ]; then
 echo "Backup successful: $backup_filename created in $backup_dir"
else
 echo "Backup failed"
fi


Make sure to replace /path/to/source/directory with the actual path of the directory you 
want to backup and /path/to/backup/directory with the desired backup destination. You can 
save this script to a file (e.g., backup_script.sh), give it execute permissions (chmod +x 
backup_script.sh), and then run it using ./backup_script.sh.
This script creates a compressed tar archive of the source directory and saves it in the backup 
directory with a filename that includes the current date and time. After the backup is created, it 
provides feedback on whether the backup was successful or not.
