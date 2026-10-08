class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let columns = matrix[0].count
        var zeroRows = Array(repeating: false, count: rows)
        var zeroColumns = Array(repeating: false, count: columns)

        for row in 0..<rows {
            for column in 0..<columns where matrix[row][column] == 0 {
                zeroRows[row] = true
                zeroColumns[column] = true
            }
        }

        for row in 0..<rows {
            for column in 0..<columns {
                if zeroRows[row] || zeroColumns[column] {
                    matrix[row][column] = 0
                }
            }
        }
    }
}
