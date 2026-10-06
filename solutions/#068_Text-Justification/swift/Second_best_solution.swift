class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        func makeLine(
            _ lineWords: [String],
            lettersLength: Int,
            isLastLine: Bool
        ) -> String {
            if isLastLine || lineWords.count == 1 {
                let text = lineWords.joined(separator: " ")
                return text + String(repeating: " ", count: maxWidth - text.count)
            }

            let totalSpaces = maxWidth - lettersLength
            let gaps = lineWords.count - 1
            let baseSpaces = totalSpaces / gaps
            let extraSpaces = totalSpaces % gaps
            var line = ""

            for index in lineWords.indices {
                line += lineWords[index]

                if index < lineWords.count - 1 {
                    let spaces = baseSpaces + (index < extraSpaces ? 1 : 0)
                    line += String(repeating: " ", count: spaces)
                }
            }

            return line
        }

        var result: [String] = []
        var lineWords: [String] = []
        var lettersLength = 0

        for word in words {
            let requiredWidth = lettersLength + word.count + lineWords.count

            if !lineWords.isEmpty && requiredWidth > maxWidth {
                result.append(
                    makeLine(
                        lineWords,
                        lettersLength: lettersLength,
                        isLastLine: false
                    )
                )
                lineWords.removeAll(keepingCapacity: true)
                lettersLength = 0
            }

            lineWords.append(word)
            lettersLength += word.count
        }

        result.append(
            makeLine(
                lineWords,
                lettersLength: lettersLength,
                isLastLine: true
            )
        )

        return result
    }
}
