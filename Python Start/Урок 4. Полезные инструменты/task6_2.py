from itertools import cycle
from sys import argv

script_name, count = argv
user_list = ['A', 'B', 'C', 'D', 'E', 'F']

iter = cycle(user_list)

for i in range(int(count)):
    print(next(iter))
