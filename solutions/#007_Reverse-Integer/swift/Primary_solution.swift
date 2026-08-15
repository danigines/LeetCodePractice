class Solution {
    func reverse(_ x: Int) -> Int {
        let maxInt32 = 2_147_483_647
        let minInt32 = -2_147_483_648

        var remaining = x
        var reversed = 0

        while remaining != 0 {
            // Extract the last digit and remove it from the original number.
            let digit = remaining % 10
            remaining /= 10

            // Check whether reversed * 10 + digit would overflow Int32.
            if reversed > maxInt32 / 10 ||
                (reversed == maxInt32 / 10 && digit > 7) {
                return 0
            }

            if reversed < minInt32 / 10 ||
                (reversed == minInt32 / 10 && digit < -8) {
                return 0
            }

            reversed = reversed * 10 + digit
        }

        return reversed
    }
}
