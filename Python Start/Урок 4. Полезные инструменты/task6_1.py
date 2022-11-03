from itertools import count
from sys import argv

# при запуске скрипта указывается два параметра: начало и конец
script_name, start_position, finish_position = argv


def num_cycle(start, finish):
    for i in count(int(start)):
        print(i)
        if i == int(finish):
            break


num_cycle(start_position, finish_position)