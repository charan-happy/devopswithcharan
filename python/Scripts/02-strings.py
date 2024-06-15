# string concatenation

str1="Hello"
str2="World"
result = str1 + " " + str2
print(result)

# string length

statement="Python is awesome programming language"
length = len(statement)
print("length of the string:", length)

# lower and uppercase

uppercase=statement.upper()
lowercase=statement.lower()

print("uppercase:", uppercase)
print("lowercase:", lowercase)

# string replace
new_statement=statement.replace("awesome", "good")
print("Modified text:", new_statement)

# string split

words=statement.split()
print("words:", words)

# string strip

text= "  some space  "
stripped_text=text.strip()
print("stripped text", stripped_text)

# substring

substring="great"
if substring in new_statement:
    print(substring, "found in the text")
else:
     print(substring, "is not present")