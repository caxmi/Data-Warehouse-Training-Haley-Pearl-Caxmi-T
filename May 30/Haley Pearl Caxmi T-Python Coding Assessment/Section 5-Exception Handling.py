#12.Square with input validation
num = input("Enter a number: ")

if num.isnumeric():
    num = int(num)
    print("Square:", num * num)
else:
    print("Invalid input! Please enter a number.")

#13.Handle ZeroDivisionError
def divide(a, b):
    if b == 0:
        print("Cannot divide by zero!")
    else:
        print("Result:", a / b)

x = int(input("Enter numerator: "))
y = int(input("Enter denominator: "))
divide(x, y)
