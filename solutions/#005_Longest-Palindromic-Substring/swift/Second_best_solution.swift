class Solution {
    func longestPalindrome(_ s: String) -> String {
        let characters = Array(s)

        var bestStart = 0
        var bestLength = 1

        // Expand from a center while both sides remain equal.
        func expand(left: Int, right: Int) {
            var leftIndex = left
            var rightIndex = right

            while leftIndex >= 0,
                  rightIndex < characters.count,
                  characters[leftIndex] == characters[rightIndex] {
                let currentLength = rightIndex - leftIndex + 1

                if currentLength > bestLength {
                    bestStart = leftIndex
                    bestLength = currentLength
                }

                leftIndex -= 1
                rightIndex += 1
            }
        }

        for index in characters.indices {
            // Odd-length palindrome: one character is the center.
            expand(left: index, right: index)

            // Even-length palindrome: the center lies between two characters.
            expand(left: index, right: index + 1)
        }

        return String(characters[bestStart..<(bestStart + bestLength)])
    }
}
