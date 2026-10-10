class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        let subsetCount = 1 << nums.count
        var results: [[Int]] = []
        results.reserveCapacity(subsetCount)

        for mask in 0..<subsetCount {
            var subset: [Int] = []

            for index in nums.indices {
                if mask & (1 << index) != 0 {
                    subset.append(nums[index])
                }
            }

            results.append(subset)
        }

        return results
    }
}
