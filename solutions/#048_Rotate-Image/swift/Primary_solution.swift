class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let size = matrix.count

        // Reflect across the main diagonal.
        for row in 0..<size {
            for column in (row + 1)..<size {
                let value = matrix[row][column]
                matrix[row][column] = matrix[column][row]
                matrix[column][row] = value
            }
        }

        // Reflect across the vertical axis.
        for row in 0..<size {
            matrix[row].reverse()
        }
    }
}
