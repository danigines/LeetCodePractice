class Solution {
    func myAtoi(_ s: String) -> Int {
        let characters = Array(s)
        let maxInt32 = 2_147_483_647
        let minInt32 = -2_147_483_648

        var index = 0
        var sign = 1
        var value = 0

        // Phase 1: skip leading spaces.
        while index < characters.count && characters[index] == " " {
            index += 1
        }

        // Phase 2: process the optional sign.
        if index < characters.count {
            if characters[index] == "-" {
                sign = -1
                index += 1
            } else if characters[index] == "+" {
                index += 1
            }
        }

        // Phase 3: consume consecutive digits.
        while index < characters.count,
              let digit = characters[index].wholeNumberValue,
              digit <= 9 {
            let limit = sign == 1 ? maxInt32 : 2_147_483_648

            if value > limit / 10 ||
                (value == limit / 10 && digit > limit % 10) {
                return sign == 1 ? maxInt32 : minInt32
            }

            value = value * 10 + digit
            index += 1
        }

        return sign * value
    }
}
