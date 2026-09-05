class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted()

        // Start with any valid triplet as the current best answer.
        var closestSum = sortedNums[0] + sortedNums[1] + sortedNums[2]

        for first in 0..<(sortedNums.count - 2) {
            for second in (first + 1)..<(sortedNums.count - 1) {
                let needed = target - sortedNums[first] - sortedNums[second]

                var low = second + 1
                var high = sortedNums.count - 1

                // Search for the third value closest to the required complement.
                while low <= high {
                    let middle = low + (high - low) / 2
                    let currentSum =
                        sortedNums[first] +
                        sortedNums[second] +
                        sortedNums[middle]

                    if abs(target - currentSum) < abs(target - closestSum) {
                        closestSum = currentSum
                    }

                    // An exact complement gives the optimal possible sum.
                    if sortedNums[middle] == needed {
                        return target
                    } else if sortedNums[middle] < needed {
                        low = middle + 1
                    } else {
                        high = middle - 1
                    }
                }
            }
        }

        return closestSum
    }
}
