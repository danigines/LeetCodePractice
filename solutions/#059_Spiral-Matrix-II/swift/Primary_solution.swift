class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = Array(
            repeating: Array(repeating: 0, count: n),
            count: n
        )
        var top = 0
        var bottom = n - 1
        var left = 0
        var right = n - 1
        var value = 1

        while top <= bottom && left <= right {
            for column in left...right {
                matrix[top][column] = value
                value += 1
            }
            top += 1

            if top <= bottom {
                for row in top...bottom {
                    matrix[row][right] = value
                    value += 1
                }
            }
            right -= 1

            if top <= bottom && left <= right {
                for column in stride(from: right, through: left, by: -1) {
                    matrix[bottom][column] = value
                    value += 1
                }
                bottom -= 1
            }

            if top <= bottom && left <= right {
                for row in stride(from: bottom, through: top, by: -1) {
                    matrix[row][left] = value
                    value += 1
                }
                left += 1
            }
        }

        return matrix
    }
}
