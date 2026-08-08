final class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Preserve original indices before sorting by value.
        let indexedValues = nums.enumerated()
            .map { (index: $0.offset, value: $0.element) }
            .sorted { $0.value < $1.value }

        var leftIndex = 0
        var rightIndex = indexedValues.count - 1

        // Move the pointers according to how the current sum compares with target.
        while leftIndex < rightIndex {
            let currentSum =
                indexedValues[leftIndex].value +
                indexedValues[rightIndex].value

            if currentSum == target {
                return [
                    indexedValues[leftIndex].index,
                    indexedValues[rightIndex].index
                ]
            }

            if currentSum < target {
                leftIndex += 1
            } else {
                rightIndex -= 1
            }
        }

        return []
    }
}
