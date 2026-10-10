class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let columns = board[0].count
        var letters = Array(word)

        guard letters.count <= rows * columns else {
            return false
        }

        var boardCounts: [Character: Int] = [:]

        for row in board {
            for character in row {
                boardCounts[character, default: 0] += 1
            }
        }

        var wordCounts: [Character: Int] = [:]

        for character in letters {
            wordCounts[character, default: 0] += 1
        }

        for (character, count) in wordCounts {
            guard boardCounts[character, default: 0] >= count else {
                return false
            }
        }

        if boardCounts[letters[0], default: 0] > boardCounts[letters[letters.count - 1], default: 0] {
            letters.reverse()
        }

        let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        var visited: Set<Int> = []

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

            let position = row * columns + column
            visited.insert(position)

            for (rowOffset, columnOffset) in directions {
                let nextRow = row + rowOffset
                let nextColumn = column + columnOffset

                guard isInside(nextRow, nextColumn) else {
                    continue
                }

                let nextPosition = nextRow * columns + nextColumn

                if !visited.contains(nextPosition),
                   search(nextRow, nextColumn, index + 1) {
                    visited.remove(position)
                    return true
                }
            }

            visited.remove(position)
            return false
        }

        for row in 0..<rows {
            for column in 0..<columns where board[row][column] == letters[0] {
                if search(row, column, 0) {
                    return true
                }
            }
        }

        return false
    }
}
