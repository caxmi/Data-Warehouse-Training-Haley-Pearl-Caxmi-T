words = ["apple", "bat", "cat", "banana", "dog", "elephant"]
grouped = {}
for word in words:
    length = len(word)
    grouped.setdefault(length, []).append(word)
print(grouped)
