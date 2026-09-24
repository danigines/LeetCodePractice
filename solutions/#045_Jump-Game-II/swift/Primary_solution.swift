class Solution {
    func jump(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }

        var jumps = 0
        var currentBoundary = 0
        var farthestReach = 0

        for index in 0..<(nums.count - 1) {
            farthestReach = max(farthestReach, index + nums[index])

            if index == currentBoundary {
                jumps += 1
                currentBoundary = farthestReach
            }
        }

        return jumps
    }
}
