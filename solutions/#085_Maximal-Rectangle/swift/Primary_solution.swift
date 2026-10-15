class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        guard let firstRow = matrix.first else { return 0 }

        var heights = Array(repeating: 0, count: firstRow.count)
        var maximumArea = 0

        for row in matrix {
            for column in row.indices {
                heights[column] = row[column] == "1" ? heights[column] + 1 : 0
            }

            maximumArea = max(maximumArea, largestRectangleArea(heights))
        }

        return maximumArea
    }

    private func largestRectangleArea(_ heights: [Int]) -> Int {
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
