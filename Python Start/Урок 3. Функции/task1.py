def div_two_number(a, b):
    try:
        return a/b
    except ZeroDivisionError:
        return "Деление на ноль незаконно!"

while True:
    user_numerator = input("Введите числитель - ")
    user_denominator = input("Введите знаменатель - ")
    try:
        user_numerator = int(user_numerator)
        user_denominator = int(user_denominator)
        print(div_two_number(user_numerator, user_denominator))
        break
    except ValueError:
        print("Инициативный что ли?")