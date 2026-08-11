class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // Stores the most recent position of each character.
        var lastSeenIndex: [Character: Int] = [:]

        var windowStart = 0
        var longestLength = 0

        for (currentIndex, character) in s.enumerated() {
            // Move the window only if the duplicate is inside the current window.
            if let previousIndex = lastSeenIndex[character],
               previousIndex >= windowStart {
                windowStart = previousIndex + 1
            }

            lastSeenIndex[character] = currentIndex

            // The current window contains no repeated characters.
            let currentLength = currentIndex - windowStart + 1
            longestLength = max(longestLength, currentLength)
        }

        return longestLength
    }
}
