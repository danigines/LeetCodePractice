class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }

        var writeIndex = 1

        for readIndex in 1..<nums.count {
            // A value is unique when it differs from the last value we kept.
            if nums[readIndex] != nums[writeIndex - 1] {
                nums[writeIndex] = nums[readIndex]
                writeIndex += 1
            }
        }

        return writeIndex
    }
}
