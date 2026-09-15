class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let middle = left + (right - left) / 2

            if nums[middle] < target {
                left = middle + 1
            } else if nums[middle] > target {
                right = middle - 1
            } else {
                var firstPosition = middle
                var lastPosition = middle

                while firstPosition > 0 && nums[firstPosition - 1] == target {
                    firstPosition -= 1
                }

                while lastPosition + 1 < nums.count && nums[lastPosition + 1] == target {
                    lastPosition += 1
                }

                return [firstPosition, lastPosition]
            }
        }

        return [-1, -1]
    }
}
