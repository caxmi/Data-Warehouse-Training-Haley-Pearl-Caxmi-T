def remove_duplicates(lst):
    seen = set()
    result = []
    for item in lst:
        if item not in seen:
            seen.add(item)
            result.append(item)
    return result

lst = [1, 2, 2, 3, 4, 3, 5]
print(remove_duplicates(lst))
