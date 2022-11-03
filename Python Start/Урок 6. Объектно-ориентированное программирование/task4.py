class Car:
    def __init__(self, speed, color, name, is_police):
        self.speed = speed
        self.color = color
        self.name = name
        self.is_police = is_police

    def go(self):
        print("Машина поехала")

    def stop(self):
        print("Машина остановилась")

    def turn_direction(self, direction):
        print(f"Машина, свернула {direction}")

    def show_speed(self):
        print(f"Автомобиль движется со скоростью {self.speed}")

class TownCar(Car):

    def show_speed(self):
        if self.speed > 60:
            print("Превышение скорости")

class SportCar(Car):

    def press_shift(self):
        print("РЕЖИМ НИТРО АКТИВИРОВАН")

class WorkCar(Car):

    def show_speed(self):
        if self.speed > 40:
            print("Превышение скорости")

class PoliceCar(Car):
    pass

my_car = Car(120, 'red', 'lada', False)
my_car.go()
my_car.show_speed()
my_car.turn_direction('налево')
next_car = WorkCar(90, 'green', 'mercedes', False)
next_car.show_speed()