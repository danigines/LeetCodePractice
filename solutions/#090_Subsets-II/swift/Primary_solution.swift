class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        var result: [[Int]] = []
        var subset: [Int] = []

        func backtrack(_ start: Int) {
            result.append(subset)

            guard start < sortedNums.count else { return }

            for index in start..<sortedNums.count {
                if index > start, sortedNums[index] == sortedNums[index - 1] {
                    continue
                }

                subset.append(sortedNums[index])
                backtrack(index + 1)
                subset.removeLast()
            }
        }

        backtrack(0)
        return result
    }
}
