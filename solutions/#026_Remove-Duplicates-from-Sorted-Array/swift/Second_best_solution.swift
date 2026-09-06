class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var seenValues: Set<Int> = []
        var uniqueValues: [Int] = []

        for number in nums {
            // The sorted traversal preserves the original order of unique values.
            if seenValues.insert(number).inserted {
                uniqueValues.append(number)
            }
        }

        for index in uniqueValues.indices {
            nums[index] = uniqueValues[index]
        }

        return uniqueValues.count
    }
}
