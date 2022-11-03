from functools import reduce


def num_mult(num1, num2):
    return num1*num2


list_numbers = [el for el in range(100, 1001) if el % 2 == 0]
result = reduce(num_mult, list_numbers)
print(result)