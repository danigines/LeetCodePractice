class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var currentSum = nums[0]
        var bestSum = nums[0]

        for value in nums.dropFirst() {
            currentSum = max(value, currentSum + value)
            bestSum = max(bestSum, currentSum)
        }

        return bestSum
    }
}
