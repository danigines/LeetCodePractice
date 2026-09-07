class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard let firstWord = words.first else { return [] }

        let text = Array(s.utf8)
        let wordLength = firstWord.utf8.count
        let totalLength = wordLength * words.count

        guard totalLength <= text.count else { return [] }

        var requiredFrequency: [String: Int] = [:]
        for word in words {
            requiredFrequency[word, default: 0] += 1
        }

        var result: [Int] = []

        // Each offset represents one alignment of word-sized chunks.
        for offset in 0..<wordLength {
            var left = offset
            var right = offset
            var wordsInWindow = 0
            var windowFrequency: [String: Int] = [:]

            while right + wordLength <= text.count {
                let word = String(decoding: text[right..<(right + wordLength)], as: UTF8.self)
                right += wordLength

                guard let allowedFrequency = requiredFrequency[word] else {
                    windowFrequency.removeAll(keepingCapacity: true)
                    wordsInWindow = 0
                    left = right
                    continue
                }

                windowFrequency[word, default: 0] += 1
                wordsInWindow += 1

                while windowFrequency[word, default: 0] > allowedFrequency {
                    let leftWord = String(decoding: text[left..<(left + wordLength)], as: UTF8.self)
                    windowFrequency[leftWord, default: 0] -= 1
                    wordsInWindow -= 1
                    left += wordLength
                }

                if wordsInWindow == words.count {
                    result.append(left)

                    let leftWord = String(decoding: text[left..<(left + wordLength)], as: UTF8.self)
                    windowFrequency[leftWord, default: 0] -= 1
                    wordsInWindow -= 1
                    left += wordLength
                }
            }
        }

        return result
    }
}
