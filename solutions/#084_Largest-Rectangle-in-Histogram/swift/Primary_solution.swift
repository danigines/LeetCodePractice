class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var maximumArea = 0
        var stack: [(start: Int, height: Int)] = []

        for index in 0...heights.count {
            let currentHeight = index == heights.count ? 0 : heights[index]
            var start = index

            while let last = stack.last, last.height > currentHeight {
                let bar = stack.removeLast()
                maximumArea = max(maximumArea, bar.height * (index - bar.start))
                start = bar.start
            }

            if stack.last?.height != currentHeight {
                stack.append((start, currentHeight))
            }
        }

        return maximumArea
    }
}
