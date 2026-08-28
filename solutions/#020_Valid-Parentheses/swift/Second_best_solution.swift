class Solution {
    func isValid(_ s: String) -> Bool {
        let openingByClosing: [Character: Character] = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]

        var stack: [Character] = []

        for character in s {
            // Closing brackets must match the latest unmatched opening bracket.
            if let expectedOpening = openingByClosing[character] {
                guard stack.popLast() == expectedOpening else {
                    return false
                }
            } else {
                // Opening brackets remain pending until their matching close appears.
                stack.append(character)
            }
        }

        return stack.isEmpty
    }
}
