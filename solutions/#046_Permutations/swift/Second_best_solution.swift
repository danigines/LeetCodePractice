class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var used = Array(repeating: false, count: nums.count)
        var current: [Int] = []
        var permutations: [[Int]] = []

        func generate() {
            if current.count == nums.count {
                permutations.append(current)
                return
            }

            for index in nums.indices where !used[index] {
                used[index] = true
                current.append(nums[index])

                generate()

                current.removeLast()
                used[index] = false
            }
        }

        generate()
        return permutations
    }
}
