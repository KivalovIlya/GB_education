# постарался максимально все учесть, чтобы в счет не брать цифры, символы всякие и прочий треш

eng_alph = set([chr(el).lower() for el in range(65, 91)])
rus_alph = set("абвгдеёжзийклмнопрстуфхцчшщъьыэюя")
incorrent_word_list = []


def clear_word(word):
    # данная функция предназначена для удаления возможно прилегающих символов к слову
    symbol_spec = ['.', ',', '!', '?', ':', '"', "'", '`', '(', ')', '{', '}']
    for el in symbol_spec:
        word = word.strip(el)
        word = word.replace('`', '')
    return word.lower()


def check_word(word):
    # проверка состоит ли слово только из букв en-ru словаря
    if set(word) < eng_alph:
        return False
    elif set(word) < rus_alph:
        return False
    else:
        return True


def del_inc_word(world_all, inc_word):
    # удаление мусора
    for list_element in world_all:
        for word_element in inc_word:
            if word_element in list_element:
                list_element.remove(word_element)


def print_res(content_print):
    # вывод результата
    for el in range(len(content_print)):
        print(f"Строка №{el + 1}. Слов - {len(content_print[el])}")


with open('text.txt', 'r', encoding='UTF-8') as f:
    content_string_list = f.readlines()
    content_word_list = [el.strip('\n').split(' ') for el in content_string_list]
    for text_string in range(len(content_word_list)):
        for word_in_string in range(len(content_word_list[text_string])):
            content_word_list[text_string][word_in_string] = clear_word(content_word_list[text_string][word_in_string])
            if check_word(content_word_list[text_string][word_in_string]):
                incorrent_word_list.append(content_word_list[text_string][word_in_string])
    del_inc_word(content_word_list, incorrent_word_list)
    print_res(content_word_list)
