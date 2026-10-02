class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = Array(
            repeating: Array(repeating: 0, count: n),
            count: n
        )
        let rowDirections = [0, 1, 0, -1]
        let columnDirections = [1, 0, -1, 0]
        var row = 0
        var column = 0
        var direction = 0

        for value in 1...(n * n) {
            matrix[row][column] = value
            if value == n * n { break }

            var nextRow = row + rowDirections[direction]
            var nextColumn = column + columnDirections[direction]

            if nextRow < 0 || nextRow >= n
                || nextColumn < 0 || nextColumn >= n
                || matrix[nextRow][nextColumn] != 0 {
                direction = (direction + 1) % 4
                nextRow = row + rowDirections[direction]
                nextColumn = column + columnDirections[direction]
            }

            row = nextRow
            column = nextColumn
        }

        return matrix
    }
}
