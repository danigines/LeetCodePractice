class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var currentIndex = 0
        var validCount = nums.count

        while currentIndex < validCount {
            if nums[currentIndex] == val {
                // Replace the unwanted value with an unchecked value from the end.
                nums[currentIndex] = nums[validCount - 1]
                validCount -= 1
            } else {
                currentIndex += 1
            }
        }

        return validCount
    }
}
