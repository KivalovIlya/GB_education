user_line = 'for user input'

with open('text.txt', 'w', encoding='UTF-8') as f:
    while user_line != '':
        user_line = input()
        f.write(user_line + '\n')