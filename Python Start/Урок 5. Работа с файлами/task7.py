# Цезарь ООО 10000 5000
# Мираторг ООО 4000 7000
# Нестле ООО 12000 9000
# Семья ООО 6000 8000
# 4Сезона ООО 11000 6000

import json

dict_profit = {}
average_profit = 0
avg_profit = {}
list_json = []
c = 0


with open('text.txt', 'r', encoding='utf-8') as f:
    for line in f:
        list_line = line.strip('\n').split(' ')
        dict_profit[list_line[0]] = int(list_line[2]) - int(list_line[3])
    for el in dict_profit:
        if dict_profit[el] > 0:
            average_profit += dict_profit[el]
            c += 1
    avg_profit['avg_prof'] = average_profit/c
    list_json.append(dict_profit)
    list_json.append(avg_profit)


with open('text.json', 'w', encoding='utf-8') as f:
    json.dump(list_json, f, ensure_ascii=False)