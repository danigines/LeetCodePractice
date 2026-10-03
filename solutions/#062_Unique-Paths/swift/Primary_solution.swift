class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        let downMoves = m - 1
        let rightMoves = n - 1
        let totalMoves = downMoves + rightMoves
        let chosenMoves = min(downMoves, rightMoves)

        guard chosenMoves > 0 else { return 1 }

        var result: Int64 = 1

        for step in 1...chosenMoves {
            result = result * Int64(totalMoves - chosenMoves + step)
                / Int64(step)
        }

        return Int(result)
    }
}
