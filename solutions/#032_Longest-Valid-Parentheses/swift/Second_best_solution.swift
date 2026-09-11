class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var longestLength = 0
        var indices = [-1]

        for (index, character) in s.utf8.enumerated() {
            if character == 40 { // "("
                indices.append(index)
            } else {
                indices.removeLast()

                if let boundary = indices.last {
                    longestLength = max(longestLength, index - boundary)
                } else {
                    // This unmatched closing parenthesis becomes the new boundary.
                    indices.append(index)
                }
            }
        }

        return longestLength
    }
}
