class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let firstPosition = lowerBound(nums, target)

        guard firstPosition < nums.count, nums[firstPosition] == target else {
            return [-1, -1]
        }

        let lastPosition = upperBound(nums, target) - 1
        return [firstPosition, lastPosition]
    }

    private func lowerBound(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count

        // Find the first index whose value is greater than or equal to target.
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

    private func upperBound(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count

        // Find the first index whose value is strictly greater than target.
        while left < right {
            let middle = left + (right - left) / 2

            if nums[middle] <= target {
                left = middle + 1
            } else {
                right = middle
            }
        }

        return left
    }
}
