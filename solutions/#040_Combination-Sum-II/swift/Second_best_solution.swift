class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sortedCandidates = candidates.sorted()
        var groups: [(value: Int, count: Int)] = []

        for value in sortedCandidates {
            if let lastIndex = groups.indices.last, groups[lastIndex].value == value {
                groups[lastIndex].count += 1
            } else {
                groups.append((value, 1))
            }
        }

        var combinations: [[Int]] = []
        var current: [Int] = []

        func search(_ groupIndex: Int, _ remaining: Int) {
            if remaining == 0 {
                combinations.append(current)
                return
            }

            if groupIndex == groups.count { return }

            let group = groups[groupIndex]
            let maximumCount = min(group.count, remaining / group.value)

            // Choose how many copies of this value to use, from zero upward.
            for quantity in 0...maximumCount {
                if quantity > 0 { current.append(group.value) }
                search(groupIndex + 1, remaining - quantity * group.value)
            }

            for _ in 0..<maximumCount { current.removeLast() }
        }

        search(0, target)
        return combinations
    }
}
