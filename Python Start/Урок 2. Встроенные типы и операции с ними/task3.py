# решение через list
list_month = ['зима', 'весна', 'лето', 'осень', 'зима']
date_of_month = int(input("Введите номер месяца - "))
print(list_month[date_of_month // 3])

# решение через dict
dict_month = {0: 'Зима', 1: 'Весна', 2: 'Лето', 3:'Осень', 4:'Зима'}
date_month = int(input("Введите номер месяца - "))
print(dict_month[date_month//3])