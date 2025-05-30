#10.Write IT employee names to file
import csv
with open('employees.csv', mode='r') as infile, open('it_employees.txt', mode='w') as outfile:
    reader = csv.DictReader(infile)

    for row in reader:
        if row['Department'] == 'IT':
            outfile.write(row['Name'] + '\n')
print("Names of IT department employees have been written to 'it_employees.txt'")

#11.Count the number of words in a text file
filename = 'it_employees.txt'
with open(filename, 'r') as file:
    content = file.read()
    word_count = len(content.split())
print(f" Total number of words in '{filename}': {word_count}")