class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let rows = matrix.count
        let columns = matrix[0].count
        let rowDirections = [0, 1, 0, -1]
        let columnDirections = [1, 0, -1, 0]
        var visited = Array(
            repeating: Array(repeating: false, count: columns),
            count: rows
        )
        var result = [Int]()
        var row = 0
        var column = 0
        var direction = 0

        for _ in 0..<(rows * columns) {
            result.append(matrix[row][column])
            visited[row][column] = true

            var nextRow = row + rowDirections[direction]
            var nextColumn = column + columnDirections[direction]

            if nextRow < 0 || nextRow >= rows
                || nextColumn < 0 || nextColumn >= columns
                || visited[nextRow][nextColumn] {
                direction = (direction + 1) % 4
                nextRow = row + rowDirections[direction]
                nextColumn = column + columnDirections[direction]
            }

            row = nextRow
            column = nextColumn
        }

        return result
    }
}
