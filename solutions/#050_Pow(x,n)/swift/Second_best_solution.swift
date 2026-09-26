class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        let exponent = Int64(n)

        func power(_ base: Double, _ positiveExponent: Int64) -> Double {
            if positiveExponent == 0 { return 1.0 }

            let half = power(base, positiveExponent / 2)
            let squaredHalf = half * half

            return positiveExponent % 2 == 0
                ? squaredHalf
                : squaredHalf * base
        }

        return exponent >= 0
            ? power(x, exponent)
            : power(1.0 / x, -exponent)
    }
}
