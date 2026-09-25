class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups: [String: [String]] = [:]

        for word in strs {
            let sortedCharacters = word.utf8.sorted()
            let signature = String(decoding: sortedCharacters, as: UTF8.self)
            groups[signature, default: []].append(word)
        }

        return Array(groups.values)
    }
}
