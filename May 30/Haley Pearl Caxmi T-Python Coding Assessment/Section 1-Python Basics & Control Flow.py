#1.Print all odd numbers between 10 and 50
print("Odd numbers between 10 and 50:")
for i in range(11, 50, 2):
    print(i, end=" ")
print()

#2.Leap year checker
def is_leap_year(year):
    return (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0)
year = int(input("Enter a year: "))
if is_leap_year(year):
    print(f"{year} is a leap year.")
else:
    print(f"{year} is not a leap year.")

#3.Count no.of 'a's in a string
input_str = input("Enter a string: ")
count = input_str.count('a')
print(f"The letter 'a' appears {count} times in the string.")
