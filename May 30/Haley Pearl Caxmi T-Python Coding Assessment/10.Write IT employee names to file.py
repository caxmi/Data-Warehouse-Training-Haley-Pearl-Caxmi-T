# Q10: Write IT employee names to file
import csv

# Open CSV for reading and text file for writing
with open('employees.csv', mode='r') as infile, open('it_employees.txt', mode='w') as outfile:
    reader = csv.DictReader(infile)

    for row in reader:
        if row['Department'] == 'IT':
            outfile.write(row['Name'] + '\n')

print("Names of IT department employees have been written to 'it_employees.txt'")

