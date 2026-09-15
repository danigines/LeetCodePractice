class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Set<Character>(), count: 9)
        var columns = Array(repeating: Set<Character>(), count: 9)
        var boxes = Array(repeating: Set<Character>(), count: 9)

        for row in 0..<9 {
            for column in 0..<9 {
                let value = board[row][column]

                guard value != "." else { continue }

                let box = (row / 3) * 3 + column / 3

                if rows[row].contains(value) ||
                    columns[column].contains(value) ||
                    boxes[box].contains(value) {
                    return false
                }

                rows[row].insert(value)
                columns[column].insert(value)
                boxes[box].insert(value)
            }
        }

        return true
    }
}
