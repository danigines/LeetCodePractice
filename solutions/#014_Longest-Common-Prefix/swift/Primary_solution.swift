class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        // Start with the entire first string as the candidate prefix.
        var prefix = strs[0]

        for string in strs.dropFirst() {
            // Shrink the candidate until the current string shares it.
            while !string.hasPrefix(prefix) {
                prefix.removeLast()

                if prefix.isEmpty {
                    return ""
                }
            }
        }

        return prefix
    }
}
