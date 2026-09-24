class Solution {
    func jump(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }

        var minimumJumps = Array(repeating: Int.max, count: nums.count)
        minimumJumps[0] = 0

        for index in 0..<(nums.count - 1) {
            guard minimumJumps[index] != Int.max else { continue }

            let lastReachable = min(nums.count - 1, index + nums[index])
            guard lastReachable > index else { continue }

            for destination in (index + 1)...lastReachable {
                minimumJumps[destination] = min(
                    minimumJumps[destination],
                    minimumJumps[index] + 1
                )
            }
        }

        return minimumJumps[nums.count - 1]
    }
}
