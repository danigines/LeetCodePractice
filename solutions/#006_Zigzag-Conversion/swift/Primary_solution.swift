class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        // With one row, the zigzag is identical to the original string.
        guard numRows > 1, numRows < s.count else {
            return s
        }

        var rows = Array(repeating: "", count: numRows)
        var currentRow = 0
        var direction = 1

        for character in s {
            rows[currentRow].append(character)

            // Reverse direction whenever the zigzag reaches an edge.
            if currentRow == 0 {
                direction = 1
            } else if currentRow == numRows - 1 {
                direction = -1
            }

            currentRow += direction
        }

        // Reading the zigzag row by row produces the final result.
        return rows.joined()
    }
}
