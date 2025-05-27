def rotate_right(lst, k):
    k %= len(lst)
    return lst[-k:] + lst[:-k]

print(rotate_right([1, 2, 3, 4, 5], 2))
