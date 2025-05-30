num = input("Enter a number: ")

if num.isnumeric():
    num = int(num)
    print("Square:", num * num)
else:
    print("Invalid input! Please enter a number.")
