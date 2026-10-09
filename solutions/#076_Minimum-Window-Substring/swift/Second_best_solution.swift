class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let source = Array(s)
        let target = Array(t)

        guard target.count <= source.count else {
            return ""
        }

        var needed: [Character: Int] = [:]

        for character in target {
            needed[character, default: 0] += 1
        }

        var bestStart = 0
        var bestLength = Int.max

        for start in source.indices {
            var window: [Character: Int] = [:]
            var matched = 0

            for end in start..<source.count {
                let character = source[end]
                window[character, default: 0] += 1

                if window[character, default: 0] <= needed[character, default: 0] {
                    matched += 1
                }

                if matched == target.count {
                    let windowLength = end - start + 1

                    if windowLength < bestLength {
                        bestStart = start
                        bestLength = windowLength
                    }

                    break
                }
            }
        }

        guard bestLength != Int.max else {
            return ""
        }

        return String(source[bestStart..<(bestStart + bestLength)])
    }
}
