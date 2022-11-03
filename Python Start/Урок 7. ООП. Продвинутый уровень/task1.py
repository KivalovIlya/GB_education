class Matrix:
    def __init__(self, list_matrix):
        self.list_matrix = list_matrix

    def __str__(self):
        self.view_matrix = ''
        for el in self.list_matrix:
            self.view_matrix += str(el)
            self.view_matrix += '\n'
        return self.view_matrix

    def __add__(self, other):
        line_matrix = []
        sum_matrix = []
        for i in range(len(self.list_matrix)):
            for j in range(len(self.list_matrix[i])):
                line_matrix.append(self.list_matrix[i][j] + other.list_matrix[i][j])
            sum_matrix.append(line_matrix)
            line_matrix = []
        return Matrix(sum_matrix)


matrix_first = [[2, 5, 9], [3, 0, 6], [4, 5, 1]]
matrix_second = [[1, 0, 4], [2, 9, 3], [7, 5, 1]]

ma_1 = Matrix(matrix_first)
ma_2 = Matrix(matrix_second)

ma_3 = ma_1 + ma_2
print(ma_3)