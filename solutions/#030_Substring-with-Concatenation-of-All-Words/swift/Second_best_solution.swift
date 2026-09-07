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

        for start in 0...(text.count - totalLength) {
            var remainingFrequency = requiredFrequency
            var isValid = true

            for wordIndex in 0..<words.count {
                let wordStart = start + wordIndex * wordLength
                let word = String(decoding: text[wordStart..<(wordStart + wordLength)], as: UTF8.self)

                guard let remaining = remainingFrequency[word], remaining > 0 else {
                    isValid = false
                    break
                }

                remainingFrequency[word] = remaining - 1
            }

            if isValid {
                result.append(start)
            }
        }

        return result
    }
}
