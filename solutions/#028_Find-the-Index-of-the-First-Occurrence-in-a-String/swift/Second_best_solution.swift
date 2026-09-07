class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let text = Array(haystack)
        let pattern = Array(needle)

        guard !pattern.isEmpty else {
            return 0
        }

        guard pattern.count <= text.count else {
            return -1
        }

        for startIndex in 0...(text.count - pattern.count) {
            var patternIndex = 0

            while patternIndex < pattern.count,
                  text[startIndex + patternIndex] == pattern[patternIndex] {
                patternIndex += 1
            }

            if patternIndex == pattern.count {
                return startIndex
            }
        }

        return -1
    }
}
