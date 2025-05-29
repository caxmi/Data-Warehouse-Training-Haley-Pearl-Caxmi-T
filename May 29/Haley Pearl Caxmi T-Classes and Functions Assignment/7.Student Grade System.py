class Student:
    def __init__(self, name, marks):
        self.name = name
        self.marks = marks

    def average(self):
        return sum(self.marks) / len(self.marks)

    def grade(self):
        avg = self.average()
        if avg >= 90:
            return 'A'
        elif avg >= 75:
            return 'B'
        elif avg >= 50:
            return 'C'
        else:
            return 'F'

sname = input("Enter student name: ")
n = int(input("Enter number of subjects: "))
marks = []
for i in range(n):
    marks.append(float(input(f"Enter mark {i+1}: ")))

stu = Student(sname, marks)
print(f"{stu.name}'s Average: {stu.average():.2f}")
print(f"{stu.name}'s Grade: {stu.grade()}")
print()
