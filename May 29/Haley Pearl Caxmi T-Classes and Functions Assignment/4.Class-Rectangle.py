class Rectangle:
    def __init__(self, length, width):
        self.length = length
        self.width = width

    def area(self):
        return self.length * self.width

    def perimeter(self):
        return 2 * (self.length + self.width)

    def is_square(self):
        return self.length == self.width

l = float(input("Enter rectangle length: "))
w = float(input("Enter rectangle width: "))
rect = Rectangle(l, w)
print("Area:", rect.area())
print("Perimeter:", rect.perimeter())
print("Is square?", rect.is_square())
print()
