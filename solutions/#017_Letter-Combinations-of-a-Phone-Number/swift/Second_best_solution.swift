class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return []
        }

        let lettersByDigit: [Character: [Character]] = [
            "2": Array("abc"),
            "3": Array("def"),
            "4": Array("ghi"),
            "5": Array("jkl"),
            "6": Array("mno"),
            "7": Array("pqrs"),
            "8": Array("tuv"),
            "9": Array("wxyz")
        ]

        var combinations = [""]

        for digit in digits {
            guard let letters = lettersByDigit[digit] else {
                continue
            }

            var nextCombinations: [String] = []

            // Extend every existing combination with every letter for this digit.
            for combination in combinations {
                for letter in letters {
                    nextCombinations.append(combination + String(letter))
                }
            }

            combinations = nextCombinations
        }

        return combinations
    }
}
