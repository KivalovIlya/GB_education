# Пример считываемых данных:
# One - 1
# Two - 2
# Three - 3

from deep_translator import GoogleTranslator

dict_text = {}

with open('text.txt', 'r', encoding='utf-8') as f:
    for line in f:
        text_line = line.strip('\n')
        translate_word = GoogleTranslator(source='auto', target='ru').translate(text_line.split(' - ')[0])
        dict_text[translate_word] = text_line.split(' - ')[1]
    print(dict_text)

with open('new.txt', 'w', encoding='utf-8') as f:
    for el in dict_text:
        f.write(el + ' - ' + dict_text[el] + '\n')

