class Solution {
    func longestPalindrome(_ s: String) -> String {
        let characters = Array(s)

        // Insert separators so odd and even palindromes share the same representation.
        var transformed: [Character] = ["^"]

        for character in characters {
            transformed.append("#")
            transformed.append(character)
        }

        transformed.append("#")
        transformed.append("$")

        // radius[i] stores the palindrome radius around position i.
        var radius = Array(repeating: 0, count: transformed.count)
        var center = 0
        var rightBoundary = 0

        var longestCenter = 0
        var longestRadius = 0

        for index in 1..<(transformed.count - 1) {
            let mirror = 2 * center - index

            // Reuse information from the mirrored palindrome when possible.
            if index < rightBoundary {
                radius[index] = min(rightBoundary - index, radius[mirror])
            }

            while transformed[index + radius[index] + 1]
                    == transformed[index - radius[index] - 1] {
                radius[index] += 1
            }

            // Update the palindrome that currently extends farthest to the right.
            if index + radius[index] > rightBoundary {
                center = index
                rightBoundary = index + radius[index]
            }

            if radius[index] > longestRadius {
                longestRadius = radius[index]
                longestCenter = index
            }
        }

        let startIndex = (longestCenter - longestRadius) / 2
        return String(characters[startIndex..<(startIndex + longestRadius)])
    }
}
