class Solution {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        let first = Array(s1.utf8)
        let second = Array(s2.utf8)
        let length = first.count
        var dp = Array(repeating: false, count: length * length * (length + 1))

        func index(_ firstStart: Int, _ secondStart: Int, _ currentLength: Int) -> Int {
            ((firstStart * length) + secondStart) * (length + 1) + currentLength
        }

        for firstStart in 0..<length {
            for secondStart in 0..<length {
                dp[index(firstStart, secondStart, 1)] = first[firstStart] == second[secondStart]
            }
        }

        if length > 1 {
            for currentLength in 2...length {
                let lastStart = length - currentLength

                for firstStart in 0...lastStart {
                    for secondStart in 0...lastStart {
                        for splitLength in 1..<currentLength {
                            let remainingLength = currentLength - splitLength

                            let withoutSwap = dp[index(firstStart, secondStart, splitLength)]
                                && dp[index(firstStart + splitLength, secondStart + splitLength, remainingLength)]

                            let withSwap = dp[index(firstStart, secondStart + remainingLength, splitLength)]
                                && dp[index(firstStart + splitLength, secondStart, remainingLength)]

                            if withoutSwap || withSwap {
                                dp[index(firstStart, secondStart, currentLength)] = true
                                break
                            }
                        }
                    }
                }
            }
        }

        return dp[index(0, 0, length)]
    }
}
