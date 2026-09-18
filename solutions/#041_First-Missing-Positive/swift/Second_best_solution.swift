class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let present = Set(nums)
        var candidate = 1

        while present.contains(candidate) {
            candidate += 1
        }

        return candidate
    }
}
