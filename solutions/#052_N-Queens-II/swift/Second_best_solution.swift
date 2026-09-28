class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var usedColumns = Array(repeating: false, count: n)
        var usedDescendingDiagonals = Array(repeating: false, count: 2 * n - 1)
        var usedAscendingDiagonals = Array(repeating: false, count: 2 * n - 1)
        var total = 0

        func search(_ row: Int) {
            if row == n {
                total += 1
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

                usedColumns[column] = true
                usedDescendingDiagonals[descendingDiagonal] = true
                usedAscendingDiagonals[ascendingDiagonal] = true

                search(row + 1)

                usedColumns[column] = false
                usedDescendingDiagonals[descendingDiagonal] = false
                usedAscendingDiagonals[ascendingDiagonal] = false
            }
        }

        search(0)
        return total
    }
}
