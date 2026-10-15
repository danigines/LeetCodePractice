class Solution {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        let first = Array(s1.utf8)
        let second = Array(s2.utf8)
        let length = first.count
        var memo = Array(repeating: Int8(0), count: length * length * (length + 1))

        func memoIndex(_ firstStart: Int, _ secondStart: Int, _ currentLength: Int) -> Int {
            ((firstStart * length) + secondStart) * (length + 1) + currentLength
        }

        func haveSameCharacters(_ firstStart: Int, _ secondStart: Int, _ currentLength: Int) -> Bool {
            var counts = Array(repeating: 0, count: 26)

            for offset in 0..<currentLength {
                counts[Int(first[firstStart + offset] - 97)] += 1
                counts[Int(second[secondStart + offset] - 97)] -= 1
            }

            return counts.allSatisfy { $0 == 0 }
        }

        func dfs(_ firstStart: Int, _ secondStart: Int, _ currentLength: Int) -> Bool {
            let index = memoIndex(firstStart, secondStart, currentLength)

            if memo[index] != 0 {
                return memo[index] == 1
            }

            var areIdentical = true

            for offset in 0..<currentLength where first[firstStart + offset] != second[secondStart + offset] {
                areIdentical = false
                break
            }

            if areIdentical {
                memo[index] = 1
                return true
            }

            guard haveSameCharacters(firstStart, secondStart, currentLength) else {
                memo[index] = -1
                return false
            }

            for splitLength in 1..<currentLength {
                let remainingLength = currentLength - splitLength

                let withoutSwap = dfs(firstStart, secondStart, splitLength)
                    && dfs(firstStart + splitLength, secondStart + splitLength, remainingLength)

                let withSwap = dfs(firstStart, secondStart + remainingLength, splitLength)
                    && dfs(firstStart + splitLength, secondStart, remainingLength)

                if withoutSwap || withSwap {
                    memo[index] = 1
                    return true
                }
            }

            memo[index] = -1
            return false
        }

        return dfs(0, 0, length)
    }
}
