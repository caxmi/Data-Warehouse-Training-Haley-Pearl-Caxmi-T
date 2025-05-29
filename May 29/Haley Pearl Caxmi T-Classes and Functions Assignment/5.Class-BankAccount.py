class BankAccount:
    def __init__(self, name, balance=0):
        self.name = name
        self.balance = balance

    def deposit(self, amount):
        self.balance += amount
        print("Deposited:", amount)

    def withdraw(self, amount):
        if amount > self.balance:
            print("Insufficient balance.")
        else:
            self.balance -= amount
            print("Withdrawn:", amount)

    def get_balance(self):
        return self.balance

acc_name = input("Enter account holder name: ")
acc = BankAccount(acc_name, float(input("Enter initial balance: ")))
acc.deposit(float(input("Enter deposit amount: ")))
acc.withdraw(float(input("Enter withdrawal amount: ")))
print("Current balance:", acc.get_balance())
print()
