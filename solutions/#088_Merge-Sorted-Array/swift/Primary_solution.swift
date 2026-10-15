class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var first = m - 1
        var second = n - 1
        var write = m + n - 1

        while second >= 0 {
            if first >= 0, nums1[first] > nums2[second] {
                nums1[write] = nums1[first]
                first -= 1
            } else {
                nums1[write] = nums2[second]
                second -= 1
            }

            write -= 1
        }
    }
}
