my_list = [7, 5, 3, 3, 2]
user_rating = int(input("Введите рейтинг - "))

for i in range(len(my_list)):
    if user_rating > my_list[i]:
        my_list.insert(i, user_rating)
        break
    elif user_rating <= min(my_list):
        my_list.append(user_rating)
        break

print(my_list)