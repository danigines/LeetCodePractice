class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var writeIndex = 0

        for number in nums {
            // Copy only the values that belong in the valid prefix.
            if number != val {
                nums[writeIndex] = number
                writeIndex += 1
            }
        }

        return writeIndex
    }
}
