filename = 'it_employees.txt'

with open(filename, 'r') as file:
    content = file.read()
    word_count = len(content.split())

print(f" Total number of words in '{filename}': {word_count}")