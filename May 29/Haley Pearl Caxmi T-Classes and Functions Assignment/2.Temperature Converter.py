def convert_temp(value, unit):
    if unit.lower() == "c":
        return (value * 9/5) + 32  # Celsius to Fahrenheit
    elif unit.lower() == "f":
        return (value - 32) * 5/9  # Fahrenheit to Celsius
    else:
        return "Invalid unit"
# Example Usage
print("37°C in Fahrenheit:", convert_temp(37, 'C'))
print("98.6°F in Celsius:", convert_temp(98.6, 'F'))
print()
