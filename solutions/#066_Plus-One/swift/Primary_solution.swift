class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits

        for index in digits.indices.reversed() {
            if digits[index] < 9 {
                digits[index] += 1
                return digits
            }

            digits[index] = 0
        }

        digits.insert(1, at: 0)
        return digits
    }
}
