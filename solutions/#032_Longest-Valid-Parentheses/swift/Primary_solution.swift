class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var longestLength = 0
        var openCount = 0
        var closeCount = 0

        // Left to right: an extra closing parenthesis invalidates the segment.
        for character in s.utf8 {
            if character == 40 { // "("
                openCount += 1
            } else {
                closeCount += 1
            }

            if openCount == closeCount {
                longestLength = max(longestLength, 2 * closeCount)
            } else if closeCount > openCount {
                openCount = 0
                closeCount = 0
            }
        }

        openCount = 0
        closeCount = 0

        // Right to left: an extra opening parenthesis invalidates the segment.
        for character in s.utf8.reversed() {
            if character == 41 { // ")"
                closeCount += 1
            } else {
                openCount += 1
            }

            if openCount == closeCount {
                longestLength = max(longestLength, 2 * openCount)
            } else if openCount > closeCount {
                openCount = 0
                closeCount = 0
            }
        }

        return longestLength
    }
}
