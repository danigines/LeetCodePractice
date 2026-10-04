class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let rows = obstacleGrid.count
        let columns = obstacleGrid[0].count
        var paths = Array(repeating: 0, count: columns)
        paths[0] = 1

        for row in 0..<rows {
            for column in 0..<columns {
                if obstacleGrid[row][column] == 1 {
                    paths[column] = 0
                } else if column > 0 {
                    paths[column] += paths[column - 1]
                }
            }
        }

        return paths[columns - 1]
    }
}
