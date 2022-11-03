user_string = input("Введите слова через пробел - ").split()
for i, word in enumerate(user_string, 1):
    print(f"{i} - {word[0:10]}")