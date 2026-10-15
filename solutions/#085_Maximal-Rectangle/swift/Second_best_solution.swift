class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        guard let firstRow = matrix.first else { return 0 }

        let columnCount = firstRow.count
        var heights = Array(repeating: 0, count: columnCount)
        var leftBoundary = Array(repeating: 0, count: columnCount)
        var rightBoundary = Array(repeating: columnCount, count: columnCount)
        var maximumArea = 0

        for row in matrix {
            var currentLeft = 0
            var currentRight = columnCount

            for column in 0..<columnCount {
                if row[column] == "1" {
                    heights[column] += 1
                    leftBoundary[column] = max(leftBoundary[column], currentLeft)
                } else {
                    heights[column] = 0
                    leftBoundary[column] = 0
                    currentLeft = column + 1
                }
            }

            for column in stride(from: columnCount - 1, through: 0, by: -1) {
                if row[column] == "1" {
                    rightBoundary[column] = min(rightBoundary[column], currentRight)
                } else {
                    rightBoundary[column] = columnCount
                    currentRight = column
                }
            }

            for column in 0..<columnCount {
                let width = rightBoundary[column] - leftBoundary[column]
                maximumArea = max(maximumArea, heights[column] * width)
            }
        }

        return maximumArea
    }
}
