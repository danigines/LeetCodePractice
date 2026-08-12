class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // Binary search the smaller array to minimize the search space.
        if nums1.count > nums2.count {
            return findMedianSortedArrays(nums2, nums1)
        }

        let firstCount = nums1.count
        let secondCount = nums2.count
        let leftSize = (firstCount + secondCount + 1) / 2

        var low = 0
        var high = firstCount

        while low <= high {
            let firstPartition = (low + high) / 2
            let secondPartition = leftSize - firstPartition

            // Sentinels handle partitions at the beginning or end of an array.
            let firstLeft = firstPartition == 0 ? Int.min : nums1[firstPartition - 1]
            let firstRight = firstPartition == firstCount ? Int.max : nums1[firstPartition]

            let secondLeft = secondPartition == 0 ? Int.min : nums2[secondPartition - 1]
            let secondRight = secondPartition == secondCount ? Int.max : nums2[secondPartition]

            // A valid partition has every left-side value <= every right-side value.
            if firstLeft <= secondRight && secondLeft <= firstRight {
                if (firstCount + secondCount) % 2 == 1 {
                    return Double(max(firstLeft, secondLeft))
                }

                let leftMax = max(firstLeft, secondLeft)
                let rightMin = min(firstRight, secondRight)

                return Double(leftMax + rightMin) / 2.0
            }

            // Adjust the partition using the ordering violation.
            if firstLeft > secondRight {
                high = firstPartition - 1
            } else {
                low = firstPartition + 1
            }
        }

        return 0.0
    }
}
