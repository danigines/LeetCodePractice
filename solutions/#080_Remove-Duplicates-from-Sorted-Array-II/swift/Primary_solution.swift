class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var write = 0

        for read in nums.indices {
            let number = nums[read]

            if write < 2 || number != nums[write - 2] {
                nums[write] = number
                write += 1
            }
        }

        return write
    }
}
