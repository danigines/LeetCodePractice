class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else {
            return []
        }

        let sortedNums = nums.sorted()
        let target = Int64(target)
        var quadruplets: Set<[Int]> = []

        for first in 0..<(sortedNums.count - 3) {
            for second in (first + 1)..<(sortedNums.count - 2) {
                for third in (second + 1)..<(sortedNums.count - 1) {
                    // Compute the exact fourth value required to reach the target.
                    let needed =
                        target -
                        Int64(sortedNums[first]) -
                        Int64(sortedNums[second]) -
                        Int64(sortedNums[third])

                    var low = third + 1
                    var high = sortedNums.count - 1

                    // Search only among positions after the three fixed indices.
                    while low <= high {
                        let middle = low + (high - low) / 2
                        let value = Int64(sortedNums[middle])

                        if value == needed {
                            quadruplets.insert([
                                sortedNums[first],
                                sortedNums[second],
                                sortedNums[third],
                                sortedNums[middle]
                            ])
                            break
                        } else if value < needed {
                            low = middle + 1
                        } else {
                            high = middle - 1
                        }
                    }
                }
            }
        }

        return Array(quadruplets)
    }
}
