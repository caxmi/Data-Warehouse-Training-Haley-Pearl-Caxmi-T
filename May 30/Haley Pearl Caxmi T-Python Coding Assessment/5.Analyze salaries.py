salaries = [50000, 60000, 55000, 70000, 52000]
max_salary = max(salaries)
avg_salary = sum(salaries) / len(salaries)
above_avg = [s for s in salaries if s > avg_salary]
sorted_salaries = sorted(salaries, reverse=True)

print("Max salary:", max_salary)
print("Salaries above average:", above_avg)
print("Sorted descending:", sorted_salaries)
