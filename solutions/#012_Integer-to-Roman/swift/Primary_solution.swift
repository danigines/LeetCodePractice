class Solution {
    func intToRoman(_ num: Int) -> String {
        // Include subtractive combinations as regular values to simplify the conversion.
        let romanValues: [(value: Int, symbol: String)] = [
            (1000, "M"),
            (900, "CM"),
            (500, "D"),
            (400, "CD"),
            (100, "C"),
            (90, "XC"),
            (50, "L"),
            (40, "XL"),
            (10, "X"),
            (9, "IX"),
            (5, "V"),
            (4, "IV"),
            (1, "I")
        ]

        var remaining = num
        var result = ""

        // Always consume the largest Roman value that still fits.
        for roman in romanValues {
            while remaining >= roman.value {
                result.append(roman.symbol)
                remaining -= roman.value
            }

            if remaining == 0 {
                break
            }
        }

        return result
    }
}
