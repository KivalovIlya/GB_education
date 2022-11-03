def init_func(*args):
    list_word = list(args)
    for i in range(len(list_word)):
        if list_word[i].islower():
            list_word[i] = list_word[i].title()
        else:
            continue
    return " ".join(list_word)



print(init_func('hello', 'HOW', 'aRe', 'you?'))