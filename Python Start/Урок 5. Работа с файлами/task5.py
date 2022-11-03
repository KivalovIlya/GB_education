with open('text.txt', 'w', encoding='utf-8') as f:
    print('Введите числа через пробел : ', end='')
    f.write(input())

with open('text.txt', 'r', encoding='utf-8') as f:
    list_text_number = f.readline().strip('\n').split()
    list_text_number = [int(el) for el in list_text_number]
    print(f"Сумма введенных чисел : {sum(list_text_number)}")