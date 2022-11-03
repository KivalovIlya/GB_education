class Road:

    def __init__(self, _length, _width):
        self._length = _length
        self._width = _width


    def calc_mass_road(self, mass, width):
        print(f"Масса асфальта составит: {self._length*self._width*mass*width/1000} т.")


msc_spb = Road(20, 5000)
msc_spb.calc_mass_road(25, 5)