class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        let sortedNumbers = nums.sorted()
        var used = Array(repeating: false, count: nums.count)
        var current: [Int] = []
        var permutations: [[Int]] = []

        func generate() {
            if current.count == sortedNumbers.count {
                permutations.append(current)
                return
            }

            for index in sortedNumbers.indices {
                if used[index] { continue }

                if index > 0 &&
                    sortedNumbers[index] == sortedNumbers[index - 1] &&
                    !used[index - 1] {
                    continue
                }

                used[index] = true
                current.append(sortedNumbers[index])
                generate()
                current.removeLast()
                used[index] = false
            }
        }

        generate()
        return permutations
    }
}
