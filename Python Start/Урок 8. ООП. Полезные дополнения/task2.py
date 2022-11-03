class ByZero(Exception):
    def __init__(self, txt):
        self.txt = txt


a = int(input('Введите числитель - '))
b = int(input('Введите знаменатель - '))

try:
    if b == 0:
        raise ByZero('Делить на ноль запрещено кстати')
    print(a / b)
except ByZero as e:
    print(e)