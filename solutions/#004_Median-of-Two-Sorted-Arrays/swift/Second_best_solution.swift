class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let totalCount = nums1.count + nums2.count
        let medianIndex = totalCount / 2

        var firstIndex = 0
        var secondIndex = 0

        var previousValue = 0
        var currentValue = 0

        // Only merge until reaching the position required for the median.
        for _ in 0...medianIndex {
            previousValue = currentValue

            if firstIndex < nums1.count &&
                (secondIndex >= nums2.count || nums1[firstIndex] <= nums2[secondIndex]) {
                currentValue = nums1[firstIndex]
                firstIndex += 1
            } else {
                currentValue = nums2[secondIndex]
                secondIndex += 1
            }
        }

        // Odd totals need one middle value; even totals need the two middle values.
        if totalCount % 2 == 1 {
            return Double(currentValue)
        }

        return Double(previousValue + currentValue) / 2.0
    }
}
