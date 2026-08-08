final class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Maps each previously visited value to its index.
        var indexByValue: [Int: Int] = [:]

        for (currentIndex, currentValue) in nums.enumerated() {
            // The complement is the value needed to reach the target.
            let complement = target - currentValue

            if let complementIndex = indexByValue[complement] {
                return [complementIndex, currentIndex]
            }

            // Insert after searching to avoid using the same element twice.
            indexByValue[currentValue] = currentIndex
        }

        return []
    }
}
