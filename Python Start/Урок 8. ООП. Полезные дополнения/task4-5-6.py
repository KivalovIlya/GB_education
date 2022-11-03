class Storage:
    printer = []
    scanner = []
    xerox = []

    @staticmethod
    def check_storage():
        # просмотр техники всей на складе
        for el in Storage.printer:
            print(f"Принтер | Модель - {el['model']}, Цветопечать - {el['color']}, Количество - {el['count']}")
        for el in Storage.scanner:
            print(f"Сканер | Модель - {el['model']}, Тип - {el['type_scan']}, Количество - {el['count']}")
        for el in Storage.xerox:
            print(f"Ксерокс | Модель - {el['model']}, Цветоскан - {el['color']}, Количество - {el['count']}")

    @staticmethod
    def send_office():
        print('Какую технику отправить?\n1 - Принтер\n2 - Сканер\n3 - Ксерокс')
        try:
            user_choice = int(input('Введите номер техники - '))
            if user_choice == 1:
                model = input('Введите модель - ')
                count = int(input('Введите количество - '))
                for el in Storage.printer:
                    if el['model'] == model:
                        el['count'] = el['count'] - count
            if user_choice == 2:
                model = input('Введите модель - ')
                count = int(input('Введите количество - '))
                for el in Storage.scanner:
                    if el['model'] == model:
                        el['count'] = el['count'] - count
            if user_choice == 3:
                model = input('Введите модель - ')
                count = int(input('Введите количество - '))
                for el in Storage.xerox:
                    if el['model'] == model:
                        el['count'] = el['count'] - count
        except Exception:
            print('hyi')

class OfficeEquipment:
    def __init__(self, model, count):
        self.model = model
        self.count = count


class Printer(OfficeEquipment):
    def __init__(self, model, color, count):
        super().__init__(model, count)
        self.color = color

    def place_on_storage(self):
        # размещение техники на склад
        Storage.printer.append({'model': self.model, 'color': self.color, 'count': self.count})


class Scanner(OfficeEquipment):
    def __init__(self, model, type_scan, count):
        super().__init__(model, count)
        self.type_scan = type_scan

    def place_on_storage(self):
        # размещение техники на склад
        Storage.scanner.append({'model': self.model, 'type_scan': self.type_scan, 'count': self.count})


class Xerox(OfficeEquipment):
    def __init__(self, model, color, count):
        super().__init__(model, count)
        self.color = color

    def place_on_storage(self):
        # размещение техники на склад
        Storage.xerox.append({'model': self.model, 'color': self.color, 'count': self.count})


printer_1 = Printer('GJT3910', True, 3)
printer_2 = Printer('BKFL294', False, 2)
printer_3 = Printer('BBKF222', True, 1)
printer_4 = Printer('LKFJR12', False, 5)
printer_1.place_on_storage()
printer_2.place_on_storage()
printer_3.place_on_storage()
printer_4.place_on_storage()
Storage.check_storage()
Storage.send_office()
Storage.check_storage()