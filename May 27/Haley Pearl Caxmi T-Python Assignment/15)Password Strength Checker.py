import re

password = input("Enter your password: ")
length_ok = len(password) >= 8
number = re.search(r"\d", password)
uppercase = re.search(r"[A-Z]", password)
symbol = re.search(r"[!@#$%^&*(),.?\":{}|<>]", password)

if length_ok and number and uppercase and symbol:
    print("Strong Password")
else:
    print("Weak Password")
