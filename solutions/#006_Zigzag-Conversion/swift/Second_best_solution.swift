class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1, numRows < s.count else {
            return s
        }

        // Array conversion gives constant-time access by integer position.
        let characters = Array(s)
        let cycleLength = 2 * numRows - 2
        var result = ""

        for row in 0..<numRows {
            var index = row

            while index < characters.count {
                result.append(characters[index])

                // Middle rows contain an additional character inside each cycle.
                let diagonalIndex = index + cycleLength - 2 * row

                if row != 0,
                   row != numRows - 1,
                   diagonalIndex < characters.count {
                    result.append(characters[diagonalIndex])
                }

                index += cycleLength
            }
        }

        return result
    }
}
