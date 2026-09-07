class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let maximum = Int64(Int32.max)
        let minimum = Int64(Int32.min)

        // This is the only division whose mathematical result exceeds Int32.max.
        if dividend == Int(Int32.min) && divisor == -1 {
            return Int(maximum)
        }

        var remaining = abs(Int64(dividend))
        let divisorMagnitude = abs(Int64(divisor))
        var quotient: Int64 = 0

        // Build the quotient from its highest possible bit to its lowest.
        for shift in stride(from: 31, through: 0, by: -1) {
            if (remaining >> shift) >= divisorMagnitude {
                remaining -= divisorMagnitude << shift
                quotient += Int64(1) << shift
            }
        }

        if (dividend < 0) != (divisor < 0) {
            quotient = -quotient
        }

        return Int(min(max(quotient, minimum), maximum))
    }
}
