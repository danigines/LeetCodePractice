class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let count = heights.count
        var leftBoundary = Array(repeating: -1, count: count)
        var rightBoundary = Array(repeating: count, count: count)
        var stack: [Int] = []

        for index in 0..<count {
            while let last = stack.last, heights[last] >= heights[index] {
                stack.removeLast()
            }

            leftBoundary[index] = stack.last ?? -1
            stack.append(index)
        }

        stack.removeAll(keepingCapacity: true)

        for index in stride(from: count - 1, through: 0, by: -1) {
            while let last = stack.last, heights[last] >= heights[index] {
                stack.removeLast()
            }

            rightBoundary[index] = stack.last ?? count
            stack.append(index)
        }

        var maximumArea = 0

        for index in 0..<count {
            let width = rightBoundary[index] - leftBoundary[index] - 1
            maximumArea = max(maximumArea, heights[index] * width)
        }

        return maximumArea
    }
}
