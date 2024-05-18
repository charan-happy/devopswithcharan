# Shell Scripting

****************Syllabus****************

Introduction
Variables
Passing Arguments to the Script
Arrays
Basic Operators
Basic String Operations
Decision Making
Loops
Array-Comparison
Shell Functions
Special Variables
Bash trap command
File Testing
Input Parameter Parsing
Pipelines
Process Substitution
Regular Expressions
Special Commands sed,awk,grep,sort

## Learning Resources for free

[Linux Shell Scripting Tutorial web](https://bash.cyberciti.biz/guide/Main_Page)

[Interactive shell script learning](https://www.learnshell.org/)

[Bash cheatsheet](https://devhints.io/bash)

### Introduction

### What is Bash?

Bash is a name of the unix shell, which was also distributed as the shell for the GNU operating system and as the default shell on most Linux distros

- **what does it do?**

At first sight Bash appears to be a simple command/response system, where users enter commands and bash returns the results after those commands are run.

Bash is also a programming platform and users are enabled to write programs that accept input and produce output using shell commands in shell scripts.

- Shell programming can be accomplished by directly executing shell commands at the shell prompt or by storing them in the order of execution, in a text file, called a shell script, and then executing the shell script. To execute, simply write the shell script file name, once the file has execute permission (chmod +x filename).
- The first line of the shell script file begins with a "sha-bang" (#!) which is not read as a comment, followed by the full path where the shell interpreter is located. This path, tells the operating system that this file is a set of commands to be fed into the interpreter indicated.
- It is common to name the shell script with the “.sh” extension.

The first line may look like this:

**********************#!/bin/bash**********************

- Any text following the “#” is considered a comment.

ps | grep $$ —> To check the active shell, and path

which bash —> To see the full path of the shell interpreter

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7c146a63-a01e-489e-b242-da037b271e03/Untitled.png)

let’s write our hello world script .
#!/bin/bash
echo 'Hello world!' # Hello world!

```bash
#!/bin/bash
echo 'Hello, world' #Hello, world
```

**************************shell types :**************************

just like how we have different programming languages, our UNIX system will also offer a variety of shell types :

- **********sh**********  or ************Bourne shell************
- **********bash********** or Bourne Again shell
    - It is the standard shell for common users. This shell is so called ************************************************superset of bourneshell.************************************************
    - All commands work in sh will work in bash but reverse doesn’t.
- **********c or csh**********
- tcsh or TENEX  C
- ksh or Korn shell

- A shell script is a reusable series of commands put in an executable text file. Any text editor can be used to write scripts

To get overview of known shells in linux system :

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/122d4e82-2237-4f8b-bede-2b13996d3164/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bbb23ab3-8614-4491-9692-fbaa11ea3840/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9d71e7de-127d-4995-bc64-e6ba3891b741/Untitled.png)

- shell commands can be split up in three groups.
    - **************************************The shell functions**************************************
    - ******************************shell built-ins******************************
    - ****************Existing commands in a directory on your system.****************

Variables

- A variable is  a container which stores some values.
- Shell variables are created once they are assigned a value. A variable can contain a number, a character or a string of characters.
- A variable name is case sensitive and can consists of a combination of letters and the underscore “_”.
- Value assignment can be done using “=” sign.
- variables can be divided into 2 types.
- 1. Global Variables [env or printenv]
- 2. Local Variables [set]

Depends upon the sort of content the variable contains, we divide them into 4 types.

1. String Variables
2. Integer Variables
3. Constant Variables
4. Array Variables

To set variable in shell, we use **********************************VARNAME=”value”**********************************

**************NOTE :************** No space is permitted on either side of = sign when initializing variables.

 

```bash
#!/bin/bash
MyFirstLearnedLetters=ABC
Greeting='hello   world!'
```

- a Backslash “\” is used to escape special character meaning

```bash
charan ~> date=20021226

charan ~> echo $date
20021226

charan ~> echo \$date
$date
```

- Encapsulating the variable name with ${} is used to avoid ambiguity
- Encapsulating the variable name with “” will preserve any white space values.
- variables can be assigned with the value of a command output. this is referred to as substitution. Substitution can be done by encapsulating the command ``(known as back-tick) or with $().

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4ab0d570-65e5-43c6-b764-d5113f8e4494/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5a8c55b8-61d3-4ba3-9a4f-f9f84339fd88/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a78d7b26-0304-4335-80b6-8e905cb50014/Untitled.png)

************Exporting Variables :************

- A variable created is default stored in the current shell. **it is local variable.**
- Child process of the current shell will not be aware of this variable. In order to pass variables to a subshell, we need to *****export*****  them using **************export************** built-in command.
- variables that are exported are referred to as **environmental variable.** This can be done by follow

************************************************export VARNAME=”value”************************************************

```bash
grep dictionary /usr/share/dict/words
echo $_
echo $$
mozilla &
echo $1
echo $0
echo $?
ls doesnotexist
echo $?

output :
grep: /usr/share/dict/words: No such file or directory
/usr/share/dict/words
1123

specialparameters.sh
0
ls: cannot access 'doesnotexist': No such file or directory
2
```

******************************single quotes ;******************************

- single quotes are used to preserve the literal value of each character enclosed within the quotes.
- A single quote may not occur between single quotes, even when preceded by a backslash.

```bash
charan ~> echo '$date'
$date
```

******************************Double quotes :******************************

- using double quotes the literal value of all characters enclosed is preserved, except for the dollar sign, the backticks (backward single quotes, ``) and the backslash.
- The dollar sign and the backticks retain their special meaning within the double quotes

```bash
charan ~> echo "$date"
echo "`date`"
Fri Aug 25 17:04:08 UTC 2023
date
Fri Aug 25 17:04:01 UTC 2023
echo "\\"
\
```

******************************************************syntax highlighting in vim:******************************************************

- In order to activate syntax highlight in **********vim,********** use the command
    
    :**************************syntax enable or :sy enable or :syn enable************************** 
    
    enable above settings in .”vimrc” file to make it permanent.
    

**********************************************parameter expansion :********************************************** It’s just another way of printing a variable

This prints the value of the variable, but what's special is you can change the variable before *or* after you print it. Here's what you can do.

- String Substitution
- A specific length of a variable printed
- Gets the length of a string
- Indirect expansion

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6ddd157c-96c9-4a53-8868-abda187a1e80/Untitled.png)

********************************************string substitution :******************************************** string substitution takes the value of previously declared variable and changes it.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/668a9975-dd3d-4adf-a79d-c0f641fdf16a/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ae9846fd-69f3-4ba9-80f8-b8c27f52b23f/Untitled.png)

******************************string length :******************************

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/35d7ff82-fb51-49de-a966-bcb75f031808/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c428b476-5afc-4177-a5af-41673300cdd6/Untitled.png)

**********************************Brace Expansion :**********************************

Brace expansion is used to generate arbitrary strings that outputs the range from the start value to the end value.

- Arbitrary Strings Definition: The Arbitrary Text Type of semantic type is one of the Text Format Types. This type consists of an arbitrary text string of any length provided by the user. (Google)

In Bash, you can do arbitrary strings with numbers or letters (uppercase and lowercase)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/21154a43-0a9b-4e75-834f-c0eea732ded1/Untitled.png)

**********************let’s Read**********************

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ec5955f3-d1fb-4351-9bf4-b24c38153f97/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/cf045b5d-0b00-44d9-a838-4f76e44900e1/Untitled.png)

```bash
# the following construct allows for creation of the named variable if it does not yet exist.
${VAR:=value}
Example :
echo $charan
echo ${charan:=Cherry}
Cherry

-> command substitution allows the output of a command to replace the command itself. Command substitution occurs when a command is enclosed like this:
$(command) or `command`
```

**********************Debugging :**********************

- Most of the shell supports debugging .Debugging in shell can be done via below ways.

| Short Notation | Long Notation | Result |
| --- | --- | --- |
| set -f | set -o noglob | Disable file name generation using meta characters (globbing) |
| set -v | set -o verbose | Prints shell input lines as they are read |
| set -x  | set -o xtrace | Print command traces before executing command |

******************************************Arithmetic expansion :******************************************

- Arithmetic expansion allows the evaluation of an arithmetic expression and the substitution of the result. The format of the arithmetic expansion is :

**$((EXPRESSION))**

************************Arithmetic Operators************************

| Operator | Meaning |
| --- | --- |
| VAR++ and VAR- - | Variable post-increment and post-decrement |
| ++VAR and - - VAR | Variable pre-increment and pre-decrement |
| - and + | unary minus and plus |
| ! and ~ | logical and bitwise negation |
| ** | exponentiation |
| *,/and % | multiplication,division, remainder |
| + and - | addition, substraction |
| << and >> | left and right bitwise shift |
| == and ! = | equality and inequality |
| & | bitwise AND |
| ^ | bitwise exclusive OR |
| | | bitwise OR |
| && | logical AND |
| || | logical OR |
| expr ? expr:expr | conditional evaluation |
| =,*=,/=,%=,+=,-=,<< =,> > =, &=, ^= and |= | assignments |
| , | separator between expressions |

******************Aliases , what are they ?******************

- An alias allows a string to be substituted for a word when it is used as the first word of a simple command.
- the shell maintains a list of aliases that may be set and unset with the ************************************alias and unalias************************************ built-in commands.

```bash
alias # To display a list of aliases known to the current shell
alias dh=`df -h` # To create alias
unalias dh # To remove alias

```

Note : Aliases are looked up after functions and thus resolving is slower. While aliases are easier to understand. shell functions are preferred over aliases for almost every purpose.
Passing Arguments to the Script
Arrays
Basic Operators
Basic String Operations
Decision Making
Loops
Array-Comparison
Shell Functions
Special Variables
Bash trap command
File Testing
Input Parameter Parsing
Pipelines
Process Substitution
Regular Expressions

- A regular expression is a pattern that describes a set of strings. Regular expressions are constructed analogously to arithmetic expressions by using various operators to combine smaller expressions.

**************************************************************Regular expression metacharacters**************************************************************

| Operator | Effect |
| --- | --- |
| . | Matches any single character |
| ? | The preceding item is optional and will be matched, at most, once |
| * | The preceding item will be matched zero or more times |
| + | The preceding item will be matched one or more times |
| {N} | The preceding item is matched exactly N times |
| {N,} | The preceding item is matched N or more times |
| {N,M} | The preceding item is matched at least N times, but not more than M times |
| - | represents the range of it’s not first or last in a list or ending point of a range in a list |
| ^ | Matches the empty string at the begining of a line; also represents the characters not in the range of list |
| $ | Matches the empty string at the end of line |
| \b | Matches the empty string  at the edge of a word |
| \B | Matches the empty string provided it’s not at the edge of a word |
| \< | Match the empty string at the begining of word |
| \> | Match the empty string at the end of word |

Repetition takes precedence over concatenation, which in turn takes precedence over alternation. A whole subexpression may be enclosed in parentheses to override these precedence rules.

************grep************ searches the input files for lines containing a match to a given pattern list. when it finds a match in a line, it copies the line to standard output (by default)

```bash
grep root /etc/passwd
grep ^root /etc/passwd #lines starting with the string "root"
grep :$ /etc/passwd # searching for lines ending with ":"
grep export ~/.bashrc | grep `\<PATH`
grep [y.f] /etc/group #All the lines containing either "y" or "f" character are displayed
grep `\<c...h\>` /usr/share/dict/words # To get a list of all five character english dictionary words starting with "c" and ending in "h"

```

Special Commands sed,awk,grep,sort

interviewer: write a shell script to count the string "r" in the word "terraform".

Ans:

#!/bin/bash

input="terraform"

char="r"

count=$(echo "$input" | grep -o "$char" | wc -l)

echo "The letter '$char' appears $count times in '$input'."

Write a shell command to change all values ( from dev to qa ) in a file.

command: sed -i 's/dev/qa/g' file.txt

Interviewer: Write a shell script to monitor docker containers. if the containers exits, it has to run automatically

Ans:

#!/bin/bash

CONTAINER_NAME="your-container-name"

while true; do

if ! docker inspect -f '{{.State.Running}}' "$CONTAINER_NAME" > /dev/null; then

echo "Container $CONTAINER_NAME is not running. Restarting..."

docker restart "$CONTAINER_NAME"

fi

sleep 10

done

an example of mystem.sh

```bash
!/bin/bash
clear
echo "This is information provided by mysystem.sh. Program starts now."

echo "Hello, $USER"

echo

echo "Today's date is `date`,this is week `date + "%V"` ."
echo

echo "These users are currently connected."
w | cut -d " " -f 1 - | grep -v USER | sort -u
echo

echo "This is `uname -s` running on a `uname -m` processor."
echo

echo "This is the uptime information."
uptime
echo

echo "That's all folks!"
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/534e030d-4188-4186-8e3f-6ef5bfc86ae1/Untitled.png)

****************Projects****************

1. Write a shell script function to find and kill all the zombie processes.
2. Find the first 10 biggest files in the file system and write the output to a file.
3. Shell script to gracefully unmount a disk.
4. shell script to send email
5. Shell script to monitor CPU, Memory, and Disk usage and send the output to a file in table format and send an alert if either of them exceeds a certain threshold.
6. Shell script to find the files created and their sizes. It should accept the number of days as input. Or a from and to date format as inputs.
7. Write a shell script to automate the process of creating new user accounts on a Linux server and setting up their permissions and SSH access.
8. Write a shell script to the list of users logged in by date and write it to an output file.
9. Shell script to Copy files recursively to remote hosts
10. Shell script that displays the number of failed login attempts by IP address and location.
11. Shell script parses a log file and forwards a specific value with a timestamp to an output file.
12. Write a shell script to automate the process of rotating log files and compressing old files to save disk space.
13. Write a shell script to check the status of a list of URLs and send an email notification if any of them are down.
14. Write a shell script to automate the process of updating a list of servers with the latest security patches.
