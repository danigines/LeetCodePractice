class Solution {
    func isNumber(_ s: String) -> Bool {
        var index = s.startIndex

        func consumeSign() {
            guard index < s.endIndex else { return }

            if s[index] == "+" || s[index] == "-" {
                index = s.index(after: index)
            }
        }

        func consumeDigits() -> Bool {
            var hasDigits = false

            while index < s.endIndex && s[index].isNumber {
                hasDigits = true
                index = s.index(after: index)
            }

            return hasDigits
        }

        consumeSign()

        let hasIntegerDigits = consumeDigits()
        var hasFractionDigits = false

        if index < s.endIndex && s[index] == "." {
            index = s.index(after: index)
            hasFractionDigits = consumeDigits()
        }

        guard hasIntegerDigits || hasFractionDigits else {
            return false
        }

        if index < s.endIndex && (s[index] == "e" || s[index] == "E") {
            index = s.index(after: index)
            consumeSign()

            guard consumeDigits() else {
                return false
            }
        }

        return index == s.endIndex
    }
}
