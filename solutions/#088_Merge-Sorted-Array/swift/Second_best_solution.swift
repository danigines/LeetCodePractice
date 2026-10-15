class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var merged: [Int] = []
        merged.reserveCapacity(m + n)
        var first = 0
        var second = 0

        while first < m, second < n {
            if nums1[first] <= nums2[second] {
                merged.append(nums1[first])
                first += 1
            } else {
                merged.append(nums2[second])
                second += 1
            }
        }

        if first < m {
            merged.append(contentsOf: nums1[first..<m])
        }

        if second < n {
            merged.append(contentsOf: nums2[second..<n])
        }

        nums1 = merged
    }
}
