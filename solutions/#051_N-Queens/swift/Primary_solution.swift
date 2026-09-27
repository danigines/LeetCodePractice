class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        let fullMask = (1 << n) - 1
        var queenColumns = Array(repeating: -1, count: n)
        var solutions = [[String]]()

        func buildBoard() -> [String] {
            queenColumns.map { queenColumn in
                var row = Array(repeating: Character("."), count: n)
                row[queenColumn] = "Q"
                return String(row)
            }
        }

        func search(
            _ row: Int,
            _ columns: Int,
            _ descendingDiagonals: Int,
            _ ascendingDiagonals: Int
        ) {
            if row == n {
                solutions.append(buildBoard())
                return
            }

            var available = fullMask
                & ~(columns | descendingDiagonals | ascendingDiagonals)

            while available != 0 {
                let position = available & -available
                available &= available - 1
                queenColumns[row] = position.trailingZeroBitCount

                search(
                    row + 1,
                    columns | position,
                    ((descendingDiagonals | position) << 1) & fullMask,
                    (ascendingDiagonals | position) >> 1
                )
            }
        }

        search(0, 0, 0, 0)
        return solutions
    }
}
