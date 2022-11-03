class Stationery:
    title = ''

    def draw(self):
        print("Запуск отрисовки")

class Pen(Stationery):
    title = "Ручка"

    def draw(self):
        print(f"{self.title} - хорошо пишет")

class Pencil(Stationery):
    title = "Карандаш"

    def draw(self):
        print(f"{self.title} - отлично чертит")

class Handle(Stationery):
    title = "Маркер"

    def draw(self):
        print(f"{self.title} - четко маркирует")

brauberg = Pen()
kores = Pencil()
zig = Handle()

brauberg.draw()
kores.draw()
zig.draw()