class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sortedCandidates = candidates.sorted()
        var combinations: [[Int]] = []
        var current: [Int] = []

        func search(_ startIndex: Int, _ remaining: Int) {
            if remaining == 0 {
                combinations.append(current)
                return
            }

            for index in startIndex..<sortedCandidates.count {
                let value = sortedCandidates[index]

                // Equal values at this depth would create the same combination.
                if index > startIndex && value == sortedCandidates[index - 1] {
                    continue
                }

                if value > remaining { break }

                current.append(value)
                search(index + 1, remaining - value) // Do not reuse this element.
                current.removeLast()
            }
        }

        search(0, target)
        return combinations
    }
}
