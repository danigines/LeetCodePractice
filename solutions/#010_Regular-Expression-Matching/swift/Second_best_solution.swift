class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let text = Array(s)
        let pattern = Array(p)

        // memo[i][j] caches whether text[i...] matches pattern[j...].
        var memo = Array(
            repeating: Array<Bool?>(repeating: nil, count: pattern.count + 1),
            count: text.count + 1
        )

        func match(_ textIndex: Int, _ patternIndex: Int) -> Bool {
            if let cachedResult = memo[textIndex][patternIndex] {
                return cachedResult
            }

            if patternIndex == pattern.count {
                return textIndex == text.count
            }

            let firstMatches =
                textIndex < text.count &&
                (pattern[patternIndex] == "." || pattern[patternIndex] == text[textIndex])

            let result: Bool

            // '*' creates two choices: skip the pair or consume one matching character.
            if patternIndex + 1 < pattern.count && pattern[patternIndex + 1] == "*" {
                result =
                    match(textIndex, patternIndex + 2) ||
                    (firstMatches && match(textIndex + 1, patternIndex))
            } else {
                result = firstMatches && match(textIndex + 1, patternIndex + 1)
            }

            memo[textIndex][patternIndex] = result
            return result
        }

        return match(0, 0)
    }
}
