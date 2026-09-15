class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count

        // Find the first position whose value is greater than or equal to target.
        while left < right {
            let middle = left + (right - left) / 2

            if nums[middle] < target {
                left = middle + 1
            } else {
                right = middle
            }
        }

        return left
    }
}
