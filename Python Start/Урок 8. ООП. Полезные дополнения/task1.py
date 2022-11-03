import datetime


class Date:
    def __init__(self, user_date):
        self.user_date = user_date

    @classmethod
    def str_to_int(cls, self):
        # преобразование даты в тип чисел
        numbers = list(map(int, self.user_date.split('-')))
        Date.valid_date(numbers)
        return numbers


    @staticmethod
    def valid_date(numbers):
        try:
            datetime.date(numbers[2], numbers[1], numbers[0])
            print('Дата валидна')
        except Exception as f:
            print(f'Неверная дата. Ошибка - {f}')



to_day = Date('11-10-2021')
Date.str_to_int(to_day)