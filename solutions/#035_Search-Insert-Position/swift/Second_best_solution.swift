class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        for (index, number) in nums.enumerated() {
            if number >= target {
                return index
            }
        }

        return nums.count
    }
}
