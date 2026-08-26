class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else {
            return []
        }

        let sortedNums = nums.sorted()
        let target = Int64(target)
        var result: [[Int]] = []

        for first in 0..<(sortedNums.count - 3) {
            // Reusing the same first value would produce duplicate quadruplets.
            if first > 0 && sortedNums[first] == sortedNums[first - 1] {
                continue
            }

            for second in (first + 1)..<(sortedNums.count - 2) {
                // Skip duplicate second anchors for the current first value.
                if second > first + 1 && sortedNums[second] == sortedNums[second - 1] {
                    continue
                }

                var left = second + 1
                var right = sortedNums.count - 1

                while left < right {
                    // Int64 prevents overflow when adding up to four large values.
                    let sum =
                        Int64(sortedNums[first]) +
                        Int64(sortedNums[second]) +
                        Int64(sortedNums[left]) +
                        Int64(sortedNums[right])

                    if sum == target {
                        result.append([
                            sortedNums[first],
                            sortedNums[second],
                            sortedNums[left],
                            sortedNums[right]
                        ])

                        left += 1
                        right -= 1

                        // Skip repeated values after recording a valid quadruplet.
                        while left < right && sortedNums[left] == sortedNums[left - 1] {
                            left += 1
                        }

                        while left < right && sortedNums[right] == sortedNums[right + 1] {
                            right -= 1
                        }
                    } else if sum < target {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }

        return result
    }
}
