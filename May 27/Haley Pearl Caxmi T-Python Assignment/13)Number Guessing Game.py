import random
target = random.randint(1, 100)
guess = None

while guess != target:
    guess = int(input("Guess the number (1-100): "))
    if guess < target:
        print("Too Low")
    elif guess > target:
        print("Too High")
    else:
        print("Correct! You guessed it.")