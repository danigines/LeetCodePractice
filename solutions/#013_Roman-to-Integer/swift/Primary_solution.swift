class Solution {
    func romanToInt(_ s: String) -> Int {
        // Maps each Roman symbol to its numeric value.
        let values: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]

        var result = 0
        var previousValue = 0

        // Traversing right-to-left makes subtractive notation easy to detect.
        for character in s.reversed() {
            guard let currentValue = values[character] else {
                continue
            }

            // A smaller value before a larger one must be subtracted.
            if currentValue < previousValue {
                result -= currentValue
            } else {
                result += currentValue
            }

            previousValue = currentValue
        }

        return result
    }
}
