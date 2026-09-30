class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        let lastIndex = nums.count - 1
        var reachable = Array(repeating: false, count: nums.count)
        reachable[0] = true

        for index in nums.indices where reachable[index] {
            if index == lastIndex { return true }

            let farthestReach = min(lastIndex, index + nums[index])
            guard index < farthestReach else { continue }

            for destination in (index + 1)...farthestReach {
                reachable[destination] = true
            }
        }

        return reachable[lastIndex]
    }
}
