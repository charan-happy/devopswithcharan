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



      ------------------------------------------------------

      Get a comprehensive overview of YAML files and their structure, usage, benefits and steps to create. A Yaml file is composed of key-value pairs and supports data types including strings, numbers, lists, and dictionaries. It is human-readable, lightweight, and easy to learn, making it a popular choice for configuration files and data exchange between systems.

Here, in this Yaml tutorial, we’ll discuss,

What are YAML Files?
Basic Structure of a YAML File
Components of a YAML File
Benefits of YAML Files
How to create a YAML File?
Why are YAML Files important?
How does a YAML file help in Deployment?
Role of YAML in Microservices and Kubernetes
Why is a YAML view important for Developers?
What are YAML Files?
YAML (Yet Another Markup Language) is a human-readable data serialization language used for data storage and data exchange formats. It is commonly used for configuration files, data exchange, and storing metadata. But, it can also be used to represent arbitrary data structures such as lists, arrays, and dictionaries. Yaml is a text-based format and aims to be easily readable for both humans and machines.

Here is a Yaml file example that defines a person’s profile:


Example: In this Yaml code example, we define a person’s profile with five keys: name, age, address, and phone_numbers. The value of the name key is a string, John Doe. The value of the age key is a number, 30. The value of the address key is a nested dictionary that contains the street, city, state, and zip code of the person’s address. Finally, the value of the phone_numbers key is a list of two strings that represent the person’s phone numbers.

Basic Structure of a YAML File
The basic structure of a Yaml file consists of key-value pairs, with each key-value pair separated by a colon (:).

This is a simple Yaml file example:


In this Yaml code example, the keys are key1, key2, and key3, and the values are value1, value2, and value3, respectively.

A Yaml format supports several data types, including strings, numbers, lists, and dictionaries (also known as maps or objects in other formats).

[Good Read: All About “Helm”- The Package Manager For Kubernetes]

Components of a YAML file
A YAML file is composed of a collection of data structures represented as strings. The basic building blocks of the Yaml language are:

Scalars: Simple values such as strings, numbers, and booleans.
Lists: Ordered collections of scalars, represented by a hyphen (-) followed by a space and the value.
Dictionaries: Unordered collections of key-value pairs, represented by colons (:) separating the keys and values.
Documents: A YAML file can contain one or more YAML documents separated by “ — -”. Each document is treated as a standalone unit.
Comments: Lines that start with “#” are considered comments and these are ignored by YAML parsers.
These components can be nested and combined in various ways to represent complex data structures. Additionally, the Yaml format supports data typing, and a variety of other features like anchors and aliases, to make it easy to write and reuse complex data structures.

Benefits of YAML Files!
There are several benefits of using Yaml files:

Readability: YAML is a human-readable data format, which makes it easy to understand and edit.
Lightweight: YAML files are typically smaller and simpler than XML or JSON files, making them easier to manage and process.
Easy to learn: YAML has a simple syntax, making it easy to learn and use even for those with little or no prior experience.
Compatibility: YAML can be easily translated into other data formats, making it a popular choice for data exchange between different systems.
Flexibility: YAML supports a wide range of data structures, from simple scalars to complex nested structures, making it a versatile choice for a variety of applications.
Widely used: YAML is widely used across a variety of industries, from software development to infrastructure automation, making it a familiar and well-understood format for many developers.
Overall, Yaml language provides a simple, flexible, and human-readable way to represent data, making it a popular choice for configuration files and data exchange between systems.

How to Create a YAML File?
Here are the general steps to write a YAML file:

Choose a text editor: You can use any text editor to write a YAML file. Examples include Notepad++, Sublime Text, Atom, etc.
Determine the structure of your data: YAML uses indentation to determine the structure of your data. Start by deciding how you want your data to be organized.
Start with the basic structure: YAML files start with three hyphens ( — -), and end with three dots (…). Everything in between these symbols is part of your YAML file.
Add key-value pairs: YAML uses key-value pairs to store data. The key and value are separated by a colon, and the value can be a string, number, or other data types.
Use whitespace to create nested structures: YAML uses indentation to create nested structures, such as lists and dictionaries. For example, if you want to create a list, start each item on a new line, indented with the same number of spaces.
Save the file: Save the file with a .yml or .yaml extension.
Verify the syntax: Before using your YAML file, make sure the syntax is correct by using a YAML linter. Incorrect syntax can cause errors in your data.
Why are YAML Files important?
YAML files are important because they offer several benefits:

Human-readable: YAML is a human-readable data serialization language, meaning it’s easier for people to understand and work with compared to other, more complex formats such as XML or JSON.
Easy to write: YAML’s syntax is simple and easy to understand, making it straightforward for developers to create and edit YAML files.
Supports multiple data types: YAML supports multiple data types, including strings, numbers, lists, and dictionaries, making it a versatile format for a wide range of applications.
Used for configuration files: YAML is often used for configuration files, such as in DevOps tools and cloud infrastructure. This is because YAML is flexible, easy to understand, and supports nested data structures.
Used for data exchange: YAML is also used for data exchange between different systems and applications, as it can be easily parsed and transformed into other data formats.
How does a YAML file help in Deployment?
Overall, YAML is a useful format for storing and exchanging data because of its simplicity, readability, and versatility. Let’s read how a Yaml file helps in enabling a seamless deployment here in this Yaml tutorial.

YAML files can be used to help in deployment in several ways:

Configuration management: YAML files can manage configurations for various systems and applications. This is useful in deployment, as it allows you to easily manage and maintain different configurations for different environments, such as development, staging, and production.
Declarative infrastructure: YAML files can be used to declare infrastructure in a platform-agnostic manner. For example, in the context of DevOps, YAML files can be used to define a desired state for cloud infrastructure, and then used to automatically provision and configure resources in the cloud.
Continuous Integration and Deployment (CI/CD): YAML files can be used to define CI/CD pipelines for automation of deployment. This allows you to automate the deployment process, reducing the risk of human error and making it easier to deploy code changes consistently and quickly.
Deployment of Kubernetes: YAML files are used to define deployment specifications for Kubernetes, a popular open-source container orchestration platform. In Kubernetes, YAML files are used to define the desired state of the system, including the deployment of containers, services, and other resources.
By using YAML files in deployment, you can make the deployment process more automated, scalable, and efficient.

Role of YAML in Microservices and Kubernetes
YAML plays a significant role in Microservices and Kubernetes:

Microservices: YAML is used to define the configuration of microservices in a simple, human-readable format. This allows developers to efficiently manage the configuration of each microservice, making it easier to change and maintain the architecture of a microservice-based application.

Kubernetes: YAML is the primary format used to define the desired state of resources in Kubernetes. This includes the deployment of containers, services, and other resources. Kubernetes uses YAML files to manage and automate the deployment, scaling, and management of containerized applications.

YAML is a valuable tool for both microservices and Kubernetes as it provides a simple, human-readable way to manage the configuration of these technologies. This makes it easier for developers to manage applications thus reducing the risk of errors and making it easier to scale & deploy applications consistently.

Why is a YAML View important for Developers?
YAML views can be important for fixing bugs as they provide a visual representation of the data structure and organization of the code, making it easier to identify issues and understand the relationships between different components.

This can be particularly useful when dealing with complex data structures or configurations, as it allows developers to quickly and easily identify where errors or unexpected behaviour may be occurring. Additionally, YAML views can often highlight any syntax errors in the code, making it easier to identify and fix them before they cause issues in production.

Teams can view the entire workflow via the BuildPiper UI and download the YAML file corresponding to the workflow. Simply upload the YAML file and then configure the whole pipeline workflow. The YAML syntax is designed to be simple & intuitive to understand and enhance as needed.

Discuss business criticalities and scalability issues with us. Reach out to our DevOps experts to get the best-in-class assistance for your problems.

The Conclusion
Summing it all up, we can say that YAML plays an important role in configuration management and data exchange. The syntax of a YAML file is easy to understand, and it can be created using any text editor. Before using a YAML file, it is important to verify its syntax using a YAML linter. Overall, YAML provides a simple, flexible, and human-readable way to represent data, making it a valuable tool for developers.
