class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        // Negative numbers and positive numbers ending in zero cannot be palindromes.
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }

        var remaining = x
        var reversedHalf = 0

        // Reverse only half of the digits to avoid unnecessary work and overflow.
        while remaining > reversedHalf {
            reversedHalf = reversedHalf * 10 + remaining % 10
            remaining /= 10
        }

        // For odd digit counts, remove the middle digit from the reversed half.
        return remaining == reversedHalf || remaining == reversedHalf / 10
    }
}
