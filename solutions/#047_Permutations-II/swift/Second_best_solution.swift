class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var frequency: [Int: Int] = [:]
        for number in nums {
            frequency[number, default: 0] += 1
        }

        let uniqueNumbers = frequency.keys.sorted()
        var current: [Int] = []
        var permutations: [[Int]] = []

        func generate() {
            if current.count == nums.count {
                permutations.append(current)
                return
            }

            for number in uniqueNumbers {
                guard let remaining = frequency[number], remaining > 0 else {
                    continue
                }

                frequency[number] = remaining - 1
                current.append(number)
                generate()
                current.removeLast()
                frequency[number] = remaining
            }
        }

        generate()
        return permutations
    }
}
