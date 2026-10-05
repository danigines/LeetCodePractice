class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        guard let incrementIndex = digits.lastIndex(where: { $0 != 9 }) else {
            return [1] + Array(repeating: 0, count: digits.count)
        }

        var digits = digits
        digits[incrementIndex] += 1

        if incrementIndex + 1 < digits.count {
            for index in (incrementIndex + 1)..<digits.count {
                digits[index] = 0
            }
        }

        return digits
    }
}
