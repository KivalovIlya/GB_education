product_characteristic = str(input("Введите характеристики товара через пробел - "))
product_dict = {}
product_analytics = {}
product_tuple = ()
product_db = []
count = 1
add_product = 1


def create_product_dict(product_characteristic, product_dict):  # Заполнение новой записи
    for i in product_characteristic.split():
        product_dict[i] = input(f"{i} - ")


def add_product_in_db(product_db, product_tuple, product_dict, count):  # Внесение записи в список
    product_tuple += (count, product_dict,)
    product_db.append(product_tuple)

def all_key_values(product_db, key_word):
    all_values = []
    for i in range(len(product_db)):
        all_values.append(product_db[i][1].get(key_word))
    return all_values


while add_product == 1:
    create_product_dict(product_characteristic, product_dict)
    add_product_in_db(product_db, product_tuple, product_dict, count)
    product_dict = {}
    product_tuple = ()
    count = count + 1
    print("Добавить товар - 1, Закончить ввод - 0")
    add_product = int(input())


for i in product_characteristic.split():
    product_analytics[i] = all_key_values(product_db, i)


for i in product_db:
    print(i)
for i in product_analytics:
    print(i, product_analytics.get(i))