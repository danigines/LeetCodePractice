class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups: [String: [String]] = [:]

        for word in strs {
            var frequency = Array(repeating: 0, count: 26)

            for character in word.utf8 {
                frequency[Int(character - 97)] += 1
            }

            let signature = frequency.map(String.init).joined(separator: "#")
            groups[signature, default: []].append(word)
        }

        return Array(groups.values)
    }
}
