class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowMasks = Array(repeating: 0, count: 9)
        var columnMasks = Array(repeating: 0, count: 9)
        var boxMasks = Array(repeating: 0, count: 9)

        for row in 0..<9 {
            for column in 0..<9 {
                let value = board[row][column]

                guard value != "." else { continue }

                let digit = Int(value.asciiValue! - 49)
                let bit = 1 << digit
                let box = (row / 3) * 3 + column / 3

                if rowMasks[row] & bit != 0 ||
                    columnMasks[column] & bit != 0 ||
                    boxMasks[box] & bit != 0 {
                    return false
                }

                rowMasks[row] |= bit
                columnMasks[column] |= bit
                boxMasks[box] |= bit
            }
        }

        return true
    }
}
