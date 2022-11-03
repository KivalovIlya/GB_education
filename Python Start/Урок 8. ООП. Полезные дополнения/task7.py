# complex: 2 + 3i

class ComplexNumber:
    def __init__(self, real, imaginary):
        self.real = real
        self.imaginary = imaginary

    def __add__(self, other):
        # сложение комплексных чисел
        real = self.real + other.real
        imaginary = str(int(self.imaginary[:-1]) + int(other.imaginary[:-1])) + 'i'
        return f'{real} + {imaginary}'

    def __mul__(self, other):
        # умножение комплексных чисел
        real = self.real * other.real
        imaginary = str(int(self.imaginary[:-1]) * int(other.imaginary[:-1])) + 'i'
        return f'{real} + {imaginary}'


complex_a = ComplexNumber(4, '2i')
complex_b = ComplexNumber(2, '3i')
print(complex_a + complex_b)
print(complex_a * complex_b)