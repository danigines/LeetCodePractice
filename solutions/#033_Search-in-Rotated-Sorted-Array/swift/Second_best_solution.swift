class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let rotationIndex = findRotationIndex(nums)

        if nums[rotationIndex] <= target && target <= nums[nums.count - 1] {
            return binarySearch(nums, target, rotationIndex, nums.count - 1)
        }

        return binarySearch(nums, target, 0, rotationIndex - 1)
    }

    private func findRotationIndex(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1

        while left < right {
            let middle = left + (right - left) / 2

            if nums[middle] > nums[right] {
                left = middle + 1
            } else {
                right = middle
            }
        }

        return left
    }

    private func binarySearch(
        _ nums: [Int],
        _ target: Int,
        _ start: Int,
        _ end: Int
    ) -> Int {
        var left = start
        var right = end

        while left <= right {
            let middle = left + (right - left) / 2

            if nums[middle] == target {
                return middle
            } else if nums[middle] < target {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }

        return -1
    }
}
