class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        var result: [[Int]] = [[]]
        var previousResultCount = 0

        for index in sortedNums.indices {
            let isDuplicate = index > 0 && sortedNums[index] == sortedNums[index - 1]
            let start = isDuplicate ? previousResultCount : 0
            let currentResultCount = result.count

            for subsetIndex in start..<currentResultCount {
                result.append(result[subsetIndex] + [sortedNums[index]])
            }

            previousResultCount = currentResultCount
        }

        return result
    }
}
