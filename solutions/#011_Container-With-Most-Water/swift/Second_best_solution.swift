class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0

        // Try every possible pair of container walls.
        for left in 0..<(height.count - 1) {
            for right in (left + 1)..<height.count {
                let width = right - left
                let containerHeight = min(height[left], height[right])

                maxArea = max(maxArea, width * containerHeight)
            }
        }

        return maxArea
    }
}
