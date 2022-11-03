result = []

def sum_all_numbers(list_numbers):
    # возрат суммы элементов массива
    return sum(list_numbers)


def input_user_numbers():
    # запрос пользовательского ввода, после чего проверка на наличие завершающего символа
    # далее перевод всех элементов массива в целочисленный тип данных
    input_numbers = input().split()
    if input_numbers[len(input_numbers)-1].isdigit():
        for i in range(len(input_numbers)):
            input_numbers[i] = int(input_numbers[i])
        return input_numbers, True
    else:
        del input_numbers[len(input_numbers)-1]
        for i in range(len(input_numbers)):
            input_numbers[i] = int(input_numbers[i])
        return input_numbers, False


while True:
    sum_list, next_action = input_user_numbers()
    sum_list = sum_all_numbers(sum_list)
    result.append(sum_list)
    if next_action:
        print(sum(result))
        continue
    else:
        print(sum(result))
        break