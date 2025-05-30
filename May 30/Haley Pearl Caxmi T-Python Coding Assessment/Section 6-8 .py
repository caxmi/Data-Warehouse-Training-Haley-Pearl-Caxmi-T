import pandas as pd
from datetime import datetime

#14.Load CSV files
employees = pd.read_csv('employees.csv')
projects = pd.read_csv('projects.csv')

#15.Display
print("First 2 rows of employees:")
print(employees.head(2), "\n")

print("Unique departments:")
print(employees['Department'].unique(), "\n")

print("Average salary by department:")
print(employees.groupby('Department')['Salary'].mean(), "\n")

#16.Add TenureInYears column (Current Year - Joining Year)
current_year = datetime.now().year
employees['JoiningYear'] = pd.to_datetime(employees['JoiningDate']).dt.year
employees['TenureInYears'] = current_year - employees['JoiningYear']

print("Employees data with TenureInYears:")
print(employees[['Name', 'JoiningDate', 'TenureInYears']], "\n")

#17.Filter IT department employees with salary > 60000
it_high_salary = employees[(employees['Department'] == 'IT') & (employees['Salary'] > 60000)]
print("IT employees with salary > 60000:")
print(it_high_salary, "\n")

#18.Group by Department and get counts and salary stats
dept_stats = employees.groupby('Department').agg(
    EmployeeCount=('EmployeeID', 'count'),
    TotalSalary=('Salary', 'sum'),
    AverageSalary=('Salary', 'mean')
)
print("Department-wise employee stats:")
print(dept_stats, "\n")

#19.Sort employees by salary in descending order
sorted_employees = employees.sort_values(by='Salary', ascending=False)
print("Employees sorted by salary (desc):")
print(sorted_employees[['Name', 'Department', 'Salary']], "\n")

#20.Merge employees and projects on EmployeeID to show project allocations
merged_data = pd.merge(employees, projects, on='EmployeeID', how='inner')
print("Merged employees and projects (inner join):")
print(merged_data[['Name', 'ProjectName', 'HoursAllocated']], "\n")

#21.List all employees not working on any project (left join + filter NaNs)
left_join = pd.merge(employees, projects, on='EmployeeID', how='left', indicator=True)
no_project_employees = left_join[left_join['_merge'] == 'left_only']
print("Employees with no projects assigned:")
print(no_project_employees[['Name', 'Department']], "\n")

#22.Add derived column TotalCost = HoursAllocated * (Salary / 160)
merged_data['TotalCost'] = merged_data['HoursAllocated'] * (merged_data['Salary'] / 160)
print("Merged data with TotalCost column:")
print(merged_data[['Name', 'ProjectName', 'HoursAllocated', 'Salary', 'TotalCost']])
