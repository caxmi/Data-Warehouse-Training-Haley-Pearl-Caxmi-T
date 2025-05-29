def convert_temp(value, unit):
    if unit.lower() == "c":
        return (value * 9/5) + 32
    elif unit.lower() == "f":
        return (value - 32) * 5/9
    else:
        return "Invalid unit"

val = float(input("Enter temperature value: "))
unit = input("Enter unit (C/F): ")
result = convert_temp(val, unit)
print("Converted temperature:", result)
print()
