class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let maximum = Int64(Int32.max)

        if dividend == Int(Int32.min) && divisor == -1 {
            return Int(maximum)
        }

        var remaining = abs(Int64(dividend))
        let divisorMagnitude = abs(Int64(divisor))
        var quotient: Int64 = 0

        while remaining >= divisorMagnitude {
            var currentDivisor = divisorMagnitude
            var currentQuotient: Int64 = 1

            // Find the largest doubled divisor that still fits.
            while (currentDivisor << 1) <= remaining {
                currentDivisor <<= 1
                currentQuotient <<= 1
            }

            remaining -= currentDivisor
            quotient += currentQuotient
        }

        if (dividend < 0) != (divisor < 0) {
            quotient = -quotient
        }

        return Int(quotient)
    }
}
