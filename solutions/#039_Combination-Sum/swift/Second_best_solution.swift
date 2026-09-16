class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var combinations: [[Int]] = []
        var current: [Int] = []

        func search(_ index: Int, _ remaining: Int) {
            if remaining == 0 {
                combinations.append(current)
                return
            }

            if index == candidates.count { return }

            // Include the current candidate and stay on its index to reuse it.
            if candidates[index] <= remaining {
                current.append(candidates[index])
                search(index, remaining - candidates[index])
                current.removeLast()
            }

            // Or skip this candidate permanently and move forward.
            search(index + 1, remaining)
        }

        search(0, target)
        return combinations
    }
}
