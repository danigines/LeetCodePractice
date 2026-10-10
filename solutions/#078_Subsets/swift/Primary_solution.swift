class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var subset: [Int] = []

        func backtrack(_ start: Int) {
            results.append(subset)

            guard start < nums.count else {
                return
            }

            for index in start..<nums.count {
                subset.append(nums[index])
                backtrack(index + 1)
                subset.removeLast()
            }
        }

        backtrack(0)
        return results
    }
}
