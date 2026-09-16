class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        var rowMasks = Array(repeating: 0, count: 9)
        var columnMasks = Array(repeating: 0, count: 9)
        var boxMasks = Array(repeating: 0, count: 9)
        let digits = Array("123456789")

        for row in 0..<9 {
            for column in 0..<9 where board[row][column] != "." {
                let digit = Int(board[row][column].asciiValue! - 49)
                let bit = 1 << digit
                let box = (row / 3) * 3 + column / 3
                rowMasks[row] |= bit
                columnMasks[column] |= bit
                boxMasks[box] |= bit
            }
        }

        _ = solve(&board, &rowMasks, &columnMasks, &boxMasks, digits)
    }

    private func solve(
        _ board: inout [[Character]],
        _ rowMasks: inout [Int],
        _ columnMasks: inout [Int],
        _ boxMasks: inout [Int],
        _ digits: [Character]
    ) -> Bool {
        var bestRow = -1
        var bestColumn = -1
        var bestCandidates = 0
        var fewestCandidates = 10

        // Choose the empty cell with the fewest legal digits.
        for row in 0..<9 {
            for column in 0..<9 where board[row][column] == "." {
                let box = (row / 3) * 3 + column / 3
                let candidates = 0x1FF & ~(rowMasks[row] | columnMasks[column] | boxMasks[box])
                let count = candidates.nonzeroBitCount

                if count == 0 { return false }

                if count < fewestCandidates {
                    bestRow = row
                    bestColumn = column
                    bestCandidates = candidates
                    fewestCandidates = count
                }
            }
        }

        if bestRow == -1 { return true }

        let box = (bestRow / 3) * 3 + bestColumn / 3

        for digit in 0..<9 {
            let bit = 1 << digit
            if bestCandidates & bit == 0 { continue }

            board[bestRow][bestColumn] = digits[digit]
            rowMasks[bestRow] |= bit
            columnMasks[bestColumn] |= bit
            boxMasks[box] |= bit

            if solve(&board, &rowMasks, &columnMasks, &boxMasks, digits) {
                return true
            }

            // Undo the tentative choice before trying another digit.
            board[bestRow][bestColumn] = "."
            rowMasks[bestRow] &= ~bit
            columnMasks[bestColumn] &= ~bit
            boxMasks[box] &= ~bit
        }

        return false
    }
}
