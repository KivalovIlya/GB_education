def init_func(*args):
    list_word = list(args)
    print(list_word)
    if len(list_word) == 1:
        list_word = list_word[0].split()
    for i in range(len(list_word)):
        if list_word[i].islower():
            list_word[i] = list_word[i].title()
        else:
            continue
    return " ".join(list_word)


print(init_func('hello HOW are 423 YOU'))

# надеюсь по итогу я правильно понял задание и сделал