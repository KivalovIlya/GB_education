class Worker:

    def __init__(self, name, surname, position, wage, bonus):
        self.name = name
        self.surname = surname
        self.position = position
        self._income = {"wage": wage, "bonus": bonus}


class Position(Worker):

    def get_full_name(self):
        print(self.name, self.surname)


    def get_total_income(self):
        print(sum(self._income.values()))


admin = Position('ilya', 'kivalov', 'developer', 250000, 15000)

admin.get_full_name()
admin.get_total_income()