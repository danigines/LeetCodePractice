class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxArea = 0

        while left < right {
            let width = right - left
            let containerHeight = min(height[left], height[right])

            // The shorter line limits how much water this container can hold.
            maxArea = max(maxArea, width * containerHeight)

            // Move the limiting side; moving the taller side cannot improve the height.
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }

        return maxArea
    }
}
