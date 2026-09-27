class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var board = Array(
            repeating: Array(repeating: Character("."), count: n),
            count: n
        )
        var usedColumns = Array(repeating: false, count: n)
        var usedDescendingDiagonals = Array(repeating: false, count: 2 * n - 1)
        var usedAscendingDiagonals = Array(repeating: false, count: 2 * n - 1)
        var solutions = [[String]]()

        func search(_ row: Int) {
            if row == n {
                solutions.append(board.map { String($0) })
                return
            }

            for column in 0..<n {
                let descendingDiagonal = row - column + n - 1
                let ascendingDiagonal = row + column

                guard !usedColumns[column],
                      !usedDescendingDiagonals[descendingDiagonal],
                      !usedAscendingDiagonals[ascendingDiagonal] else {
                    continue
                }

                board[row][column] = "Q"
                usedColumns[column] = true
                usedDescendingDiagonals[descendingDiagonal] = true
                usedAscendingDiagonals[ascendingDiagonal] = true

                search(row + 1)

                board[row][column] = "."
                usedColumns[column] = false
                usedDescendingDiagonals[descendingDiagonal] = false
                usedAscendingDiagonals[ascendingDiagonal] = false
            }
        }

        search(0)
        return solutions
    }
}
