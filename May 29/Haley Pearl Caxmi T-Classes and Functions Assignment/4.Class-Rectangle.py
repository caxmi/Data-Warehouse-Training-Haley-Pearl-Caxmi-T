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

# Example
r1 = Rectangle(5, 10)
r2 = Rectangle(7, 7)
print("Rectangle 1 area:", r1.area())
print("Rectangle 2 area:", r2.is_square())
print()
