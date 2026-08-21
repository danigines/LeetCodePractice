class Solution {
    func romanToInt(_ s: String) -> Int {
        let values: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]

        // Array conversion simplifies integer-based lookahead.
        let characters = Array(s)
        var result = 0
        var index = 0

        while index < characters.count {
            let currentValue = values[characters[index]]!

            // A smaller symbol followed by a larger one forms a subtractive pair.
            if index + 1 < characters.count {
                let nextValue = values[characters[index + 1]]!

                if currentValue < nextValue {
                    result += nextValue - currentValue
                    index += 2
                    continue
                }
            }

            result += currentValue
            index += 1
        }

        return result
    }
}
