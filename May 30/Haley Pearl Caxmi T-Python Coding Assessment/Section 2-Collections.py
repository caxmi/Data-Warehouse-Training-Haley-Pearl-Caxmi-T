#4.Create dictionary
keys = ['a', 'b', 'c']
values = [100, 200, 300]
my_dict = dict(zip(keys, values))
print("Dictionary:", my_dict)

#5.Analyze salaries
salaries = [50000, 60000, 55000, 70000, 52000]
max_salary = max(salaries)
avg_salary = sum(salaries) / len(salaries)
above_avg = [s for s in salaries if s > avg_salary]
sorted_salaries = sorted(salaries, reverse=True)

print("Max salary:", max_salary)
print("Salaries above average:", above_avg)
print("Sorted descending:", sorted_salaries)

#6.Set operations
a = [1, 2, 3, 4]
b = [3, 4, 5, 6]
set_a, set_b = set(a), set(b)
print("Difference A - B:", set_a - set_b)
print("Difference B - A:", set_b - set_a)