class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var write = 1
        var previous = nums[0]
        var occurrenceCount = 1

        for read in 1..<nums.count {
            if nums[read] == previous {
                occurrenceCount += 1
            } else {
                previous = nums[read]
                occurrenceCount = 1
            }

            if occurrenceCount <= 2 {
                nums[write] = nums[read]
                write += 1
            }
        }

        return write
    }
}
