What is YAML?
How to write YAML?
YAML Syntax

****************what is YAML ?****************

- YAML (YAML Ain’t Markup Language / yet another language ) is a human-readable data serialization language. It allows the user to declare configuration as steps if any manually ordered task.
- It is commonly used for configuration files and data exchange between systems.
- YAML is designed to be easy to read and write, making it popular among developers and system administrators.
- YAML is a data serialization language like XML and JSON.
- 

YAML is popular

- Configuration files all written in YAML
- Widely used format
- For different Devops Tools and applications
- Human readable and intuitive

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/dd541cc6-921e-4094-b04a-586b96dafbd4/Untitled.png)

We Have 3 different types of languages in computer.

1. Markup Language
2. Programming Language
3. Scripting Language

****************SYNTAX :****************

- YAML uses indentation and colons to structure data.

Here is the simple example of YAML Syntax :

```yaml
# below is the syntax for yaml file.
Key : value
nested_key:
	- item 1
	- item 2
```

- YAML uses indentation to indicate the nesting of elements
- Spaces are recommended over tabs, and the number of spaces for indentation should be consistent throughout the file.
- Conventionally, two spaces are used for indentation.
- Comments : Comments in YAML start with the # character and are used to provide explanatory or descriptive text
- Comments are ignored by the YAML Parser

Like all other languages, it is also having some data structures. Below are the details.

****************Scalars**************** 

- Scalars represent simple values like strings, numbers, booleans and null
- Scalars don’t have any indentation and can be expressed directly.

```yaml
string_key: Hello, World!
number_key: 42
boolean_key: true
null_key: null
```

**************Lists :**************

- Lists are represented by using a hypen(-) followed by a space
- Lists can contain any combination of scalars, other lists, or mappings (key-value pairs)
- Lists are like arrays in other programming languages
- Here list_key is also called as object.

```yaml
list_key:
  - item1
  - item2
  - sub_list:
     - sub_item1
     - sub_item2
```

- if we wanted to provide more than one value to a single key then we will use ********list********

********************Mappings :********************

- Mappings represent key-value pairs and use a colon (:) to separate the key from the value.
- Mappings can be nested within each other.

```yaml
person:
  name: Charan
  age: 23
```

************Multi-line Scalars************

- if a scalar value spans multiple lines, you can use the | character to indicate a literal block scalar or > character to indicate a folder scalar.

```yaml
multiline_key: |
  this is a
   multiline
   scalar value
```

Tip : we can make use of [yamllint.com](http://yamllint.com) to check the yaml syntax using an online tool.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9c86cd02-3de3-4233-8173-ae95b4e315a0/Untitled.png)

placeholders:

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/305a8805-3470-4cd6-aa4b-448ad92c6ffc/Untitled.png)

we can separate yaml files by using 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/05ab8159-a600-42ef-b29f-452d56498835/Untitled.png)

Lists : [a,b,c]

Dictionary: {A: key A, B: key B, C: Key C}

Dictionary in a list

[{A: keyA, B: KeyB, C: KeyC}, {D: keyD, E: KeyE, F: KeyF}]

Format to store configuration data
Key Value¶
There must be a blank space after the colon to separate the key and value

name: Nagacharan
age: 23

List¶
The - indicates that the item is a part of the list
Fruits:
- Apple
- Banana
- Mango

Cities:
- Bengaluru
- Chennai
- Mumbai
  
Dictionary¶
Equal spacing for nesting
Unequal spacing will lead to unwanted nesting
Student:
    name: Nagacharan
    age: 23
    location: Bengaluru

Employee:
    dept: Computer Science
    company: Google

List of Dictionaries

-  People:
 -  - Student:
        name: Nagacharan
        age: 23
        location: Bengaluru

    - Employee:
        dept: Computer Science
        company: Google