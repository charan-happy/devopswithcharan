#!/bin/bash
# Specify the file path
FILE_PATH="/path/to/your/file.txt"
# Check if the file exists
if [ -f "$FILE_PATH" ]; then
 echo "The file $FILE_PATH exists."
else
 echo "The file $FILE_PATH does not exist."
fi
