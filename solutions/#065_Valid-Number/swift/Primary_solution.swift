class Solution {
    func isNumber(_ s: String) -> Bool {
        var hasDigit = false
        var hasDot = false
        var hasExponent = false
        var hasDigitAfterExponent = true
        var previousCharacter: Character?

        for (position, character) in s.enumerated() {
            if character.isNumber {
                hasDigit = true

                if hasExponent {
                    hasDigitAfterExponent = true
                }
            } else if character == "+" || character == "-" {
                if position != 0
                    && previousCharacter != "e"
                    && previousCharacter != "E" {
                    return false
                }
            } else if character == "." {
                if hasDot || hasExponent {
                    return false
                }

                hasDot = true
            } else if character == "e" || character == "E" {
                if hasExponent || !hasDigit {
                    return false
                }

                hasExponent = true
                hasDigitAfterExponent = false
            } else {
                return false
            }

            previousCharacter = character
        }

        return hasDigit && hasDigitAfterExponent
    }
}
