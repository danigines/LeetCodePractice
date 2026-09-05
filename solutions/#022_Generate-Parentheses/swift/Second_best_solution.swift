class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var combinationsByPairCount = Array(repeating: [String](), count: n + 1)
        combinationsByPairCount[0] = [""]

        for pairCount in 1...n {
            for leftPairCount in 0..<pairCount {
                let rightPairCount = pairCount - 1 - leftPairCount

                // Place one valid group inside the first pair and another after it.
                for leftCombination in combinationsByPairCount[leftPairCount] {
                    for rightCombination in combinationsByPairCount[rightPairCount] {
                        combinationsByPairCount[pairCount].append(
                            "(" + leftCombination + ")" + rightCombination
                        )
                    }
                }
            }
        }

        return combinationsByPairCount[n]
    }
}
