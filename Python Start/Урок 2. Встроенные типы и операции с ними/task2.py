list_user = input("Введите значения через пробел - ").split()
print(list_user)
for i in range(0, len(list_user), 2):
    try:
        list_user[i], list_user[i+1] = list_user[i+1], list_user[i]
    except IndexError:
        break
print(list_user)