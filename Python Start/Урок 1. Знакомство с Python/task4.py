user_number = int(input('Введите число - '))
max_number = 0

while user_number != 0:
    last_number = user_number % 10
    if last_number > max_number:
        max_number = last_number
    user_number = user_number // 10

print(f"Максимальная цифра - {max_number}")