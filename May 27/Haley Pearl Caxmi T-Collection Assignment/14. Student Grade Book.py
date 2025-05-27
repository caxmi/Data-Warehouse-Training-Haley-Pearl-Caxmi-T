grades = {}
for _ in range(3):
    name = input("Enter student name: ")
    marks = int(input("Enter marks: "))
    if marks >= 90:
        grade = 'A'
    elif marks >= 75:
        grade = 'B'
    else:
        grade = 'C'
    grades[name] = grade

query = input("Enter name to find grade: ")
print(f"{query}'s grade: {grades.get(query, 'Not Found')}")
