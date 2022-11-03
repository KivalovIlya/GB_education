start_list = [300, 2, 12, 44, 1, 1, 4, 10, 7, 1, 78, 123, 55]
finish_list = [start_list[ie] for ie in range(1, len(start_list)) if start_list[ie] > start_list[ie-1]]
print(finish_list)