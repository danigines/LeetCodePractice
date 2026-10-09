class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let source = Array(s.utf8)
        let target = Array(t.utf8)

        guard target.count <= source.count else {
            return ""
        }

        var needed = Array(repeating: 0, count: 128)
        var window = Array(repeating: 0, count: 128)

        for character in target {
            needed[Int(character)] += 1
        }

        var left = 0
        var matched = 0
        var bestStart = 0
        var bestLength = Int.max

        for right in source.indices {
            let rightCharacter = Int(source[right])
            window[rightCharacter] += 1

            if window[rightCharacter] <= needed[rightCharacter] {
                matched += 1
            }

            while matched == target.count {
                let windowLength = right - left + 1

                if windowLength < bestLength {
                    bestStart = left
                    bestLength = windowLength
                }

                let leftCharacter = Int(source[left])

                if window[leftCharacter] <= needed[leftCharacter] {
                    matched -= 1
                }

                window[leftCharacter] -= 1
                left += 1
            }
        }

        guard bestLength != Int.max else {
            return ""
        }

        let result = source[bestStart..<(bestStart + bestLength)]
        return String(decoding: result, as: UTF8.self)
    }
}
