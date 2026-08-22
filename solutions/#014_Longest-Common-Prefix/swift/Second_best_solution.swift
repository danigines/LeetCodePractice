class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        let firstString = strs[0]
        var commonLength = 0

        for (index, character) in firstString.enumerated() {
            // Every string must contain the same character at this position.
            for string in strs.dropFirst() {
                guard index < string.count else {
                    return String(firstString.prefix(commonLength))
                }

                let stringIndex = string.index(string.startIndex, offsetBy: index)

                if string[stringIndex] != character {
                    return String(firstString.prefix(commonLength))
                }
            }

            commonLength += 1
        }

        return firstString
    }
}
