import re

text = "The quick brown fox"
pattern=r"brown"

search=re.search(pattern, text)
if search:
    print("pattern found:", search.group())
else:
    print("Pattern not found")

match=re.match(pattern, text)
if match:
    print("Match found:", match.group())
else:
    print("No Match")

replacement="red"

new_text=re.sub(pattern, replacement, text)
print("Modified text", new_text)


