def divide(a, b):
    if b == 0:
        print("Cannot divide by zero!")
    else:
        print("Result:", a / b)

x = int(input("Enter numerator: "))
y = int(input("Enter denominator: "))
divide(x, y)
