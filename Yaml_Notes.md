[what is yaml ?](#what-is-yaml-)

How to write YAML?
YAML Syntax

[process](#processes)


[What are YAML Files?](#what-are-yaml-files)

[Basic Structure of a YAML File](#basic-structure-of-a-yaml-file)

[Components of a YAML File](#components-of-a-yaml-file)

[Benefits of YAML Files](#benefits-of-yaml-files)

[How to create a YAML File?](#how-to-create-a-yaml-file)

[Why are YAML Files important?](#why-are-yaml-files-important)

[How does a YAML file help in Deployment?](#how-does-a-yaml-file-help-in-deployment)

[Role of YAML in Microservices and Kubernetes](#role-of-yaml-in-microservices-and-kubernetes)

[Why is a YAML view important for Developers?](#why-is-a-yaml-view-important-for-developers)

# what is YAML ?

- YAML (YAML Ain’t Markup Language / yet another language ) is a human-readable data serialization language. It allows the user to declare configuration as steps if any manually ordered task.
- It is commonly used for configuration files and data exchange between systems.
- YAML is designed to be easy to read and write, making it popular among developers and system administrators.
- YAML is a data serialization language like XML and JSON.


YAML is popular

- Configuration files all written in YAML
- Widely used format
- For different Devops Tools and applications
- Human readable and intuitive


YAML Features :

- Matches native datastructures of agile methodology and its languages such as perl, python, php, ruby and javascript
- YAML data is portable between programming languages
- Includes data consistent data model
- Easily readable by humans
- Supports one-direction processing
- Ease of implmentation and usage


We Have 3 different types of languages in computer.

1. Markup Language
2. Programming Language
3. Scripting Language


Rules of creating YAML file :

- when you are creating a file in yaml, you should remember the following basic rules

```
- YAML is case sensitive
- The files should have `.yaml` or `yml` as the extension
- YAML does not allow the use of tabs while creating YAML files; spaces are allowed instead

```

Basic Components of YAML file:

**1. Conventional Block Format**

- This block format uses hyphen+space to begin a new item in a specified list. Observe the example shown below
```yaml
--- # Favourite Movies
- Simhadri
- RRR
- Jersey
```

**2. Inline Format**
- Inline format is delimited with **comma and space** and the items are enclosed in JSON .
```yaml
--- # movies list
  [simhadri, RRR, Jersey]
```

**3. Folded Text**
- FOlded text converts newlines to spaces and removes the leading whitespace. 
``` yaml
- {name: Nagacharan, age: 24}
- name: Charan
  age: 25
```

- The structure which follows all the basic conventions of YAML is shown below -

```yaml
men: [Charan, Nagacharan, Naga]
women:
  - shika
  - samantha
  - Rashmika
```

#### Synopsis of YAML Basic Elements
- Comments in YAML begins with (#) character
- List members are denoted by a leading hypen (-)
- List members are enclosed in square brackets and separated by comma
- Associated arrays are represented using colon (:) in teh format of key value pair. They are enclosed in curly braces {}
- Multiple documents with single streams are separated with 3 hypens (---)
- Repeated nodes in each file are initially denoted by an ampersand (&) and by an asterisk (*) mark later


### Indentation and separation

#### Indentation
YAML does not include any mandatory spaces. Further, there is no need to be consistent. The valid YAML indentation is shown below 

``` yaml

a:
   b:
      - c
      -  d
      - e
f:
      "welcome"
```

#### Separation of strings

- Strings are separated using double-quoted string. If you escape the newline characters in a given string, it is completely removed and translated into space values

#### Example
- In this example we have focused listing of animals listed as an array structure with data type of string. Every new element is listed with a prefix of hyphen as mentioned as prefix

``` yaml
-
 - Cat
 - Dog
 - Goldfish
-
 - Python
 - Lion
 - Tiger
```
- You should remember the following rules while working with indentation in YAML:Flow blocks must be intended with at least some spaces with surrounding current block level.

- Flow content of YAML spans multiple lines. The beginning of flow content begins with { or [.

- Block list items include same indentation as the surrounding block level because - is considered as a part of indentation.

**SYNTAX :**

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
## yaml comments

- yaml supports only single line comments.

`# this is single line comment`
- YAML does not support multi line comments. If you want to provide comments for multiple lines, you can do so as shown in the example below
``` YAML
# this is
# multi-line
# comments
```

- The comments within a collection are shown below
``` yaml
key: #comment 1
   - value line 1
   #comment 2
   - value line 2
   #comment 3
   - value line 3
```
Tip : we can make use of [yamllint.com](http://yamllint.com) to check the yaml syntax using an online tool.

#### collections and structures
- Block sequences in collections indicate each entry with a dash and space (-)
- Mappings are the representation of key value as included in JSON structure. It is used often in multi-lingual support systems and creation of API in mobile applications. Mappings use key value pair representation with the usage of colon and space (:)

**Examples**

sequence of scalars

``` yaml
- charan
- naga
- nagacharan
```
Mapping scalar to scalar

``` yaml
firstname: naga
lastname: charan
fullname: nagacharan
```
Mapping scalar to sequence of scalars

``` yaml
US states:
- newyork
- california
- chicago

india states:
- ap
- bihar
- New Delhi
```

Collections can be used for sequence mappings 

``` yaml
-
name: charan
hr: 87
avg: 0.278
-
name: Nagacharan
hr: 63
avg: 0.288
```
yaml and json example

``` yaml
defaults: &defaults
   adapter:  postgres
   host:     localhost

development:
   database: myapp_development
   <<: *defaults

test:
   database: myapp_test
   <<: *defaults
```

``` json
{
   "defaults": {
      "adapter": "postgres",
      "host": "localhost"
   },
   "development": {
      "database": "myapp_development",
      "adapter": "postgres",
      "host": "localhost"
   },
   "test": {
      "database": "myapp_test",
      "adapter": "postgres",
      "host": "localhost"
   }
}
```

- The defaults key with a prefix of “ <<: *” is included as and when required with no need to write the same code snippet repeatedly

### processes

- YAML includes a serialization procedure for representing data objects in serial format. The processing of YAML information includes three stages: **Representation, Serialization, Presentation and parsing.** Let us discuss each of them in detail.

**Representation:**

- YAML represents the data structure using three kinds of nodes: sequence, mapping and scalar

**sequence**
- Sequence refers to the ordered number of entries, which maps the unordered association of key value pair. It corresponds to the Perl or Python array list.

The code shown below is an example of sequence representation
``` yaml
product:
   - sku         : BL394D
     quantity    : 4
     description : Football
     price       : 450.00
   - sku         : BL4438H
     quantity    : 1
     description : Super Hoop
     price       : 2392.00
```

**mapping**
- Mapping on the other hand represents dictionary data structure or hash table. An example for the same is mentioned below

``` yaml
batchLimit: 1000
threadCountLimit: 2
key: value
keyMapping: <What goes here?>
```

**scalars**
- Scalars represent standard values of strings, integers, dates and atomic data types

📝  scalars are basic data types like numbers, strings, booleans, and null values. They are represented in various styles, including plain, single-quoted, double-quoted, folded, and literal. source

📑 Scalar Styles YAML supports five main scalar styles:

Plain: No special characters are used.

Single-quoted: Encloses the value in single quotes to preserve whitespace and special characters.

Double-quoted: Encloses the value in double quotes to allow interpolation and escape sequences.

Folded: Preserves line breaks and indentation.

Literal: Preserves all characters verbatim. source

💻 Examples of Scalar Usage:

``` yaml
name: Nagacharan (plain)
age: 30 (plain)
city: "New York" (double-quoted)
message: | This is a multi-line message. (folded)
data: !!binary | R0lGODlhAQABAIAAAP///////yH5BAEKAAEALAAAAAABAAEAAAICTAEAOw== (literal)
```
**serialization**

📝 YAML Serialization: A Human-Readable Approach YAML (YAML Ain't Markup Language) is a human-readable data serialization language often used for configuration files and data exchange. It's a superset of JSON and utilizes indentation and whitespace for structure, making it easier to read and understand than JSON. 

⚙️ Serialization Process: Serialization in YAML involves converting data structures like lists, dictionaries, and objects into a YAML string representation. This string can then be stored in a file, transmitted over a network, or processed by another program. YAML libraries are available for various programming languages, allowing seamless integration with your applications. 

🆚 Comparison with JSON: While both YAML and JSON are popular data serialization formats, YAML offers advantages in readability due to its human-friendly syntax. However, JSON is more compact and easier for machines to parse. The choice between the two depends on your specific needs and priorities.

``` yaml
---
name: nagacharan
age: 24
occupation: Devops Engineer
skills:
  - Python
  - CI/CD
  - Automation
address:
  street: 123 Main St
  city: Anytown
  state: CA
  zip: 12345

```
**presentation**
- The final output of YAML serialization is called presentation. It represents a character stream in a human friendly manner. YAML processor includes various presentation details for creating stream, handling indentation and formatting content. This complete process is guided by the preferences of user

```yaml
title: "My Awesome Presentation"
author: "Your Name"
date: 2023-10-26
slides:
  - title: "Introduction"
    content: "Welcome to my presentation!"
  - title: "Main Topic"
    content:
      - "Point 1"
      - "Point 2"
      - "Point 3"
  - title: "Conclusion"
    content: "Thank you for listening!"

```

**parsing**

- Parsing is the inverse process of presentation; it includes a stream of characters and creates a series of events. It discards the details introduced in the presentation process which causes serialization events. Parsing procedure can fail due to ill-formed input. It is basically a procedure to check whether YAML is well-formed or not

``` yaml
---
   environment: production
   classes:
      nfs::server:
         exports:
            - /srv/share1
            - /srv/share3
   parameters:
      paramter1
```

# syntax characters
- Various types of characters are used for various functionalities.

**Indicator Characters**

Indicator characters include a special semantics used to describe the content of YAML document. The following table shows this in detail

|S.NO.|Character and functionality|
|---|---|
|1|_<br>It denotes a block sequence entry|
|2|?<br>It denotes a mapping key|
|3|:<br>It denotes a mapping value|
|4|,<br>It denotes flow collection entry|
|5|]<br>It ends a flow sequence|
|6|{<br>It starts a flow mapping|
|7|}<br>It ends a flow mapping|
|8|#<br>It denotes the comments|
|9|&<br>It denotes node’s anchor property|
|10|*<br>It denotes alias node|
|11|!<br>It denotes node’s tag|
|12| (pipe symbol) It denotes a literal block scalar|
|13|><br>It denotes a folded block scalar|
|14|`<br>Single quote surrounds a quoted flow scalar|
|15|"<br>Double quote surrounds double quoted flow scalar|
|16|%<br>It denotes the directive used|


The following example shows the characters used in syntax

``` yaml

%YAML 1.1
---
!!map {
   ? !!str "sequence"
   : !!seq [
      !!str "one", !!str "two"
   ],
   ? !!str "mapping"
   : !!map {
      ? !!str "sky" : !!str "blue",
      ? !!str "sea" : !!str "green",
   }
}

# This represents
# only comments.
---
!!map1 {
   ? !!str "anchored"
   : !local &A1 "value",
   ? !!str "alias"
   : *A1,
}
!!str "text"
```
[YAML WIKI](https://en.wikipedia.org/wiki/YAML)
      
- A Yaml file is composed of key-value pairs and supports data types including strings, numbers, lists, and dictionaries. It is human-readable, lightweight, and easy to learn, making it a popular choice for configuration files and data exchange between systems.

Here, in this Yaml tutorial, we’ll discuss,

# What are YAML Files?

YAML (Yet Another Markup Language) is a human-readable data serialization language used for data storage and data exchange formats. It is commonly used for configuration files, data exchange, and storing metadata. But, it can also be used to represent arbitrary data structures such as lists, arrays, and dictionaries. Yaml is a text-based format and aims to be easily readable for both humans and machines.

Here is a Yaml file example that defines a person’s profile:


Example: In this Yaml code example, we define a person’s profile with five keys: name, age, address, and phone_numbers. The value of the name key is a string, John Doe. The value of the age key is a number, 30. The value of the address key is a nested dictionary that contains the street, city, state, and zip code of the person’s address. Finally, the value of the phone_numbers key is a list of two strings that represent the person’s phone numbers.

# Basic Structure of a YAML File

The basic structure of a Yaml file consists of key-value pairs, with each key-value pair separated by a colon (:).

This is a simple Yaml file example:


In this Yaml code example, the keys are key1, key2, and key3, and the values are value1, value2, and value3, respectively.

A Yaml format supports several data types, including strings, numbers, lists, and dictionaries (also known as maps or objects in other formats).


# Components of a YAML file

A YAML file is composed of a collection of data structures represented as strings. The basic building blocks of the Yaml language are:

**Scalars:** Simple values such as strings, numbers, and booleans.

**Lists:** Ordered collections of scalars, represented by a hyphen (-) followed by a space and the value.

**Dictionaries:** Unordered collections of key-value pairs, represented by colons (:) separating the keys and values.

**Documents:** A YAML file can contain one or more YAML documents separated by “ — -”. Each document is treated as a standalone unit.

**Comments:** Lines that start with “#” are considered comments and these are ignored by YAML parsers.

These components can be nested and combined in various ways to represent complex data structures. Additionally, the Yaml format supports data typing, and a variety of other features like anchors and aliases, to make it easy to write and reuse complex data structures.

# Benefits of YAML Files!
There are several benefits of using Yaml files:

**Readability:** YAML is a human-readable data format, which makes it easy to understand and edit.

**Lightweight:** YAML files are typically smaller and simpler than XML or JSON files, making them easier to manage and process.

**Easy to learn:** YAML has a simple syntax, making it easy to learn and use even for those with little or no prior experience.

**Compatibility:** YAML can be easily translated into other data formats, making it a popular choice for data exchange between different systems.

**Flexibility:** YAML supports a wide range of data structures, from simple scalars to complex nested structures, making it a versatile choice for a variety of applications.

**Widely used:** YAML is widely used across a variety of industries, from software development to infrastructure automation, making it a familiar and well-understood format for many developers.

Overall, Yaml language provides a simple, flexible, and human-readable way to represent data, making it a popular choice for configuration files and data exchange between systems.

# How to Create a YAML File?

Here are the general steps to write a YAML file:

Choose a text editor: You can use any text editor to write a YAML file. Examples include Notepad++, Sublime Text, Atom, etc.

Determine the structure of your data: YAML uses indentation to determine the structure of your data. Start by deciding how you want your data to be organized.

Start with the basic structure: YAML files start with three hyphens ( — -), and end with three dots (…). Everything in between these symbols is part of your YAML file.

Add key-value pairs: YAML uses key-value pairs to store data. The key and value are separated by a colon, and the value can be a string, number, or other data types.

Use whitespace to create nested structures: YAML uses indentation to create nested structures, such as lists and dictionaries. For example, if you want to create a list, start each item on a new line, indented with the same number of spaces.

Save the file: Save the file with a .yml or .yaml extension.

Verify the syntax: Before using your YAML file, make sure the syntax is correct by using a YAML linter. Incorrect syntax can cause errors in your data.

# Why are YAML Files important?

YAML files are important because they offer several benefits:

Human-readable: YAML is a human-readable data serialization language, meaning it’s easier for people to understand and work with compared to other, more complex formats such as XML or JSON.

Easy to write: YAML’s syntax is simple and easy to understand, making it straightforward for developers to create and edit YAML files.

Supports multiple data types: YAML supports multiple data types, including strings, numbers, lists, and dictionaries, making it a versatile format for a wide range of applications.

Used for configuration files: YAML is often used for configuration files, such as in DevOps tools and cloud infrastructure. This is because YAML is flexible, easy to understand, and supports nested data structures.

Used for data exchange: YAML is also used for data exchange between different systems and applications, as it can be easily parsed and transformed into other data formats.

# How does a YAML file help in Deployment?

Overall, YAML is a useful format for storing and exchanging data because of its simplicity, readability, and versatility. Let’s read how a Yaml file helps in enabling a seamless deployment here in this Yaml tutorial.

YAML files can be used to help in deployment in several ways:

**Configuration management:** YAML files can manage configurations for various systems and applications. This is useful in deployment, as it allows you to easily manage and maintain different configurations for different environments, such as development, staging, and production.

**Declarative infrastructure:** YAML files can be used to declare infrastructure in a platform-agnostic manner. For example, in the context of DevOps, YAML files can be used to define a desired state for cloud infrastructure, and then used to automatically provision and configure resources in the cloud.

**Continuous Integration and Deployment (CI/CD):** YAML files can be used to define CI/CD pipelines for automation of deployment. This allows you to automate the deployment process, reducing the risk of human error and making it easier to deploy code changes consistently and quickly.

**Deployment of Kubernetes:** YAML files are used to define deployment specifications for Kubernetes, a popular open-source container orchestration platform. In Kubernetes, YAML files are used to define the desired state of the system, including the deployment of containers, services, and other resources.

By using YAML files in deployment, you can make the deployment process more automated, scalable, and efficient.

# Role of YAML in Microservices and Kubernetes
YAML plays a significant role in Microservices and Kubernetes:

**Microservices:** YAML is used to define the configuration of microservices in a simple, human-readable format. This allows developers to efficiently manage the configuration of each microservice, making it easier to change and maintain the architecture of a microservice-based application.

**Kubernetes:** YAML is the primary format used to define the desired state of resources in Kubernetes. This includes the deployment of containers, services, and other resources. Kubernetes uses YAML files to manage and automate the deployment, scaling, and management of containerized applications.

YAML is a valuable tool for both microservices and Kubernetes as it provides a simple, human-readable way to manage the configuration of these technologies. This makes it easier for developers to manage applications thus reducing the risk of errors and making it easier to scale & deploy applications consistently.

# Why is a YAML View important for Developers?

YAML views can be important for fixing bugs as they provide a visual representation of the data structure and organization of the code, making it easier to identify issues and understand the relationships between different components.

This can be particularly useful when dealing with complex data structures or configurations, as it allows developers to quickly and easily identify where errors or unexpected behaviour may be occurring. Additionally, YAML views can often highlight any syntax errors in the code, making it easier to identify and fix them before they cause issues in production.

Teams can view the entire workflow via the BuildPiper UI and download the YAML file corresponding to the workflow. Simply upload the YAML file and then configure the whole pipeline workflow. The YAML syntax is designed to be simple & intuitive to understand and enhance as needed.

Discuss business criticalities and scalability issues with us. Reach out to our DevOps experts to get the best-in-class assistance for your problems.

#The Conclusion

Summing it all up, we can say that YAML plays an important role in configuration management and data exchange. The syntax of a YAML file is easy to understand, and it can be created using any text editor. Before using a YAML file, it is important to verify its syntax using a YAML linter. Overall, YAML provides a simple, flexible, and human-readable way to represent data, making it a valuable tool for developers.


[YAML WIKI](https://en.wikipedia.org/wiki/YAML)

if you like the content and want more content related to Devops and cloud consider ⭐ repo.