#7.Employee class
class Employee:
    def __init__(self, emp_id, name, dept, salary):
        self.emp_id = emp_id
        self.name = name
        self.dept = dept
        self.salary = salary

    def display(self):
        print(f"{self.emp_id} - {self.name}, {self.dept}, ₹{self.salary}")

    def is_high_earner(self):
        return self.salary > 60000

#8.Project class inherits from Employee
class Project(Employee):
    def __init__(self, emp_id, name, dept, salary, project_name, hours_allocated):
        super().__init__(emp_id, name, dept, salary)
        self.project_name = project_name
        self.hours_allocated = hours_allocated

#9.Instantiate and test
e1 = Employee(1, "Ali", "HR", 50000)
e2 = Employee(2, "Neha", "IT", 60000)
e3 = Employee(3, "Sara", "IT", 70000)

for e in [e1, e2, e3]:
    e.display()
    print("High Earner:", e.is_high_earner())
