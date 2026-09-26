class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var base = x
        var exponent = Int64(n)

        if exponent < 0 {
            base = 1.0 / base
            exponent = -exponent
        }

        var result = 1.0

        while exponent > 0 {
            if exponent % 2 == 1 {
                result *= base
            }

            base *= base
            exponent /= 2
        }

        return result
    }
}
