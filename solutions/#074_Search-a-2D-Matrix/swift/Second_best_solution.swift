class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var top = 0
        var bottom = matrix.count - 1
        var candidateRow = -1

        while top <= bottom {
            let middle = top + (bottom - top) / 2

            if matrix[middle][0] <= target {
                candidateRow = middle
                top = middle + 1
            } else {
                bottom = middle - 1
            }
        }

        guard candidateRow != -1 else {
            return false
        }

        var left = 0
        var right = matrix[candidateRow].count - 1

        while left <= right {
            let middle = left + (right - left) / 2
            let value = matrix[candidateRow][middle]

            if value == target {
                return true
            } else if value < target {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }

        return false
    }
}
