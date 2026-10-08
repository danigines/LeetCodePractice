class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let columns = matrix[0].count
        var firstRowHasZero = false
        var firstColumnHasZero = false

        for column in 0..<columns where matrix[0][column] == 0 {
            firstRowHasZero = true
        }

        for row in 0..<rows where matrix[row][0] == 0 {
            firstColumnHasZero = true
        }

        for row in 1..<rows {
            for column in 1..<columns where matrix[row][column] == 0 {
                matrix[row][0] = 0
                matrix[0][column] = 0
            }
        }

        for row in 1..<rows {
            for column in 1..<columns {
                if matrix[row][0] == 0 || matrix[0][column] == 0 {
                    matrix[row][column] = 0
                }
            }
        }

        if firstRowHasZero {
            for column in 0..<columns {
                matrix[0][column] = 0
            }
        }

        if firstColumnHasZero {
            for row in 0..<rows {
                matrix[row][0] = 0
            }
        }
    }
}
