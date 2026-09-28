class Solution {
    func totalNQueens(_ n: Int) -> Int {
        let fullMask = (1 << n) - 1

        func countSolutions(
            _ columns: Int,
            _ descendingDiagonals: Int,
            _ ascendingDiagonals: Int
        ) -> Int {
            if columns == fullMask { return 1 }

            var total = 0
            var available = fullMask
                & ~(columns | descendingDiagonals | ascendingDiagonals)

            while available != 0 {
                let position = available & -available
                available &= available - 1

                total += countSolutions(
                    columns | position,
                    ((descendingDiagonals | position) << 1) & fullMask,
                    (ascendingDiagonals | position) >> 1
                )
            }

            return total
        }

        let half = n / 2
        var total = 0

        for column in 0..<half {
            let position = 1 << column
            total += countSolutions(
                position,
                (position << 1) & fullMask,
                position >> 1
            )
        }

        total *= 2

        if n % 2 == 1 {
            let centerPosition = 1 << half
            total += countSolutions(
                centerPosition,
                (centerPosition << 1) & fullMask,
                centerPosition >> 1
            )
        }

        return total
    }
}
