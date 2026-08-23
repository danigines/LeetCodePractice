class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        var result: [[Int]] = []

        for index in 0..<(sortedNums.count - 2) {
            // Repeated anchors would generate the same triplets.
            if index > 0 && sortedNums[index] == sortedNums[index - 1] {
                continue
            }

            var seen: Set<Int> = []
            var previousSecond: Int?

            for secondIndex in (index + 1)..<sortedNums.count {
                let secondValue = sortedNums[secondIndex]

                // Avoid processing the same second value more than once.
                if previousSecond == secondValue {
                    continue
                }

                let complement = -sortedNums[index] - secondValue

                if seen.contains(complement) {
                    result.append([
                        sortedNums[index],
                        complement,
                        secondValue
                    ])

                    previousSecond = secondValue
                }

                seen.insert(secondValue)
            }
        }

        return result
    }
}
