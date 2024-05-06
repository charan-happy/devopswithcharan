Write a shell script to fetch the data from rest api and take out the required fields

write a shell script to extract the number of alphabets characters and digits and tell the count

write a shell script to extract the IP address from a file and count of simmilar ipaddress

write a shell script to hit the rest api and modify the json data and put it back to the database

How to declare an array in shell script

What is crontab and tell some time set you have done

why do we give #!/bin/sh at start of the shell script

write a shell script to find old logs and archive it

what is $#, $?,$@ etc... in linux shell script

interview Questions
  topic: Shell Scripting
  Questions:
  - Ques: Explain the significance of the $? variable in shell scripting.
    Ans:
    - The $? variable in shell scripting holds the exit status of the last  command. After a command runs in a shell script, its exit status tell us whether it completed successfully or error.
    - If success we get 0 otherwise non zero.
  - Ques: write a shell script that monitors the CPU usage of a specific process. If the CPU usage exceeds a certain threshold, the script should terminate the process. How would you implement this?
    Ans:
    - https://github.com/orgs/daws-76s/discussions/9

  - Ques: Delete or Archive old log files through shell script
    Ans:
    - https://github.com/orgs/daws-76s/discussions/8

  - Ques: You need to find and replace a specific string in multiple text files in a directory. How would you use shell script accomplish this task?
    Ans:
    - https://github.com/orgs/daws-76s/discussions/10
  
  - Ques: You accidentally opened a large file in Vim, and it's slowing down your system. How would you quit Vim without saving any changes?
    Ans: :q!

  - Ques: How can you determine if a linux server is virtualized or bare-metal?
    Ans: lscpu

  - Ques: Explain special variables in Shell
    Ans:
    - $0. Scriptname
    - $1, $2, $N. Args passed to shell script
    - $?. Exit status of previous command
    - $#. No of args passed
    - $@. All args passed
    - $$. PID of the current script. We can use this PID to monitor it, resources used, etc.
    - $!. PID of the last background process. https://stackoverflow.com/questions/18462916/does-mean-something-in-shell-scripting

  - Ques: Counting words through shell script
    Ans:
    - https://github.com/orgs/daws-76s/discussions/5

  - Ques: What is crontab? where it store log files?
    Ans:
    - Crontab is a scheduler in Unix-like operating systems. It allows users to schedule commands or scripts to run periodically at fixed intervals, specified by the user. These scheduled jobs are referred to as cron jobs.
    - It usually stores logs in /var/log/cron file.
    - It have * * * * * to specify minute, hour, day(month), month, day(week)

  - Ques: What is zombie process in Linux
    Ans:
    - https://www.tutorialspoint.com/what-is-zombie-process-in-linux
    - If a child process is unable to report its completion status to parent process then it will remain available in system by keeping the PID. It is called as zombie process.

  - Ques: https://github.com/orgs/daws-76s/discussions/7 Convert rows in columns and columns into rows.

    what is shell script ?

    How do you comment in shell script ?

    what is shebang (#!) used for in shell script ?

    How do you pass arguments to a shell script ?

    what is difference between $@ and $* in shell scripting ?

    explain the use of if-else statement in shell scripting ?

    what is for loop in shell scripting ?

    How do you read user input in shell script ?

    Explain the purpose of case in shell scripting ?

    How do you check if a file exists in shell script ?

    Explain how to redirect output in a shell script ?

    what is a function in shell scripting ?

    How do you use grep in shell script ?

    Explain the purpose of awk command in shell scripting ?

    How do you handle errors in shell script ?

    what is the purpose of sed command in shell scripting ?

    How do you declare and use variables in shell scripting ?

    Explain the difference between && and || in shell scripting ?

    what is the purpose of export command in shell scripting ?
    
  
