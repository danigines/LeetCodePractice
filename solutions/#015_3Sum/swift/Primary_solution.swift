class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        var result: [[Int]] = []

        for index in 0..<(sortedNums.count - 2) {
            // Skip repeated anchors to avoid duplicate triplets.
            if index > 0 && sortedNums[index] == sortedNums[index - 1] {
                continue
            }

            // Once the anchor is positive, no later triplet can sum to zero.
            if sortedNums[index] > 0 {
                break
            }

            var left = index + 1
            var right = sortedNums.count - 1

            while left < right {
                let sum = sortedNums[index] + sortedNums[left] + sortedNums[right]

                if sum == 0 {
                    result.append([
                        sortedNums[index],
                        sortedNums[left],
                        sortedNums[right]
                    ])

                    left += 1
                    right -= 1

                    // Skip repeated values after finding a valid triplet.
                    while left < right && sortedNums[left] == sortedNums[left - 1] {
                        left += 1
                    }

                    while left < right && sortedNums[right] == sortedNums[right + 1] {
                        right -= 1
                    }
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }

        return result
    }
}
