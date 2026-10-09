class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.count
        let columns = matrix[0].count
        var left = 0
        var right = rows * columns - 1

        while left <= right {
            let middle = left + (right - left) / 2
            let value = matrix[middle / columns][middle % columns]

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
