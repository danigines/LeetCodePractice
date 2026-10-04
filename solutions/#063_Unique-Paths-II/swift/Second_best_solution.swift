class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let rows = obstacleGrid.count
        let columns = obstacleGrid[0].count
        var memo = Array(
            repeating: Array(repeating: -1, count: columns),
            count: rows
        )

        func countPaths(_ row: Int, _ column: Int) -> Int {
            if row >= rows || column >= columns || obstacleGrid[row][column] == 1 {
                return 0
            }

            if row == rows - 1 && column == columns - 1 {
                return 1
            }

            if memo[row][column] != -1 {
                return memo[row][column]
            }

            memo[row][column] = countPaths(row + 1, column)
                + countPaths(row, column + 1)
            return memo[row][column]
        }

        return countPaths(0, 0)
    }
}
