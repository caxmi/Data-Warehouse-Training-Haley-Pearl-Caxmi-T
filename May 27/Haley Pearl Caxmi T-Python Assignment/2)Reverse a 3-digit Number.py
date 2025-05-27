num = input("Enter a 3-digit number: ")
if len(num) == 3 and num.isdigit():
    print(f"Reversed number: {num[::-1]}")
else:
    print("Invalid input!")