class Solution {
    func countAndSay(_ n: Int) -> String {
        var current = "1"

        guard n > 1 else { return current }

        for _ in 2...n {
            let digits = Array(current.utf8)
            var next: [UInt8] = []
            var index = 0

            while index < digits.count {
                let digit = digits[index]
                var end = index + 1

                while end < digits.count && digits[end] == digit {
                    end += 1
                }

                // Describe this complete run as its count followed by its digit.
                next.append(contentsOf: String(end - index).utf8)
                next.append(digit)
                index = end
            }

            current = String(decoding: next, as: UTF8.self)
        }

        return current
    }
}
