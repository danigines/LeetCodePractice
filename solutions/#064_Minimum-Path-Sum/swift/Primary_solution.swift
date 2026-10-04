class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let columns = grid[0].count
        var minimumSums = Array(repeating: 0, count: columns)

        for row in 0..<rows {
            for column in 0..<columns {
                if row == 0 && column == 0 {
                    minimumSums[column] = grid[row][column]
                } else if row == 0 {
                    minimumSums[column] = minimumSums[column - 1] + grid[row][column]
                } else if column == 0 {
                    minimumSums[column] += grid[row][column]
                } else {
                    minimumSums[column] = min(
                        minimumSums[column],
                        minimumSums[column - 1]
                    ) + grid[row][column]
                }
            }
        }

        return minimumSums[columns - 1]
    }
}
