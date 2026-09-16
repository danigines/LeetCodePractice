class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        _ = solve(&board)
    }

    private func solve(_ board: inout [[Character]]) -> Bool {
        for row in 0..<9 {
            for column in 0..<9 where board[row][column] == "." {
                for digit in Array("123456789") {
                    if !isValid(board, row, column, digit) { continue }

                    board[row][column] = digit

                    if solve(&board) { return true }

                    board[row][column] = "."
                }

                // No digit worked for this empty cell.
                return false
            }
        }

        return true
    }

    private func isValid(_ board: [[Character]], _ row: Int, _ column: Int, _ digit: Character) -> Bool {
        for index in 0..<9 {
            if board[row][index] == digit || board[index][column] == digit {
                return false
            }

            let boxRow = (row / 3) * 3 + index / 3
            let boxColumn = (column / 3) * 3 + index % 3
            if board[boxRow][boxColumn] == digit { return false }
        }

        return true
    }
}
