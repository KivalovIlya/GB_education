# Информатика: 100(л) 50(пр) 20(лаб)
# Физика: 30(л) - 10(лаб)
# Физкультура: - 30(пр) -
# Математика: - - 15(лаб)

dict_name_count = {}

def clear_string_text(text_with_lessons):
    delete_list_el = ['(л)', '(пр)', '(лаб)', '-']
    for el in delete_list_el:
        text_with_lessons = text_with_lessons.replace(el, '')
    return text_with_lessons.strip().split(' ')


def str_list_to_int(list_str):
    clear_list = []
    for el in list_str:
        if el == '':
            pass
        else:
            clear_list.append(int(el))
    return sum(clear_list)

with open('text.txt', 'r', encoding='utf-8') as f:
    for line in f:
        educ_name = line.split(':')[0]
        list_lessons = clear_string_text(line.split(':')[1])
        dict_name_count[educ_name] = str_list_to_int(list_lessons)
    print(dict_name_count)