Objective 1: System Health Monitoring Script
Bash Script (system_health.sh):

```bash
#!/bin/bash

# Define thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" |bc -l) )); then
  echo "CPU usage is above threshold: $CPU_USAGE%" >> /var/log/system_health.log
fi

# Check memory usage
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" |bc -l) )); then
  echo "Memory usage is above threshold: $MEM_USAGE%" >> /var/log/system_health.log
fi

# Check disk usage
DISK_USAGE=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
  echo "Disk usage is above threshold: $DISK_USAGE%" >> /var/log/system_health.log
fi

# Check running processes
RUNNING_PROCESSES=$(ps aux | wc -l)
echo "Running processes: $RUNNING_PROCESSES" >> /var/log/system_health.log
```
Objective 2: Automated Backup Solution

Python Script (backup_script.py):

```python
import os
import subprocess
from datetime import datetime

# Configuration
BACKUP_SRC = '/path/to/source'
BACKUP_DEST = '/path/to/destination'
LOG_FILE = '/var/log/backup.log'

def log_message(message):
    with open(LOG_FILE, 'a') as log_file:
        log_file.write(f'{datetime.now()}: {message}\n')

def run_backup():
    try:
        result = subprocess.run(['rsync', '-av', BACKUP_SRC, BACKUP_DEST], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        log_message(f'Backup successful: {result.stdout}')
    except subprocess.CalledProcessError as e:
        log_message(f'Backup failed: {e.stderr}')

if __name__ == "__main__":
    run_backup()
```
These solutions cover the required tasks, from containerizing and deploying an application to Kubernetes with CI/CD and TLS, to developing useful system scripts in Bash and Python.





