class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let columns = board[0].count
        let letters = Array(word)
        let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        var visited = Array(
            repeating: Array(repeating: false, count: columns),
            count: rows
        )

        guard letters.count <= rows * columns else {
            return false
        }

        func isInside(_ row: Int, _ column: Int) -> Bool {
            row >= 0 && row < rows && column >= 0 && column < columns
        }

        func search(_ row: Int, _ column: Int, _ index: Int) -> Bool {
            guard board[row][column] == letters[index] else {
                return false
            }

            if index == letters.count - 1 {
                return true
            }

            visited[row][column] = true

            for (rowOffset, columnOffset) in directions {
                let nextRow = row + rowOffset
                let nextColumn = column + columnOffset

                if isInside(nextRow, nextColumn),
                   !visited[nextRow][nextColumn],
                   search(nextRow, nextColumn, index + 1) {
                    visited[row][column] = false
                    return true
                }
            }

            visited[row][column] = false
            return false
        }

        for row in 0..<rows {
            for column in 0..<columns {
                if search(row, column, 0) {
                    return true
                }
            }
        }

        return false
    }
}
