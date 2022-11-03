class Cell:
    def __init__(self, count):
        self.count = int(count)

    def __add__(self, other):
        return Cell(self.count + other.count)

    def __sub__(self, other):
        if self.count > other.count:
            return Cell(self.count - other.count)
        else:
            print('Вычитание невозможно, кол-во ячеек в первой клетке меньше чем во второй')

    def __mul__(self, other):
        return Cell(self.count * other.count)

    def __truediv__(self, other):
        return Cell(self.count // other.count)

    def make_order(self, row):
        cell_print = ''
        for _ in range(self.count // row):
            cell_print += '*' * row
            cell_print += '\n'
        cell_print += '*' * (self.count % row)
        cell_print += '\n'
        return cell_print



first_cell = Cell(12)
second_cell = Cell(5)

third_cell = first_cell / second_cell
print(first_cell.make_order(5))