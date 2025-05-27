marks = [float(input(f"Enter marks for subject {i+1}: ")) for i in range(5)]
total = sum(marks)
average = total / 5
percentage = (total / 500) * 100

print(f"Total: {total}, Average: {average:.2f}, Percentage: {percentage:.2f}%")

if percentage >= 90:
    grade = 'A'
elif percentage >= 75:
    grade = 'B'
elif percentage >= 60:
    grade = 'C'
elif percentage >= 40:
    grade = 'D'
else:
    grade = 'F'

print(f"Grade: {grade}")