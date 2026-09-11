class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }

        var pivot = nums.count - 2

        while pivot >= 0 && nums[pivot] >= nums[pivot + 1] {
            pivot -= 1
        }

        if pivot >= 0 {
            var successor = pivot + 1

            // Find the smallest suffix value that is greater than the pivot.
            for index in (pivot + 1)..<nums.count {
                if nums[index] > nums[pivot] && nums[index] <= nums[successor] {
                    successor = index
                }
            }

            nums.swapAt(pivot, successor)
        }

        // Selection sort places the suffix in its lowest possible order in-place.
        let suffixStart = pivot + 1

        if suffixStart < nums.count - 1 {
            for current in suffixStart..<(nums.count - 1) {
                var minimumIndex = current

                for candidate in (current + 1)..<nums.count {
                    if nums[candidate] < nums[minimumIndex] {
                        minimumIndex = candidate
                    }
                }

                nums.swapAt(current, minimumIndex)
            }
        }
    }
}
