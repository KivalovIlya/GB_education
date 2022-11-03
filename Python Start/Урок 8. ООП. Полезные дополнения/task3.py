class OnlyNumber(Exception):
    def __init__(self, txt):
        self.txt = txt


user_list = []

while True:
    try:
        user_input = input('Введите новый элемент списка - ')
        if user_input == 'stop':
            print(user_list)
            break
        if user_input.isdigit():
            user_list.append(int(user_input))
        else:
            raise OnlyNumber('Вводите ЧИСЛО')

    except OnlyNumber as e:
        print(e)