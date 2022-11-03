def my_func(x, y:int):
    x_pow = x
    for i in range(1, abs(y)):
        x_pow = x_pow*x
    return 1/x_pow

res = my_func(3.31, -4)
print(res)