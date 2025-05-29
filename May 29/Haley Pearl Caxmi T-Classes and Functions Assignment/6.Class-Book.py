class Book:
    def __init__(self, title, author, price, in_stock):
        self.title = title
        self.author = author
        self.price = price
        self.in_stock = in_stock

    def sell(self, quantity):
        if quantity > self.in_stock:
            raise ValueError("Not enough stock.")
        self.in_stock -= quantity
        print(f"Sold {quantity} copies. Remaining: {self.in_stock}")

title = input("Enter book title: ")
author = input("Enter book author: ")
price = float(input("Enter book price: "))
stock = int(input("Enter initial stock: "))
book = Book(title, author, price, stock)

try:
    qty = int(input("Enter quantity to sell: "))
    book.sell(qty)
except ValueError as e:
    print("Error:", e)
print()
