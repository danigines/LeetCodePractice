class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let text = Array(s)
        let pattern = Array(p)
        let patternCount = pattern.count

        // dp[j] tells whether the processed text matches pattern[0..<j].
        var dp = Array(repeating: false, count: patternCount + 1)
        dp[0] = true

        // An empty string can match patterns such as "a*", "a*b*", etc.
        if patternCount >= 2 {
            for j in 2...patternCount where pattern[j - 1] == "*" {
                dp[j] = dp[j - 2]
            }
        }

        for i in 1...text.count {
            var previousDiagonal = dp[0]
            dp[0] = false

            for j in 1...patternCount {
                let previousRowSameColumn = dp[j]

                if pattern[j - 1] == "*" {
                    let previousPattern = pattern[j - 2]
                    let matchesCurrent = previousPattern == "." || previousPattern == text[i - 1]

                    // Either ignore "x*" or use it to consume the current character.
                    dp[j] = dp[j - 2] || (matchesCurrent && previousRowSameColumn)
                } else {
                    let matchesCurrent = pattern[j - 1] == "." || pattern[j - 1] == text[i - 1]
                    dp[j] = matchesCurrent && previousDiagonal
                }

                previousDiagonal = previousRowSameColumn
            }
        }

        return dp[patternCount]
    }
}
