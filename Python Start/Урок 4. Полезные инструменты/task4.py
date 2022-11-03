dupl_list = [2, 2, 2, 7, 23, 1, 44, 44, 3, 2, 10, 7, 4, 11]
excl_list = [el for el in dupl_list if dupl_list.count(el) == 1]
print(excl_list)