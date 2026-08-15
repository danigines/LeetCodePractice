class Solution {
    func myAtoi(_ s: String) -> Int {
        let maxInt32 = 2_147_483_647
        let minInt32 = -2_147_483_648

        var sign = 1
        var value = 0
        var parsingStarted = false

        for character in s {
            // Leading spaces are valid only before parsing begins.
            if !parsingStarted {
                if character == " " {
                    continue
                }

                parsingStarted = true

                if character == "-" {
                    sign = -1
                    continue
                }

                if character == "+" {
                    continue
                }
            }

            // Stop as soon as the numeric sequence ends.
            guard let digit = character.wholeNumberValue,
                  digit <= 9 else {
                break
            }

            let limit = sign == 1 ? maxInt32 : 2_147_483_648

            // Clamp before value * 10 + digit can exceed the allowed range.
            if value > limit / 10 ||
                (value == limit / 10 && digit > limit % 10) {
                return sign == 1 ? maxInt32 : minInt32
            }

            value = value * 10 + digit
        }

        return sign * value
    }
}
