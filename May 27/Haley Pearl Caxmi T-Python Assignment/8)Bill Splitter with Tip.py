bill = float(input("Enter total bill amount: "))
people = int(input("Number of people: "))
tip_percent = float(input("Tip percentage: "))

total = bill + (bill * tip_percent / 100)
per_person = total / people

print(f"Each person should pay: ₹{per_person:.2f}")
