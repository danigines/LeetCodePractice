class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" { return "0" }

        let first = Array(num1.utf8.reversed())
        let second = Array(num2.utf8.reversed())
        var sum: [Int] = [] // Least-significant digit first.

        for (offset, multiplier) in second.enumerated() {
            var row = Array(repeating: 0, count: offset)
            var carry = 0

            for digit in first {
                let value = Int(digit - 48) * Int(multiplier - 48) + carry
                row.append(value % 10)
                carry = value / 10
            }

            if carry > 0 { row.append(carry) }

            var additionCarry = 0
            for index in row.indices {
                if index == sum.count { sum.append(0) }
                let value = sum[index] + row[index] + additionCarry
                sum[index] = value % 10
                additionCarry = value / 10
            }

            var index = row.count
            while additionCarry > 0 {
                if index == sum.count { sum.append(0) }
                let value = sum[index] + additionCarry
                sum[index] = value % 10
                additionCarry = value / 10
                index += 1
            }
        }

        let digits = sum.reversed().map { UInt8($0 + 48) }
        return String(decoding: digits, as: UTF8.self)
    }
}
