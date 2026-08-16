class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        // Negative numbers cannot be palindromes because of the minus sign.
        guard x >= 0 else {
            return false
        }

        let characters = Array(String(x))
        var leftIndex = 0
        var rightIndex = characters.count - 1

        // Compare symmetric characters while moving toward the center.
        while leftIndex < rightIndex {
            if characters[leftIndex] != characters[rightIndex] {
                return false
            }

            leftIndex += 1
            rightIndex -= 1
        }

        return true
    }
}
