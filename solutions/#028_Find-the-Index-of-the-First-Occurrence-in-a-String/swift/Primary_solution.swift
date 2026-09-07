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

        let prefixTable = buildPrefixTable(for: pattern)
        var textIndex = 0
        var patternIndex = 0

        while textIndex < text.count {
            if text[textIndex] == pattern[patternIndex] {
                textIndex += 1
                patternIndex += 1

                if patternIndex == pattern.count {
                    return textIndex - pattern.count
                }
            } else if patternIndex > 0 {
                // Reuse the longest prefix that is also a suffix.
                patternIndex = prefixTable[patternIndex - 1]
            } else {
                textIndex += 1
            }
        }

        return -1
    }

    private func buildPrefixTable(for pattern: [Character]) -> [Int] {
        var prefixTable = Array(repeating: 0, count: pattern.count)
        var prefixLength = 0

        for index in 1..<pattern.count {
            while prefixLength > 0,
                  pattern[index] != pattern[prefixLength] {
                prefixLength = prefixTable[prefixLength - 1]
            }

            if pattern[index] == pattern[prefixLength] {
                prefixLength += 1
            }

            prefixTable[index] = prefixLength
        }

        return prefixTable
    }
}
