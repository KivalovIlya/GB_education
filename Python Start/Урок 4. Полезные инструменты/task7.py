user_number = 10
res = 1

def fact(n):
    for i in range(1, n+1):
        yield i


fact_n = (el for el in fact(user_number))

for i in fact_n:
    print(i, end=" ")
    res = res * i

print(f" = {res}")
