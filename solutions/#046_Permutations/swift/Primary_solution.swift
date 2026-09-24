class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var values = nums
        var permutations: [[Int]] = []

        func generate(_ position: Int) {
            if position == values.count {
                permutations.append(values)
                return
            }

            for candidate in position..<values.count {
                values.swapAt(position, candidate)
                generate(position + 1)
                values.swapAt(position, candidate)
            }
        }

        generate(0)
        return permutations
    }
}
