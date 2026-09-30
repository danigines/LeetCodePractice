class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        let lastIndex = nums.count - 1
        var farthestReach = 0

        for index in nums.indices {
            guard index <= farthestReach else { return false }

            farthestReach = max(farthestReach, index + nums[index])
            if farthestReach >= lastIndex { return true }
        }

        return false
    }
}
