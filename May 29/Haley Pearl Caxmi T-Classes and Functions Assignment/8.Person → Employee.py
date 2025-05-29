class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

class Employee(Person):
    def __init__(self, name, age, emp_id, salary):
        super().__init__(name, age)
        self.emp_id = emp_id
        self.salary = salary

    def display_info(self):
        print(f"Name: {self.name}, Age: {self.age}, ID: {self.emp_id}, Salary: {self.salary}")

name = input("Enter employee name: ")
age = int(input("Enter employee age: "))
emp_id = input("Enter employee ID: ")
salary = float(input("Enter salary: "))
emp = Employee(name, age, emp_id, salary)
emp.display_info()
print()
