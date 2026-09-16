class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
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

                // Later candidates are even larger, so none can fit.
                if value > remaining { break }

                current.append(value)
                search(index, remaining - value) // Reuse this candidate.
                current.removeLast()
            }
        }

        search(0, target)
        return combinations
    }
}
