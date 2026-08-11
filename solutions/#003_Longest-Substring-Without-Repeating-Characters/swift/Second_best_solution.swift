class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // Convert to an array to allow integer-based window access.
        let characters = Array(s)

        var charactersInWindow: Set<Character> = []
        var windowStart = 0
        var longestLength = 0

        for windowEnd in characters.indices {
            // Shrink the window until the duplicate is removed.
            while charactersInWindow.contains(characters[windowEnd]) {
                charactersInWindow.remove(characters[windowStart])
                windowStart += 1
            }

            charactersInWindow.insert(characters[windowEnd])

            // The window is valid after removing every duplicate.
            let currentLength = windowEnd - windowStart + 1
            longestLength = max(longestLength, currentLength)
        }

        return longestLength
    }
}
