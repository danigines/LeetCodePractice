class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        var currentCombination = ""

        func backtrack(_ openCount: Int, _ closeCount: Int) {
            // A complete path contains exactly n opening and n closing parentheses.
            if openCount == n && closeCount == n {
                result.append(currentCombination)
                return
            }

            // Add an opening parenthesis while there are unused pairs.
            if openCount < n {
                currentCombination.append("(")
                backtrack(openCount + 1, closeCount)
                currentCombination.removeLast()
            }

            // A closing parenthesis is valid only when it matches an open one.
            if closeCount < openCount {
                currentCombination.append(")")
                backtrack(openCount, closeCount + 1)
                currentCombination.removeLast()
            }
        }

        backtrack(0, 0)
        return result
    }
}
