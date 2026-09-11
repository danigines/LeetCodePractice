class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }

        var pivot = nums.count - 2

        // Find the first position from the right that can be increased.
        while pivot >= 0 && nums[pivot] >= nums[pivot + 1] {
            pivot -= 1
        }

        if pivot >= 0 {
            var successor = nums.count - 1

            // The suffix is descending, so the first greater value from the right
            // is the smallest value that can replace the pivot.
            while nums[successor] <= nums[pivot] {
                successor -= 1
            }

            nums.swapAt(pivot, successor)
        }

        // The remaining suffix is descending; reverse it to obtain its lowest order.
        var left = pivot + 1
        var right = nums.count - 1

        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}
