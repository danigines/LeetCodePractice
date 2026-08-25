class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted()

        // Any valid triplet gives us an initial closest candidate.
        var closestSum = sortedNums[0] + sortedNums[1] + sortedNums[2]

        for index in 0..<(sortedNums.count - 2) {
            let pairTarget = target - sortedNums[index]
            var left = index + 1
            var right = sortedNums.count - 1

            while left < right {
                let pairSum = sortedNums[left] + sortedNums[right]
                let currentSum = sortedNums[index] + pairSum

                // Keep the triplet whose sum has the smallest distance to target.
                if abs(target - currentSum) < abs(target - closestSum) {
                    closestSum = currentSum
                }

                // Distance zero is the best possible result.
                if currentSum == target {
                    return target
                }

                // Move the pair toward the value required by the fixed anchor.
                if pairSum < pairTarget {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }

        return closestSum
    }
}
