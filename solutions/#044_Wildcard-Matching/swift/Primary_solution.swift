class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let text = Array(s.utf8)
        let pattern = Array(p.utf8)
        let questionMark: UInt8 = 63
        let star: UInt8 = 42

        var textIndex = 0
        var patternIndex = 0
        var lastStarIndex: Int? = nil
        var textAfterStar = 0

        while textIndex < text.count {
            if patternIndex < pattern.count &&
                (pattern[patternIndex] == questionMark || pattern[patternIndex] == text[textIndex]) {
                textIndex += 1
                patternIndex += 1
            } else if patternIndex < pattern.count && pattern[patternIndex] == star {
                lastStarIndex = patternIndex
                textAfterStar = textIndex
                patternIndex += 1
            } else if let starIndex = lastStarIndex {
                textAfterStar += 1
                textIndex = textAfterStar
                patternIndex = starIndex + 1
            } else {
                return false
            }
        }

        while patternIndex < pattern.count && pattern[patternIndex] == star {
            patternIndex += 1
        }

        return patternIndex == pattern.count
    }
}
