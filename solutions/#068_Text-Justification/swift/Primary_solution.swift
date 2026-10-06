class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var result: [String] = []
        var lineStart = 0

        while lineStart < words.count {
            var lineEnd = lineStart
            var lettersLength = 0

            while lineEnd < words.count {
                let requiredWidth = lettersLength
                    + words[lineEnd].count
                    + (lineEnd - lineStart)

                if requiredWidth > maxWidth {
                    break
                }

                lettersLength += words[lineEnd].count
                lineEnd += 1
            }

            let wordCount = lineEnd - lineStart
            let isLastLine = lineEnd == words.count
            var line = ""

            if isLastLine || wordCount == 1 {
                line = words[lineStart..<lineEnd].joined(separator: " ")
                line += String(repeating: " ", count: maxWidth - line.count)
            } else {
                let totalSpaces = maxWidth - lettersLength
                let gaps = wordCount - 1
                let baseSpaces = totalSpaces / gaps
                let extraSpaces = totalSpaces % gaps

                for index in lineStart..<lineEnd {
                    line += words[index]

                    if index < lineEnd - 1 {
                        let gapIndex = index - lineStart
                        let spaces = baseSpaces + (gapIndex < extraSpaces ? 1 : 0)
                        line += String(repeating: " ", count: spaces)
                    }
                }
            }

            result.append(line)
            lineStart = lineEnd
        }

        return result
    }
}
