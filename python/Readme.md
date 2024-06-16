
# content

[Shell vs Python](#shell-vs-python)
[Data Types](#data-types)
[regex](#regex)
[Keywords and Variables]()


## shell vs python

|python | shell |
|---|---|
|python is a highly effecient programming language used for general purpose programming| Shell/bash is not a programming language but a command interpreter|
|it is typically designed for web and app development| It is the default user shell on every linux distributions and macos|
|It is an easy-to-learn scripting language based on object oriented programming| It doesnot support OOp and it only supports text|
|Python is more efficient and known for its consistency and readability| It doesnot deal with frameworks and is less intuitive than python|

when to use shell ?🤔

**1. System Administration Tasks:** Shell Scripting is good for automating routine system administration tasks like managing files, directories, and processes. You can use shell scripts for tasks like starting/stopping services, managing users, and basic file manipulation

**2. Command line interactions:** If your task primarily involving  command line tools and utilities, shell scripting can be more efficient. It's easy to call and control these utilities from a shell script.

**3. Rapid Prototyping:** If you need to quickly prototype a solution or perform one-off tasks, shell scripting is usually faster to write and execute. It's great for ad-hoc tasks

**4. Text Processing:** Shell scripting is well-suited for tasks that involve text manipulation, such as parsing log files, searching and replacing text, or extracting data from text-based sources.

**5. Environment Variables and configuration:** Shell scripts are useful for managing environment variables and configuring your system.

when to use python ?🤔

**1. Complex Logic:** Python is a full-fledged programming language and is well-suited for tasks that involve complex logic, data structures, and algorithms. If your task requires extensive data manipulation, Python can be a more powerful choice.


**2.Cross-Platform Compatibility:** Python is more platform-independent than shell scripting, making it a better choice for tasks that need to run on different operating systems. 

**3. API Integration:** Python has extensive libraries and modules for interacting with APIs, databases, and web services. If your task involves working with APIs, Python may be a better choice.

**4. Reusable Code:** If you plan to reuse your code or build larger applications, Python's structure and modularity make it easier to manage and maintain.

**5. Error-Handling:** Python provides better error handling and debugging capabilities, which can be valuable in DevOps where reliability is crucial.

**6. Advance Data Processing:** If your task involves advanced data processing, data analysis, or machine learning, Python's rich ecosystem of libraries (e.g., Pandas, NumPy, SciPy) makes it a more suitable choice.

## Data types

[Top](#content)

- In programming, A data type is a classification that specifies which type of value a variable can hold. Data types are essential because they determine how data is stored in memory and what operations can be performed on that data. Python, like many programming languages, supports several built-in datatypes. Here are some of the common data types in python.

1. Numeric Data Types:
 * `Int` represents integers (whole numbers) ex: `x=5`
 * `float` represents floating point numbers (numbers with decimal points) ex: `y=3.14`
 * `complex` represents complex numbers: ex: `z=2+3j`

2. Sequence Types:
 * `str` represents strings (sequence of characters) Ex: `text="hello, world"`
 * `list` represents lists (ordered, mutable sequences) Ex: `my_list=[1,2,3]`
 * `tuple` represents tuples (orders, immutable sequences) Ex: `my_tuple=(1,2,4)`

3. Mapping Types:
  * `dict` Represents dictionaries (key-value pairs) ex: `my_dict={'name': 'john', 'age':30}`

4. Set Types:
  * `set` Represents sets (unordered collection of unique elements) ex: `my_set={1,2,3}`
  * `fronzenset` Represents immutable sets. Ex: `my_frozenset=fronzenset([1,2,3])`

5. Boolean Type:
  * `bool` Represents boolean values (`True` or `False`) ex: `is_valid = True`

6. Binary Types:
 * `bytes` Represents immutable sequences of bytes. ex: `data=b'Hello'`
   `bytearray` Represents mutable sequences of bytes. ex: `data=bytearray(b'Hello')`

7. None Type:
 * `NoneType` Represents the `None` object, which is used to indicate the absense of a value or a null value

8. Custom Data Types:
 * you can also define your custom data type using classes and objects

## strings

[top](#content)

1. String Data Type in Python:

 - In Python, a string is a sequence of characters, enclosed within single (' '), double(" "), or triple(''' ''' or """ """) quotes
 - Strings are immutable, meaning you cannot change the characters within a string directly. Instead you create new strings
 - you can access individual characters in a string using indexing ex: `my_string[0]` will give you the first character.
 - Strings support various built-in methods. such as `len()`, `upper()`, `lower()`, `strip()`, `replace()` and more for manipulation

2. string manipulation and formatting
 - concatenation: you can combine strings using `+` operator
 - substrings: Use slicing to extract portions of a string. ex: `my_string[2:5]` will extract characters from the 2nd to the 4th position.
 - string interpolation: python supports various ways to format strings, including f-strings (f"..{variable}..."), %-formatting ("%s %d" % ("string", 42)), and `str.format()`
 - Escape sequences: special characters like newline `(\n)` and tab `(\t)` and others are represented using escape sequences.
 - string methods: python provides many built-in methods for string manipulation, such as `split()`, `join()` and `startswith()`

## Numeric Data Types

[top](#content)

1. Numeric Data Types in python (int, float):
- python supports two primary numeric data types: `int` for integers and `float` for floating-point numbers
- Integers are whole numbers, and floats can represent both whole and fractional numbers
- you can perform arithmetic operations on these types, including addition, substraction, multiplication, division and more.
- Be aware of potential issues with floating-point precesion, which can lead to small inaccuracies in calculations.
- python also provides built-in functions for mathematical operations such as `abs()`, `round()` and `math()` module for advanced functions.

## Regex

1. Regular expressions for Text Processing:
- Regular expressions (regex or regexp) are a powerful tool for pattern matching and text processing.
- the `re` module in python is used for working with regular expressions.
- common metacharacters: `.`(any character), `*`(zero or more), `+` (one or more), `?`(zero or one), `[]`(character class), `|`(OR), `^`(start of line),`$`(end of line) etc
- Example of regex usage: matching emails, phone numbers, or extracting data from text
- `re` module functions include `re.match()`, `re.search()`, `re.findall()`, and `re.sub()` for pattern matching and replacement.

## Keywords and Variables

Keywords in Python:

- Keywords are reserved words in python that have predefined meanings and cannot be used as variable names or identifiers. These words are used to define the structure and logic of the program. They are an integral part of the python language and case-sensitive, which means you must use them exactly as specified.

Here are some important python keywords:

1. `and`: it is a logical operator that returns `True` if both operands are true
2. `or`: It is a logical operator that returns `True` if at least one of the operands is true.
3. `not`: It is a logical operator that returns the opposite of the operand's truth value
4. `if`: It is used to start a conditional statement and is followed by a condition that determines whether the code block is executed.
5.`else`: It is used in conjunction with `if` to define and alternative code block to execute when the `if` condition is `false`
6. `elif`: short for "else if", it is used to check additional conditions after an `if` statement and is used in combination with `if` and `else`
7. `while`: it is used to create a loop that repeatedly executes a block of code as long as a specified condition is true.
8. `for`: It is used to create a loop that iterates over a sequence (such as list, tuple or string) and executes a block of code for each item in the sequence
9. `in`: used with `for`, it checks if a value is present in a sequence.
10. `try`: it is the beginning of a block of code that is subject to exception handling. it is followed by `except` to catch and handle exceptions.
11. `except`: used with `try`, it defines a block of code to execute when an exception is raised in the corresponding `try` block.
12. `finally`: used with `try`, it defines a block of code that is always executed, whether an exception is raised or not.
13. `def`: it is used to define a function in python
14. `return`: It is used within a function to specify the value that the function should return
15. `class`: It is used to define a class, which is blueprint for creating objects in object-oriented programming
16. `import`