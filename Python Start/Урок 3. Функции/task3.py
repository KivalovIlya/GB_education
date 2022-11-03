def my_func(num1, num2, num3):
    sum_max = []
    sum_max.append(num1)
    sum_max.append(num2)
    sum_max.append(num3)
    sum_max.sort(reverse=True)
    return sum(sum_max[0:2])


res = my_func(9, 4, 11)
print(res)