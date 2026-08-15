class Solution {
    func reverse(_ x: Int) -> Int {
        let isNegative = x < 0
        let numberString = String(x)

        // Remove the sign before reversing only the numeric digits.
        let digits = isNegative
            ? String(numberString.dropFirst())
            : numberString

        let reversedDigits = String(digits.reversed())

        // Remove leading zeros created by the reversal.
        let trimmedDigits = reversedDigits.drop(while: { $0 == "0" })
        let normalizedDigits = trimmedDigits.isEmpty ? "0" : String(trimmedDigits)

        let limit = isNegative ? "2147483648" : "2147483647"

        // Compare as strings before converting to avoid a 32-bit overflow.
        if normalizedDigits.count > limit.count ||
            (normalizedDigits.count == limit.count && normalizedDigits > limit) {
            return 0
        }

        let result = isNegative ? "-\(normalizedDigits)" : normalizedDigits
        return Int(result) ?? 0
    }
}
