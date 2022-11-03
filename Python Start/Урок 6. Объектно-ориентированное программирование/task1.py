import time


class TrafficLight:
    __color = ''

    def running(self):
        TrafficLight.__color = 'Красный'
        print(TrafficLight.__color)
        time.sleep(7)
        TrafficLight.__color = 'Желтый'
        print(TrafficLight.__color)
        time.sleep(2)
        TrafficLight.__color = 'Зеленый'
        print(TrafficLight.__color)
        time.sleep(12)


tl_fontanka = TrafficLight()
tl_fontanka.running()