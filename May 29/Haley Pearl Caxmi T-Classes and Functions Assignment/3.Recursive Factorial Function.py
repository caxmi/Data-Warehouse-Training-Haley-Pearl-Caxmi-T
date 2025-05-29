def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)

num = int(input("Enter a number to find factorial: "))
print(f"Factorial of {num} is:", factorial(num))
print()
