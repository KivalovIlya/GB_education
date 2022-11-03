# шаблон текстового документа:
# Иванов 934923.43
# Макаров 23904.2
# ...

employee_dict = {}


def print_employee_20(empl_dict):
    # вывод фамилий с зп > 20т.р.
    print('Сотрудники с зарплатой выше 20 т.р. :', end=' ')
    for el in empl_dict:
        if empl_dict[el] > 20000:
            print(el, end=", ")
    return print()


with open('text.txt', 'r', encoding='utf-8') as f:
    for line in f:
        line_txt = line.strip('\n')
        employee_dict[line_txt.split()[0]] = float(line_txt.split()[1])
    print_employee_20(employee_dict)
    print(f"Средняя зарплата сотрудников: {sum(employee_dict.values()) / len(employee_dict)}")
