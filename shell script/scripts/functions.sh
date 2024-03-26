# function is  a block of code which can be reused

function_Name(){
    //body
    echo "welcome to the world of shell scripting"
}

function_Name

sum(){
    a=2
    b=3
    c=$(($a+$b))\
    echo "The sum of two numbers is : " $c
}

sum

# parameterised function
sum(){
    a=$1
    b=$2
    c=$(($a+$b))
    echo "The sum of two numbers is : " $c
}

sum 2 4

# return demo

sum(){
    a=$1
    b=$2
    c=$(($a+$b))
    echo "the sum of the value is: " $c
}

sub(){
    a=$2
    b=$3
    c=$(($a-$b))
    return $c
}
sum 4 6

sub 19 4

ret=$?

echo "the subtraction value of" $a "and" $b "is: " $ret 

# note: the function called just before the "ret" variable that value is printed in the ret value.


# Nested functions

#!/bin/bash

# nested is nothing but something inside something

demo(){
    echo "this is the demo function"
    demo2
}
demo2(){
    echo "this is the demo2 function"
}
demo

(or)

demo(){
    echo "This is the demo function"
    demo2(){
        echo "This is demo2 function"
    }
    demo2
}

demo


# Scipt for demonstration of parameterised functions

sum(){
    echo "the sum of $1 and $2 is: " $(($1+$2))
    sub(){
      echo " the difference of $1 and $2 is " $(($1-$2))  
    }
    sub 5 8
}

sum 12 50


# local variables and global variables

#!/bin/bash

local variables: the variables which are declared inside a function is called local variables
global varriables : the variables which are declared outside the function is called global variables

function1(){
    a=10; #local variable
    echo $a
}

echo $a

function1

# global variable demo
b=50
function2(){
echo "hey i am function body"
a=13
echo $a
echo $b
}

echo $b

function2

# userdeletion script

#!/bin/bash

workflow: 

echo "enter the username: "
read username:
echo "Enter your password"

read systempassword

deluser(){
    echo $systempassword | sudo -S deluser $username
}

deluser #calling deluser function


#script to check integrity 

