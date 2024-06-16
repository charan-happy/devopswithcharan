import re

text="apple ,banana, orange, grape"
pattern=r","

split_result=re.split(pattern, text)
print("split result", split_result)

