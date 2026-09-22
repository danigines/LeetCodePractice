class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let text = Array(s.utf8)
        let pattern = Array(p.utf8)
        let questionMark: UInt8 = 63
        let star: UInt8 = 42

        // dp[j] matches the processed text prefix against pattern[0..<j].
        var dp = Array(repeating: false, count: pattern.count + 1)
        dp[0] = true

        for index in pattern.indices {
            if pattern[index] != star { break }
            dp[index + 1] = true
        }

        for character in text {
            var previousDiagonal = dp[0]
            dp[0] = false

            for index in pattern.indices {
                let previousRow = dp[index + 1]

                if pattern[index] == star {
                    // Consume one more text character or match an empty sequence.
                    dp[index + 1] = previousRow || dp[index]
                } else {
                    dp[index + 1] = previousDiagonal &&
                        (pattern[index] == questionMark || pattern[index] == character)
                }

                previousDiagonal = previousRow
            }
        }

        return dp[pattern.count]
    }
}
