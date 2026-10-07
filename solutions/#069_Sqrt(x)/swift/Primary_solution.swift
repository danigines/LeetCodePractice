class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x >= 2 else { return x }

        var low = 1
        var high = x / 2
        var answer = 1

        while low <= high {
            let middle = low + (high - low) / 2

            if middle <= x / middle {
                answer = middle
                low = middle + 1
            } else {
                high = middle - 1
            }
        }

        return answer
    }
}
