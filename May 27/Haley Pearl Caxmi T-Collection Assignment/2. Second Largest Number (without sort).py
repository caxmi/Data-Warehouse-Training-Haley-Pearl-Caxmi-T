def second_largest(lst):
    first = second = float('-inf')
    for num in lst:
        if num > first:
            second, first = first, num
        elif first > num > second:
            second = num
    return second

numbers = [10, 20, 40, 30, 50]
print(second_largest(numbers))
