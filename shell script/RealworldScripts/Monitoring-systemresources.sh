#!/bin/bash
while true; do
 clear # Clear the terminal
 echo "System Resource Monitoring"
 echo "--------------------------"
 # Display CPU usage
 echo "CPU Usage:"
 top -n 1 -b | grep "Cpu"
 # Display memory usage
 echo -e "\nMemory Usage:"
 free -h
 # Display disk space usage
 echo -e "\nDisk Space Usage:"
 df -h
 sleep 5 # Wait for 5 seconds before the next update
done


#shell script to monitor system resources such as CPU usage, memory usage, disk space, and 
#more. The script can use built-in Unix commands like top, free, df, and others to gather 
 #information about system resources. Above is an example of a simple shell script to monitor system resources:
 
