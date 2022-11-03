from abc import ABC, abstractmethod


class Clothes(ABC):

    @abstractmethod
    def __init__(self, name, count):
        self.name = name
        self.count = count

    def all_materials():
        return jane_coat.count * jane_coat.coat_expenditure + mike_suit.count * mike_suit.suit_expenditure


class Coat(Clothes):

    def __init__(self, name, count, v):
        super().__init__(name, count)
        self.v = v

    @property
    def coat_expenditure(self):
        return self.v / 6.5 + 0.5


class Suit(Clothes):

    def __init__(self, name, count, h):
        super().__init__(name, count)
        self.h = h

    @property
    def suit_expenditure(self):
        return 2 * self.h + 0.3

jane_coat = Coat('Zara', 30, 52)
mike_suit = Suit('Gucci', 40, 172)
print(f'Материалов на 1 {jane_coat.name} - {jane_coat.coat_expenditure}')
print(f'Материалов на 1 {mike_suit.name} - {mike_suit.suit_expenditure}')
print(f'Материалов на {jane_coat.count} {jane_coat.name}, {mike_suit.count} {mike_suit.name} = {Clothes.all_materials()}')