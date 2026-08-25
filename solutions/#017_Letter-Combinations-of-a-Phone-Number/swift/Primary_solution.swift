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

        let digitList = Array(digits)
        var result: [String] = []
        var currentCombination = ""

        func backtrack(_ index: Int) {
            // A complete path represents one valid combination.
            if index == digitList.count {
                result.append(currentCombination)
                return
            }

            guard let letters = lettersByDigit[digitList[index]] else {
                return
            }

            for letter in letters {
                // Choose a letter, explore the next digit, then undo the choice.
                currentCombination.append(letter)
                backtrack(index + 1)
                currentCombination.removeLast()
            }
        }

        backtrack(0)
        return result
    }
}
