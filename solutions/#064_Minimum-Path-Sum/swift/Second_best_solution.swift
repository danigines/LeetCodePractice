class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let columns = grid[0].count
        var memo = Array(
            repeating: Array(repeating: -1, count: columns),
            count: rows
        )

        func minimumSum(_ row: Int, _ column: Int) -> Int {
            if row < 0 || column < 0 {
                return Int.max
            }

            if row == 0 && column == 0 {
                return grid[0][0]
            }

            if memo[row][column] != -1 {
                return memo[row][column]
            }

            memo[row][column] = grid[row][column] + min(
                minimumSum(row - 1, column),
                minimumSum(row, column - 1)
            )
            return memo[row][column]
        }

        return minimumSum(rows - 1, columns - 1)
    }
}
