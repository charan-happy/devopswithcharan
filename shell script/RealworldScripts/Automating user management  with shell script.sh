#!/bin/bash
# Define variables
ACTION="$1" # First argument: create, modify, or delete
USERNAME="$2" # Second argument: username
# Function to create a new user
create_user() {
 if [ -z "$USERNAME" ]; then
 echo "Usage: $0 create <username>"
 exit 1
 fi
 useradd -m -s /bin/bash "$USERNAME"
 echo "User $USERNAME created."
}
# Function to modify an existing user
modify_user() {
 if [ -z "$USERNAME" ]; then
 echo "Usage: $0 modify <username>"
 exit 1
 fi
 usermod -s /bin/bash "$USERNAME"
 echo "User $USERNAME modified."
}
# Function to delete an existing user
delete_user() {
 if [ -z "$USERNAME" ]; then
 echo "Usage: $0 delete <username>"
 exit 1
 fi
 userdel -r "$USERNAME"
 echo "User $USERNAME deleted."
}
# Main script
case "$ACTION" in
 create)
 create_user
 ;;
 modify)
 modify_user
 ;;
 delete)
 delete_user
 ;;
 *)
 echo "Usage: $0 {create|modify|delete} <username>"
 exit 1
 ;;
esac

